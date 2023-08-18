import 'package:flutter/foundation.dart';
import 'package:objectbox/internal.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'package:tag_music_player/objectbox.g.dart'; // created by `flutter pub run build_runner build`

import 'package:objectbox/objectbox.dart';
import 'package:tag_music_player/timoncode/models/tag.dart';
import 'package:tag_music_player/timoncode/models/song.dart';
import 'package:tag_music_player/timoncode/models/playbackFilter.dart';
import 'package:tag_music_player/timoncode/models/queue.dart';

/// Provides access to the ObjectBox Store throughout the app.
///
/// Create this in the apps main function.
class ObjectBox {
  /// The Store of this app.
  late final Store _store;

  // Keeping reference to avoid Admin getting closed.
  // ignore: unused_field
  late final Admin _admin;

  /// Two Boxes: one for Songs, one for Tags.
  late final Box<Song> _songBox;
  late final Box<Tag> _tagBox;
  late final Box<PlaybackFilter> _playbackFilterBox;
  late final Box<Queue> _queueBox;

  Box<Song> get getSongBox {
    return _songBox;
  }

  Box<Tag> get getTagBox {
    return _tagBox;
  }

  Box<PlaybackFilter> get getPlaybackFilterBox {
    return _playbackFilterBox;
  }

  ObjectBox._create(this._store) {
    // Optional: enable ObjectBox Admin on debug builds.
    // https://docs.objectbox.io/data-browser
    if (Admin.isAvailable()) {
      // Keep a reference until no longer needed or manually closed.
      _admin = Admin(_store);
    }

    _songBox = Box<Song>(_store);
    _tagBox = Box<Tag>(_store);
    _playbackFilterBox = Box<PlaybackFilter>(_store);
    _queueBox = Box<Queue>(_store);
  }

  /// Create an instance of ObjectBox to use throughout the app.
  static Future<ObjectBox> init() async {
    // Future<Store> openStore() {...} is defined in the generated objectbox.g.dart
    final store = await openStore(directory: p.join((await getApplicationDocumentsDirectory()).path, "obx"));
    return ObjectBox._create(store);
  }

  void saveSong(Song song) {
    try {
      _songBox.put(song);
    } catch (e) {
      throw e;
    }
  }

  void saveSongs(List<Song> songs) {
    try {
      _songBox.putMany(songs);
    } catch (e) {
      throw e;
    }
  }

  void saveSongsWithTags(List<Song> songs, List<Tag> tags) {
    try {
      List<int> tagIdList = List<int>.generate(tags.length, (index) => tags[index].id);
      for (int i = 0; i < songs.length; i++) {
        songs[i].tags.addAll(tags); //does its own check for duplicates
      }
      _songBox.putMany(songs);
    } catch (e) {
      throw e;
    }
  }

  void protectedSaveTagWithSongs(Tag tag, List<Song> songs) {
    Tag? existingTag = _tagBox.query(Tag_.name.equals(tag.name)).build().findFirst();
    if (existingTag != null) {
      tag = existingTag;
    }
    for (int i = 0; i < songs.length; i++) {
      Song? existingSong = _songBox.query(Song_.spotifyId.equals(songs[i].spotifyId)).build().findFirst();
      if (existingSong != null) {
        songs[i] = existingSong;
      }
    }
    tag.songs.addAll(songs);
    _tagBox.put(tag);
  }

  List<bool> checkWhichSongsAreNotUnique(List<Song> songs) {
    try {
      List<Song> allMatchingSongs = _songBox.query(Song_.spotifyId.oneOf(List<String>.generate(songs.length, (index) => songs[index].spotifyId))).build().find();
      List<String> matchingDbSpotifyIds = List<String>.generate(allMatchingSongs.length, (index) => allMatchingSongs[index].spotifyId);
      List<bool> ret = List<bool>.generate(songs.length, (index) => matchingDbSpotifyIds.contains(songs[index].spotifyId));
      return ret;
    } catch (e) {
      throw e;
    }
  }

  void saveTag(Tag tag) {
    try {
      _tagBox.put(tag);
    } catch (e) {
      throw e;
    }
  }

  List<Song> getSongsWithTag(Tag tag) {
    QueryBuilder<Song> queryBuilder = _songBox.query();
    queryBuilder.linkMany(Song_.tags, Tag_.name.equals(tag.name));
    return queryBuilder.build().find();
  }

  List<Song> getSongsWithTags(List<Tag> included, List<Tag> excluded) {
    QueryBuilder<Song> queryBuilder = _songBox.query();
    // queryBuilder.backlinkMany(Tag.,)
    queryBuilder.linkMany(
        Song_.tags,
        Tag_.id
            .oneOf(List<int>.generate(included.length, (index) => included[index].id))
            .and(Tag_.id.notOneOf(List<int>.generate(excluded.length, (index) => excluded[index].id))));
    return queryBuilder.build().find();
  }

  List<Song> getSongsMatchingSearch(String search) {
    return _songBox.query(Song_.name.contains(search)).build().find();
  }

  List<Tag> getTagsMatchingSearch(String search) {
    return _tagBox.query(Tag_.name.contains(search)).build().find();
  }

  List<String> getGeneratedTagsOfType(String tagType) {
    List<Tag> tags = _tagBox.query(Tag_.name.contains(tagType).and(Tag_.userDefined.equals(false))).build().find();
    List<String> ret = List<String>.generate(tags.length, (index) => tags[index].name.substring(tagType.length));
    return ret;
  }

  bool isTagNameUnique(String s) => _tagBox.query(Tag_.name.equals(s)).build().find().length == 0;

  // Stream<List<Song>> getSongs() {
  //   // Query for all songs, sorted by their date.
  //   // https://docs.objectbox.io/queries
  //   final qBuilderSongs =
  //       _songBox.query().order(Song_.dateCreated, flags: Order.descending);
  //   // Build and watch the query,
  //   // set triggerImmediately to emit the query immediately on listen.
  //   return qBuilderSongs
  //       .watch(triggerImmediately: true)
  //       // Map it to a list of songs to be used by a StreamBuilder.
  //       .map((query) => query.find());
  // }

  Song getSong(int id) => _songBox.get(id)!;

  // void saveSong(Song? song, String text, Tag tag) {
  // if (text.isEmpty) {
  //   // Do not allow an empty song text.
  //   // A real app might want to display an UI hint about that.
  //   return;
  // }
  // if (song == null) {
  //   // Add a new song (song id is 0).
  //   song = Song(text);
  // } else {
  //   // Update an existing song (song id is > 0).
  //   song.text = text;
  // }
  // Set or update the target of the to-one relation to Tag.
  // song.tag.target = tag;
  // _songBox.putAsync(song);
  // debugPrint('Saved song ${song.text} with tag ${song.tag.target!.name}');
  // }

  Future<void> finishSong(Song song) async {
    // song.toggleFinished();
    // await _songBox.putAsync(song);
  }

  void removeSong(int songId) => _songBox.removeAsync(songId);
  void removeSongs(List<Song> songs) {
    List<int> songIds = List<int>.generate(songs.length, (index) => songs[index].id);
    int deletedCount = _songBox.removeMany(songIds);
    print('Deleted ${deletedCount} songs');
  }

  // Future<int> addTag(String name) async {
  //   if (name.isEmpty) {
  //     // Do not allow an empty tag name.
  //     // A real app might want to display an UI hint about that.
  //     return -1;
  //   }
  //   // Do not allow adding a tag with an existing name.
  //   // A real app might want to display an UI hint about that.
  //   final existingTags = await _tagBox.getAllAsync();
  //   for (var existingTag in existingTags) {
  //     if (existingTag.name == name) {
  //       return -1;
  //     }
  //   }

  //   final newTagId = await _tagBox.putAsync(Tag(name));
  //   debugPrint("Added tag: ${_tagBox.get(newTagId)!.name}");

  //   return newTagId;
  // }

  Tag getTagById(int id) => _tagBox.get(id)!;
  List<Tag> getTagsById(List<int> ids) => ids.length > 0 ? _tagBox.query(Tag_.id.oneOf(ids)).build().find() : [];

  Tag getFirstTag() => _tagBox.query().build().findFirst()!;

  List<Tag> getAllTags() => _tagBox.getAll();
  List<Tag> getAllUserDefTags() {
    return _tagBox.query(Tag_.userDefined.equals(true)).build().find();
  }

  List<Tag> getAllPlaylistTags() {
    return _tagBox.query(Tag_.userDefined.equals(false).and(Tag_.name.contains('playlist: '))).build().find();
  }

  List<Tag> getAllGenreTags() {
    return _tagBox.query(Tag_.userDefined.equals(false).and(Tag_.name.contains('genre: '))).build().find();
  }

  void deleteTag(int tagId) {
    bool didDelete = _tagBox.remove(tagId);
    if (!didDelete) {
      print('Error: Tried to delete tag with id @${tagId}, did not work.');
    } else {
      print('Deleted tag with id: ${tagId}');
    }
  }

  Future<List<Tag>> getAllTagsAsync() => _tagBox.getAllAsync();

  List<PlaybackFilter> getPlaybackFilters() => _playbackFilterBox.getAll();
  PlaybackFilter? getPlaybackFilter(int id) => _playbackFilterBox.get(id);
  void saveFilter(PlaybackFilter filter) => _playbackFilterBox.put(filter);

  Future<void> saveQueue(Queue queue) async{
    _queueBox.put(queue);
  }

  Queue? loadQueue() => _queueBox.get(1);
}

late final ObjectBox objectBox;
