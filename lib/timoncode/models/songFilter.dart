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
  SongFilter? parentPointer;
  bool active;
  FilterCondition(
      {required this.type, this.parentPointer, this.active = true});
}

class TagNameFilterCondition extends FilterCondition {
  String tagName;
  bool include;
  void changeTagName(String s) {
    if(this.parentPointer!= null){
      this.parentPointer!.markChange();
    }
    this.tagName = s;
  }

  String toString() {
    return include ? '+' : '-' + tagName;
  }

  TagNameFilterCondition({
    this.tagName = '',
    this.include = false,
    required super.type,
    super.parentPointer,
    super.active = true,
  }){
    super.type = FilterType.name;
  }
}

class DateCreatedFilterCondition extends FilterCondition {
  DateTime? dateCreated;
  bool before;
  DateCreatedFilterCondition({
    this.dateCreated,
    this.before = false,
    required super.type,
    super.parentPointer,
    super.active = true,
  }){
    super.type = FilterType.dateCreated;
  }
}

class DateAddedFilterCondition extends FilterCondition {
  DateTime? dateAdded;
  bool before;
  DateAddedFilterCondition({
    this.dateAdded,
    this.before = false,
    required super.type,
    super.parentPointer,
    super.active = true,
  }){
    super.type = FilterType.dateAdded;
  }
}

class SongDurationFilterCondition extends FilterCondition {
  int duration;
  bool minimum;
  SongDurationFilterCondition({
    required this.duration,
    required this.minimum,
    required super.type,
    super.parentPointer,
    super.active = true,
  }){
    super.type = FilterType.songDuration;
  }
}

class ArtistFilterCondition extends FilterCondition {
  String artist;
  bool include;
  ArtistFilterCondition({
    required this.artist,
    required this.include,
    required super.type,
    super.parentPointer,
    super.active = true,
  }){
    super.type = FilterType.artist;
  }
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

  List<TagNameFilterCondition> _tnFilters = [];
  List<DateCreatedFilterCondition> _dcFilters = [];
  List<DateAddedFilterCondition> _daFilters = [];
  List<SongDurationFilterCondition> _sdFilters = [];
  List<ArtistFilterCondition> _aFilters = [];

  //can be further optimized by only reloading the specific query criteria which has a new element
  void addCondition(FilterCondition f) {
    queryIsSet = false;
    unprocessedConditions.add(f);
  }

  void addConditions(List<FilterCondition> f) {
    queryIsSet = false;
    unprocessedConditions.addAll(f);
  }

  void clear() {
    queryIsSet = false;
    unprocessedConditions = [];

    _tnFilters = [];
    _dcFilters = [];
    _daFilters = [];
    _sdFilters = [];
    _aFilters = [];
  }

  void markChange() {
    queryIsSet = false;
  }

  List<String> toMultilineString() {
    List<String> ret = [];
    String tagsInc = '';
    String tagsEx = '';
    for (int i = 0; i < _tnFilters.length; i++) {
      if (_tnFilters[i].include) {
        tagsInc += _tnFilters[i].tagName + ', ';
      } else {
        tagsEx += _tnFilters[i].tagName + ', ';
      }
    }
    if (tagsInc.length > 0) {
      tagsInc = tagsInc.substring(0, tagsInc.length - 1);
    }
    if (tagsEx.length > 0) {
      tagsEx = tagsEx.substring(0, tagsEx.length - 1);
    }
    ret.add(tagsInc);
    ret.add(tagsEx);

    return ret;
  }

  QueryBuilder<Song> getQueryBuilder() {
    if (queryB == null || !queryIsSet) {
      return generateQuery();
    }
    return queryB!;
  }

  QueryBuilder<Song> generateQuery() {
    List<String> includeStrings = [];
    Condition<Song> conditionStack = Song_.spotifyId.notNull();

    clear();

    //split filters into types
    for (int i = 0; i < unprocessedConditions.length; i++) {
      if (!unprocessedConditions[i].active) {
        continue;
      }
      switch (unprocessedConditions[i].type) {
        case FilterType.name:
          _tnFilters.add(unprocessedConditions[i] as TagNameFilterCondition);
          break;
        case FilterType.dateCreated:
          _dcFilters
              .add(unprocessedConditions[i] as DateCreatedFilterCondition);
          break;
        case FilterType.dateAdded:
          _daFilters.add(unprocessedConditions[i] as DateAddedFilterCondition);
          break;
        case FilterType.songDuration:
          _sdFilters
              .add(unprocessedConditions[i] as SongDurationFilterCondition);
          break;
        case FilterType.artist:
          _aFilters.add(unprocessedConditions[i] as ArtistFilterCondition);
          break;

        default:
      }
    }

    //Handles Date Created Filters
    conditionStack = handleDcFilters(conditionStack, _dcFilters);

    //Handles Date Added Filters
    conditionStack = handleDaFilters(conditionStack, _daFilters);

    //Handles Song Duration Filters
    conditionStack = handleSdFilters(conditionStack, _sdFilters);

    //Handles Artist Filters
    //it's one line so it doesn't get a function compared to the average 30 lines
    conditionStack.and(Song_.artist.oneOf(List<String>.generate(
        _aFilters.length, (index) => _aFilters[index].artist)));

    //final condition entered. All after can only be of the format "oneOf"
    QueryBuilder<Song> qb = objectBox.getSongBox.query(conditionStack);

    includeStrings = handleTagNamesFilters(_tnFilters);

    //handle tag name strings
    qb.linkMany(Song_.tags, Tag_.name.oneOf(includeStrings));

    queryB = qb;
    queryIsSet = true;

    return qb;
  }
}

Condition<Song> handleDcFilters(Condition<Song> conditionStack,
    List<DateCreatedFilterCondition> _dcFilters) {
  DateTime? earliestBefore;
  DateTime? latestAfter;
  for (int i = 0; i < _dcFilters.length; i++) {
    if (_dcFilters[i].before) {
      if (earliestBefore == null) {
        earliestBefore = _dcFilters[i].dateCreated!;
      } else {
        if (earliestBefore.isAfter(_dcFilters[i].dateCreated!)) {
          earliestBefore = _dcFilters[i].dateCreated!;
        }
      }
    } else {
      if (latestAfter == null) {
        latestAfter = _dcFilters[i].dateCreated!;
      } else {
        if (latestAfter.isBefore(_dcFilters[i].dateCreated!)) {
          latestAfter = _dcFilters[i].dateCreated!;
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
    Condition<Song> conditionStack, List<DateAddedFilterCondition> _daFilters) {
  DateTime? earliestBefore;
  DateTime? latestAfter;
  for (int i = 0; i < _daFilters.length; i++) {
    if (_daFilters[i].before) {
      if (earliestBefore == null) {
        earliestBefore = _daFilters[i].dateAdded!;
      } else {
        if (earliestBefore.isAfter(_daFilters[i].dateAdded!)) {
          earliestBefore = _daFilters[i].dateAdded!;
        }
      }
    } else {
      if (latestAfter == null) {
        latestAfter = _daFilters[i].dateAdded!;
      } else {
        if (latestAfter.isBefore(_daFilters[i].dateAdded!)) {
          latestAfter = _daFilters[i].dateAdded!;
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
    List<SongDurationFilterCondition> _sdFilters) {
  int? shortestShorterThan;
  int? longestLongerThan;
  for (int i = 0; i < _sdFilters.length; i++) {
    if (_sdFilters[i].duration != null) {
      if (shortestShorterThan == null) {
        shortestShorterThan = _sdFilters[i].duration;
      } else {
        if (shortestShorterThan > _sdFilters[i].duration) {
          shortestShorterThan = _sdFilters[i].duration;
        }
      }
    } else {
      if (longestLongerThan == null) {
        longestLongerThan = _sdFilters[i].duration;
      } else {
        if (longestLongerThan < _sdFilters[i].duration) {
          longestLongerThan = _sdFilters[i].duration;
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

List<String> handleTagNamesFilters(List<TagNameFilterCondition> _tnFilters) {
  List<String> exclude = [];
  List<int> includeIndexes = [];
  List<String> include = [];
  for (int i = 0; i < _tnFilters.length; i++) {
    if (!_tnFilters[i].include) {
      exclude.add(_tnFilters[i].tagName);
    } else {
      includeIndexes.add(i);
    }
  }
  for (int i = 0; i < includeIndexes.length; i++) {
    include.add(_tnFilters[includeIndexes[i]].tagName);
  }
  return include;
}
