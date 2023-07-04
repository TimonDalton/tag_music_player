import 'package:tag_music_player/timoncode/objectbox.dart';
import 'package:tag_music_player/timoncode/models/song.dart';
import 'package:tag_music_player/timoncode/models/tag.dart';
import 'package:collection/collection.dart';
import 'package:tag_music_player/objectbox.g.dart';

const bool printBuildProcess = true;
void printD(String s) {
  if (printBuildProcess) {
    print(s);
  }
}

enum FilterType {
  none,
  tag,
  dateCreated,
  dateAdded,
  songDuration,
  artist,
}

class FilterCondition {
  FilterType type;
  SongFilter? parentPointer;
  bool active;
  FilterCondition({required this.type, this.parentPointer, this.active = true});
}

class TagFilterCondition extends FilterCondition {
  int tagId;
  bool include;
  void changeTagName(int id) {
    if (this.parentPointer != null) {
      this.parentPointer!.markChange();
    }
    this.tagId = id;
  }

  String toString() {
    return include ? '+' : '-' + tagId.toString();
  }

  TagFilterCondition({
    this.tagId = 0,
    this.include = false,
    super.type = FilterType.tag,
    super.parentPointer,
    super.active = true,
  });
}

class DateCreatedFilterCondition extends FilterCondition {
  DateTime? dateCreated;
  bool before;
  DateCreatedFilterCondition({
    this.dateCreated,
    this.before = false,
    super.type = FilterType.dateCreated,
    super.parentPointer,
    super.active = true,
  });
}

class DateAddedFilterCondition extends FilterCondition {
  DateTime? dateAdded;
  bool before;
  DateAddedFilterCondition({
    this.dateAdded,
    this.before = false,
    super.type = FilterType.dateAdded,
    super.parentPointer,
    super.active = true,
  });
}

class SongDurationFilterCondition extends FilterCondition {
  Duration duration;
  bool minimum;
  SongDurationFilterCondition({
    required this.duration,
    required this.minimum,
    super.type = FilterType.songDuration,
    super.parentPointer,
    super.active = true,
  });
}

class ArtistFilterCondition extends FilterCondition {
  String artist;
  ArtistFilterCondition({
    required this.artist,
    super.type= FilterType.artist,
    super.parentPointer,
    super.active = true,
  });
}

class SongFilter {
  List<FilterCondition> unprocessedConditions = [];

  SongFilter({
    this.unprocessedConditions = const [],
    this.queryB = null,
    this.queryIsSet = false,
  }){
    clearProcessed();
  }
  QueryBuilder<Song>? queryB;
  bool queryIsSet;

  List<TagFilterCondition> _tidFilters = [];
  List<DateCreatedFilterCondition> _dcFilters = [];
  List<DateAddedFilterCondition> _daFilters = [];
  List<SongDurationFilterCondition> _sdFilters = [];
  List<ArtistFilterCondition> _aFilters = [];

  List<int> includedTagIds = [];
  List<int> excludedTagIds = [];
  late DateCreatedFilterCondition earliestBefDC;
  late DateCreatedFilterCondition latestAfDC;
  late DateAddedFilterCondition earliestBefDA;
  late DateAddedFilterCondition latestAfDA;
  late SongDurationFilterCondition shortestShorterSD;
  late SongDurationFilterCondition longestLongerSD;
  List<String> allowedArtists = [];

  //can be further optimized by only reloading the specific query criteria which has a new element
  void addCondition(FilterCondition f) {
    queryIsSet = false;
    unprocessedConditions.add(f);
  }

  void addConditions(List<FilterCondition> f) {
    queryIsSet = false;
    unprocessedConditions.addAll(f);
  }

  void clearProcessed() {
    print('clearing proccessed filters');
    queryIsSet = false;

    _tidFilters = [];
    _dcFilters = [];
    _daFilters = [];
    _sdFilters = [];
    _aFilters = [];

    includedTagIds = [];
    excludedTagIds = [];
    earliestBefDC = DateCreatedFilterCondition(type: FilterType.dateCreated, active: false, before: true);
    latestAfDC = DateCreatedFilterCondition(type: FilterType.dateCreated, active: false, before: false);
    earliestBefDA = DateAddedFilterCondition(type: FilterType.dateAdded, active: false, before: true);
    latestAfDA = DateAddedFilterCondition(type: FilterType.dateAdded, active: false, before: false);
    shortestShorterSD = SongDurationFilterCondition(type: FilterType.songDuration, active: false, minimum: false, duration: Duration.zero);
    longestLongerSD = SongDurationFilterCondition(type: FilterType.songDuration, active: false, minimum: true, duration: Duration.zero);
    allowedArtists = [];
  }

  void markChange() {
    queryIsSet = false;
  }

  List<Song> getSongs(){
    try {
      List<Song> songs = getQueryBuilder().build().find();
      print('built songs from: ');
      print(toMultilineString());
      return songs;
    } catch (e) {
      print('Songs queryBuilder Error');
      print(StackTrace.current.toString());
      print(e);
      print('Filter state: ');
      print(getQueryBuilder.toString());
      print(toMultilineString());
      return [];
    }
  }

  List<String> toMultilineString() {
    List<String> ret = [];//['Filter Config: Currently has ${unprocessedConditions.length} filters'];
    String tagsInc = 'Included Tags: ';
    List<Tag> tags = objectBox.getAllTags();
    for (int i = 0; i < includedTagIds.length; i++) {
      tagsInc += tags.firstWhere((tag) => tag.id == includedTagIds[i]).name + ', ';
    }
    if (includedTagIds.length > 0) {
      tagsInc = tagsInc.substring(0, tagsInc.length - 1);
      ret.add(tagsInc);
    }
    String tagsEx = 'Excluded Tags: ';
    for (int i = 0; i < excludedTagIds.length; i++) {
      tagsEx += tags.firstWhere((tag) => tag.id == excludedTagIds[i]).name + ', ';
    }
    if (excludedTagIds.length > 0) {
      tagsEx = tagsEx.substring(0, tagsEx.length - 1);
      ret.add(tagsEx);
    }
    String allowedArtistsStr = 'Allowed Artists: ';
    for (int i = 0; i < allowedArtists.length; i++) {
      allowedArtistsStr += allowedArtists[i] + ', ';
    }
    if (allowedArtists.length > 0) {
      allowedArtistsStr = allowedArtistsStr.substring(0, tagsEx.length - 1);
      ret.add(allowedArtistsStr);
    }
    if (earliestBefDA.active) {
      ret.add('Added before ${earliestBefDC.dateCreated.toString()}');
    }
    if (latestAfDC.active) {
      ret.add('Added After ${latestAfDC.dateCreated.toString()}');
    }
    if (earliestBefDC.active) {
      ret.add('Released Before ${latestAfDC.dateCreated.toString()}');
    }
    if (latestAfDC.active) {
      ret.add('Released After ${latestAfDC.dateCreated.toString()}');
    }
    if(ret.length == 0){
      ret.add('None');
      print('unprocessedConditions');
      print(unprocessedConditions);
    }
    return ret;
  }

  QueryBuilder<Song> getQueryBuilder() {
    if (queryB == null || !queryIsSet) {
      return generateQuery();
    }
    return queryB!;
  }

  void becomeCloneOf(SongFilter newFilter) {
    //clears all before copy
    // clearProcessed();
    unprocessedConditions = [];

    if (newFilter.includedTagIds.length > 0) {
      for (int i = 0; i < newFilter.includedTagIds.length; i++) {
        unprocessedConditions.add(TagFilterCondition(tagId: newFilter.includedTagIds[i], include: true, type: FilterType.tag));
      }
      // includedTagIds = newFilter.includedTagIds;
    }
    if (newFilter.excludedTagIds.length > 0) {
      for (int i = 0; i < newFilter.excludedTagIds.length; i++) {
        unprocessedConditions.add(TagFilterCondition(tagId: newFilter.excludedTagIds[i], include: false, type: FilterType.tag));
      }
      // excludedTagIds = newFilter.excludedTagIds;
    }
    if (newFilter.earliestBefDC.active) {
      unprocessedConditions.add(newFilter.earliestBefDC);
      // earliestBefDC = newFilter.earliestBefDC;
    }
    if (newFilter.latestAfDC.active) {
      unprocessedConditions.add(newFilter.latestAfDC);
      // latestAfDC = newFilter.latestAfDC;
    }
    if (newFilter.earliestBefDA.active) {
      unprocessedConditions.add(newFilter.earliestBefDA);
      // earliestBefDA = newFilter.earliestBefDA;
    }
    if (newFilter.latestAfDA.active) {
      unprocessedConditions.add(newFilter.latestAfDA);
      // latestAfDA = newFilter.latestAfDA;
    }
    if (newFilter.shortestShorterSD.active) {
      unprocessedConditions.add(newFilter.shortestShorterSD);
      // shortestShorterSD = newFilter.shortestShorterSD;
    }
    if (newFilter.longestLongerSD.active) {
      unprocessedConditions.add(newFilter.longestLongerSD);
      // longestLongerSD = newFilter.longestLongerSD;
    }
    if (newFilter.allowedArtists.length > 0) {
      for (int i = 0; i < allowedArtists.length; i++) {
        unprocessedConditions.add(ArtistFilterCondition(artist: allowedArtists[i], type: FilterType.artist));
      }
      // allowedArtists = newFilter.allowedArtists;
    }
    generateQuery();
  }

  QueryBuilder<Song> generateQuery() {
    Condition<Song> conditionStack = Song_.spotifyId.notNull();

    clearProcessed();

    printD('Unprocessed Filters: length = ${unprocessedConditions.length}, filters:');
    //split filters into types
    for (int i = 0; i < unprocessedConditions.length; i++) {
      if (!unprocessedConditions[i].active) {
        continue;
      }
      printD(unprocessedConditions[i].type.toString());
      switch (unprocessedConditions[i].type) {
        case FilterType.tag:
          _tidFilters.add(unprocessedConditions[i] as TagFilterCondition);
          break;
        case FilterType.dateCreated:
          _dcFilters.add(unprocessedConditions[i] as DateCreatedFilterCondition);
          break;
        case FilterType.dateAdded:
          _daFilters.add(unprocessedConditions[i] as DateAddedFilterCondition);
          break;
        case FilterType.songDuration:
          _sdFilters.add(unprocessedConditions[i] as SongDurationFilterCondition);
          break;
        case FilterType.artist:
          _aFilters.add(unprocessedConditions[i] as ArtistFilterCondition);
          break;

        default:
      }
    }

    //Handles Date Created Filters
    conditionStack = handleDcFilters(conditionStack, _dcFilters, earliestBefDC, latestAfDC);

    //Handles Date Added Filters
    conditionStack = handleDaFilters(conditionStack, _daFilters, earliestBefDA, latestAfDA);

    //Handles Song Duration Filters
    conditionStack = handleSdFilters(conditionStack, _sdFilters, shortestShorterSD, longestLongerSD);

    //Handles Artist Filters
    allowedArtists = List<String>.generate(_aFilters.length, (index) => _aFilters[index].artist);

    if (allowedArtists.length > 0) {
      conditionStack.and(Song_.artist.oneOf(allowedArtists));
    }
    //final condition entered. All after can only be of the format "oneOf"
    QueryBuilder<Song> qb = objectBox.getSongBox.query(conditionStack);

    handleTidFilters(_tidFilters, includedTagIds, excludedTagIds);
    //handletag name strings
    if (includedTagIds.length > 0 && excludedTagIds.length > 0) {
      qb.linkMany(Song_.tags, Tag_.id.oneOf(includedTagIds).and(Tag_.id.notOneOf(excludedTagIds)));
    } else {
      if (includedTagIds.length > 0) {
        qb.linkMany(Song_.tags, Tag_.id.oneOf(includedTagIds));
      } else if (excludedTagIds.length > 0) {
        qb.linkMany(Song_.tags, Tag_.id.notOneOf(excludedTagIds));
      }
    }

    queryB = qb;
    queryIsSet = true;

    return qb;
  }
}

Condition<Song> handleDcFilters(
    Condition<Song> conditionStack, List<DateCreatedFilterCondition> _dcFilters, DateCreatedFilterCondition earliestBeforeFC, DateCreatedFilterCondition latestAfterFC) {
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
  if (printBuildProcess) {
    printD('Date Created Filters: ');
    if (earliestBefore != null) {
      print('Earliest Before: ');
      print(earliestBefore.microsecondsSinceEpoch);
    }
    if (latestAfter != null) {
      print('Latest After: ');
      print(latestAfter.microsecondsSinceEpoch);
    }
  }
  if (earliestBefore != null) {
    conditionStack = conditionStack.and(Song_.releaseDate.lessThan(earliestBefore.microsecondsSinceEpoch)); //TODO figure out how objectBox compares dates
    earliestBeforeFC.dateCreated = earliestBefore;
    earliestBeforeFC.active = true;
  }
  if (latestAfter != null) {
    conditionStack = conditionStack.and(Song_.releaseDate.greaterThan(latestAfter.microsecondsSinceEpoch)); //TODO figure out how objectBox compares dates
    latestAfterFC.dateCreated = earliestBefore;
    latestAfterFC.active = true;
  }
  return conditionStack;
}

Condition<Song> handleDaFilters(
    Condition<Song> conditionStack, List<DateAddedFilterCondition> _daFilters, DateAddedFilterCondition earliestBeforeDA, DateAddedFilterCondition latestAfterDA) {
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
  if (printBuildProcess) {
    printD('Date Added Filters: ');
    if (earliestBefore != null) {
      print('Earliest Before: ');
      print(earliestBefore.microsecondsSinceEpoch);
    }
    if (latestAfter != null) {
      print('Latest After: ');
      print(latestAfter.microsecondsSinceEpoch);
    }
  }
  if (earliestBefore != null) {
    conditionStack = conditionStack.and(Song_.dateAdded.lessThan(earliestBefore.microsecondsSinceEpoch)); //TODO figure out how objectBox compares dates
    earliestBeforeDA.active = true;
    earliestBeforeDA.dateAdded = earliestBefore;
  }
  if (latestAfter != null) {
    conditionStack = conditionStack.and(Song_.dateAdded.greaterThan(latestAfter.microsecondsSinceEpoch)); //TODO figure out how objectBox compares dates
    earliestBeforeDA.active = true;
    earliestBeforeDA.dateAdded = earliestBefore;
  }
  return conditionStack;
}

Condition<Song> handleSdFilters(Condition<Song> conditionStack, List<SongDurationFilterCondition> _sdFilters, SongDurationFilterCondition shortestShorterThanFC,
    SongDurationFilterCondition longestLongerThanFC) {
  Duration? shortestShorterThan;
  Duration? longestLongerThan;
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
  if (printBuildProcess) {
    printD('Song Duration Filters: ');
    if (shortestShorterThan != null) {
      print('Shortest Shorter Than: ');
      print(shortestShorterThan);
    }
    if (longestLongerThan != null) {
      print('Longest Longer Than: ');
      print(longestLongerThan);
    }
  }
  if (shortestShorterThan != null) {
    conditionStack = conditionStack.and(Song_.duration.lessThan(shortestShorterThan.inMilliseconds)); //TODO figure out how objectBox compares dates
    shortestShorterThanFC.active = true;
    shortestShorterThanFC.duration = shortestShorterThan;
  }
  if (longestLongerThan != null) {
    conditionStack = conditionStack.and(Song_.duration.greaterThan(longestLongerThan.inMilliseconds)); //TODO figure out how objectBox compares dates
    longestLongerThanFC.active = true;
    longestLongerThanFC.duration = longestLongerThan;
  }
  return conditionStack;
}

void handleTidFilters(List<TagFilterCondition> _tidFilters, List<int> include, List<int> exclude) {
  for (int i = 0; i < _tidFilters.length; i++) {
    if (_tidFilters[i].include) {
      include.add(_tidFilters[i].tagId);
    } else {
      exclude.add(_tidFilters[i].tagId);
    }
  }
  printD('Include Filters:');
  if (printBuildProcess) {
    print('Song Tag Included Filters');
    print(include);
    print('Song Tag Exclude Filters');
    print(exclude);
  }
}
