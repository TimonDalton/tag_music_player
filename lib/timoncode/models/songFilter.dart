import 'package:tag_music_player/timoncode/objectbox.dart';
import 'package:tag_music_player/timoncode/models/song.dart';
import 'package:tag_music_player/objectbox.g.dart';

enum FilterType {
  none,
  name,
  dateCreated,
  dateAdded,
  songDuration,
  artist,
}

class FilterCondition {
  FilterType type;
  SongFilter parentPointer;
  bool active;
  FilterCondition(
      {required this.type, required this.parentPointer, this.active = true});
}

class TagNameFilterCondition extends FilterCondition {
  String tagName;
  bool include;
  void changeTagName(String s) {
    this.parentPointer.markChange();
    this.tagName = s;
  }

  TagNameFilterCondition({
    this.tagName = '',
    this.include = false,
    required super.type,
    required super.parentPointer,
    super.active = true,
  });
}

class DateCreatedFilterCondition extends FilterCondition {
  DateTime? dateCreated;
  bool before;
  DateCreatedFilterCondition({
    this.dateCreated,
    this.before = false,
    required super.type,
    required super.parentPointer,
    super.active = true,
  });
}

class DateAddedFilterCondition extends FilterCondition {
  DateTime? dateAdded;
  bool before;
  DateAddedFilterCondition({
    this.dateAdded,
    this.before = false,
    required super.type,
    required super.parentPointer,
    super.active = true,
  });
}

class SongDurationFilterCondition extends FilterCondition {
  int duration;
  bool minimum;
  SongDurationFilterCondition({
    required this.duration,
    required this.minimum,
    required super.type,
    required super.parentPointer,
    super.active = true,
  });
}

class ArtistFilterCondition extends FilterCondition {
  String artist;
  bool include;
  ArtistFilterCondition({
    required this.artist,
    required this.include,
    required super.type,
    required super.parentPointer,
    super.active = true,
  });
}

class SongFilter {
  List<FilterCondition> unprocessedConditions = [];

  SongFilter({
    this.unprocessedConditions = const [],
    this.queryB = null,
    this.queryIsSet = false,
  });
  QueryBuilder<Song>? queryB;
  bool queryIsSet;

  //can be further optimized by only reloading the specific query criteria which has a new element
  void addCondition(FilterCondition f) {
    queryIsSet = false;
    unprocessedConditions.add(f);
  }

  void addConditions(List<FilterCondition> f) {
    queryIsSet = false;
    unprocessedConditions.addAll(f);
  }

  void clear(List<FilterCondition> f) {
    queryIsSet = false;
    unprocessedConditions = [];
  }

  void markChange() {
    queryIsSet = false;
  }

  QueryBuilder<Song> getQueryBuilder() {
    if (queryB == null || !queryIsSet) {
      return generateQuery();
    }
    return queryB!;
  }

  QueryBuilder<Song> generateQuery() {
    List<String> includeStrings = [];
    Condition<Song> conditionStack = Song_.id.notNull();

    List<TagNameFilterCondition> tnFilters = [];
    List<DateCreatedFilterCondition> dcFilters = [];
    List<DateAddedFilterCondition> daFilters = [];
    List<SongDurationFilterCondition> sdFilters = [];
    List<ArtistFilterCondition> aFilters = [];

    //split filters into types
    for (int i = 0; i < unprocessedConditions.length; i++) {
      if (!unprocessedConditions[i].active) {
        continue;
      }
      switch (unprocessedConditions[i].type) {
        case FilterType.name:
          tnFilters.add(unprocessedConditions[i] as TagNameFilterCondition);
          break;
        case FilterType.dateCreated:
          dcFilters.add(unprocessedConditions[i] as DateCreatedFilterCondition);
          break;
        case FilterType.dateAdded:
          daFilters.add(unprocessedConditions[i] as DateAddedFilterCondition);
          break;
        case FilterType.songDuration:
          sdFilters
              .add(unprocessedConditions[i] as SongDurationFilterCondition);
          break;
        case FilterType.artist:
          aFilters.add(unprocessedConditions[i] as ArtistFilterCondition);
          break;

        default:
      }
    }

    //Handles Date Created Filters
    conditionStack = handleDcFilters(conditionStack, dcFilters);

    //Handles Date Added Filters
    conditionStack = handleDaFilters(conditionStack, daFilters);

    //Handles Song Duration Filters
    conditionStack = handleSdFilters(conditionStack, sdFilters);

    //Handles Artist Filters
    //it's one line so it doesn't get a function compared to the average 30 lines
    conditionStack.and(Song_.artist.oneOf(List<String>.generate(
        aFilters.length, (index) => aFilters[index].artist)));

    //final condition entered. All after can only be of the format "oneOf"
    QueryBuilder<Song> qb = objectBox.getSongBox.query(conditionStack);

    includeStrings = handleTagNamesFilters(tnFilters);

    //handle tag name strings
    qb.linkMany(Song_.tags, Tag_.name.oneOf(includeStrings));

    queryB = qb;
    queryIsSet = true;

    return qb;
  }
}

Condition<Song> handleDcFilters(Condition<Song> conditionStack,
    List<DateCreatedFilterCondition> dcFilters) {
  DateTime? earliestBefore;
  DateTime? latestAfter;
  for (int i = 0; i < dcFilters.length; i++) {
    if (dcFilters[i].before) {
      if (earliestBefore == null) {
        earliestBefore = dcFilters[i].dateCreated!;
      } else {
        if (earliestBefore.isAfter(dcFilters[i].dateCreated!)) {
          earliestBefore = dcFilters[i].dateCreated!;
        }
      }
    } else {
      if (latestAfter == null) {
        latestAfter = dcFilters[i].dateCreated!;
      } else {
        if (latestAfter.isBefore(dcFilters[i].dateCreated!)) {
          latestAfter = dcFilters[i].dateCreated!;
        }
      }
    }
  }
  if (earliestBefore != null) {
    conditionStack = conditionStack.and(Song_.releaseDate.lessThan(earliestBefore
        .microsecondsSinceEpoch)); //TODO figure out how objectBox compares dates
  }
  if (latestAfter != null) {
    conditionStack = conditionStack.and(Song_.releaseDate.greaterThan(latestAfter
        .microsecondsSinceEpoch)); //TODO figure out how objectBox compares dates
  }
  return conditionStack;
}

Condition<Song> handleDaFilters(
    Condition<Song> conditionStack, List<DateAddedFilterCondition> daFilters) {
  DateTime? earliestBefore;
  DateTime? latestAfter;
  for (int i = 0; i < daFilters.length; i++) {
    if (daFilters[i].before) {
      if (earliestBefore == null) {
        earliestBefore = daFilters[i].dateAdded!;
      } else {
        if (earliestBefore.isAfter(daFilters[i].dateAdded!)) {
          earliestBefore = daFilters[i].dateAdded!;
        }
      }
    } else {
      if (latestAfter == null) {
        latestAfter = daFilters[i].dateAdded!;
      } else {
        if (latestAfter.isBefore(daFilters[i].dateAdded!)) {
          latestAfter = daFilters[i].dateAdded!;
        }
      }
    }
  }
  if (earliestBefore != null) {
    conditionStack = conditionStack.and(Song_.dateAdded.lessThan(earliestBefore
        .microsecondsSinceEpoch)); //TODO figure out how objectBox compares dates
  }
  if (latestAfter != null) {
    conditionStack = conditionStack.and(Song_.dateAdded.greaterThan(latestAfter
        .microsecondsSinceEpoch)); //TODO figure out how objectBox compares dates
  }
  return conditionStack;
}

Condition<Song> handleSdFilters(Condition<Song> conditionStack,
    List<SongDurationFilterCondition> sdFilters) {
  int? shortestShorterThan;
  int? longestLongerThan;
  for (int i = 0; i < sdFilters.length; i++) {
    if (sdFilters[i].duration != null) {
      if (shortestShorterThan == null) {
        shortestShorterThan = sdFilters[i].duration;
      } else {
        if (shortestShorterThan > sdFilters[i].duration) {
          shortestShorterThan = sdFilters[i].duration;
        }
      }
    } else {
      if (longestLongerThan == null) {
        longestLongerThan = sdFilters[i].duration;
      } else {
        if (longestLongerThan < sdFilters[i].duration) {
          longestLongerThan = sdFilters[i].duration;
        }
      }
    }
  }
  if (shortestShorterThan != null) {
    conditionStack = conditionStack.and(Song_.duration.lessThan(
        shortestShorterThan)); //TODO figure out how objectBox compares dates
  }
  if (longestLongerThan != null) {
    conditionStack = conditionStack.and(Song_.duration.greaterThan(
        longestLongerThan)); //TODO figure out how objectBox compares dates
  }
  return conditionStack;
}

List<String> handleTagNamesFilters(List<TagNameFilterCondition> tnFilters) {
  List<String> exclude = [];
  List<int> includeIndexes = [];
  List<String> include = [];
  for (int i = 0; i < tnFilters.length; i++) {
    if (!tnFilters[i].include) {
      exclude.add(tnFilters[i].tagName);
    } else {
      includeIndexes.add(i);
    }
  }
  for (int i = 0; i < includeIndexes.length; i++) {
    include.add(tnFilters[includeIndexes[i]].tagName);
  }
  return include;
}
