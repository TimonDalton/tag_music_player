import 'package:flutter/foundation.dart';
import 'package:objectbox/internal.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'package:tag_music_player/objectbox.g.dart'; // created by `flutter pub run build_runner build`

import 'package:objectbox/objectbox.dart';
import 'package:tag_music_player/timoncode/models/tag.dart';
import 'package:tag_music_player/timoncode/models/song.dart';

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

  Box<Song> get getSongBox {
    return _songBox;
  }

  Box<Tag> get getTagBox {
    return _tagBox;
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
  }

  /// Create an instance of ObjectBox to use throughout the app.
  static Future<ObjectBox> init() async {
    // Future<Store> openStore() {...} is defined in the generated objectbox.g.dart
    final store = await openStore(
        directory:
            p.join((await getApplicationDocumentsDirectory()).path, "obx"));
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
      for (int i = 0; i < tags.length; i++) {
        songs[i].tags.addAll(tags);
      }
      _songBox.putMany(songs);
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
        Tag_.id.oneOf(
          List<int>.generate(included.length, (index) => included[index].id))
        .and(Tag_.id.notOneOf(
          List<int>.generate(excluded.length, (index) => excluded[index].id))
          ));
    return queryBuilder.build().find();
  }

  List<Song> getSongsMatchingSearch(String search){
    return _songBox.query(Song_.name.contains(search)).build().find();
  }
  
  List<Tag> getTagsMatchingSearch(String search){
    return _tagBox.query(Tag_.name.contains(search)).build().find();
  }


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

  Tag getTag(int id) => _tagBox.get(id)!;

  Tag getFirstTag() => _tagBox.query().build().findFirst()!;

  List<Tag> getAllTags() => _tagBox.getAll();

  Future<List<Tag>> getAllTagsAsync() => _tagBox.getAllAsync();
}

late final ObjectBox objectBox;
