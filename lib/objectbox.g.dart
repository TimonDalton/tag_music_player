// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types, depend_on_referenced_packages
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'timoncode/models/playbackFilter.dart';
import 'timoncode/models/queue.dart';
import 'timoncode/models/song.dart';
import 'timoncode/models/tag.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 9010798967777340560),
      name: 'Song',
      lastPropertyId: const IdUid(8, 5867635433896042515),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 7159351169199739191),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 3115723590380257770),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 8594253787416493472),
            name: 'artist',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 614895528964824454),
            name: 'spotifyId',
            type: 9,
            flags: 2080,
            indexId: const IdUid(1, 3324877264777455464)),
        ModelProperty(
            id: const IdUid(6, 2913082945644414994),
            name: 'dateAdded',
            type: 10,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 4633956051513000642),
            name: 'releaseDate',
            type: 10,
            flags: 0),
        ModelProperty(
            id: const IdUid(8, 5867635433896042515),
            name: 'duration',
            type: 6,
            flags: 0)
      ],
      relations: <ModelRelation>[
        ModelRelation(
            id: const IdUid(1, 2933435051223473136),
            name: 'tags',
            targetId: const IdUid(2, 3379074201238304732))
      ],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(2, 3379074201238304732),
      name: 'Tag',
      lastPropertyId: const IdUid(5, 8200168161526390469),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(2, 190164107148731585),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(3, 4695901502359810162),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 1302384689009912107),
            name: 'colourIndex',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 8200168161526390469),
            name: 'userDefined',
            type: 1,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[
        ModelBacklink(name: 'songs', srcEntity: 'Song', srcField: '')
      ]),
  ModelEntity(
      id: const IdUid(7, 2557409868432952656),
      name: 'PlaybackFilter',
      lastPropertyId: const IdUid(5, 8766596034594712122),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 7586258636854530005),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 2872838993623638644),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 8369491077183155537),
            name: 'lastAccessed',
            type: 10,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 8187612926945003173),
            name: 'dbTotalByVersion',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[
        ModelRelation(
            id: const IdUid(2, 6374847314963343384),
            name: 'tags',
            targetId: const IdUid(2, 3379074201238304732))
      ],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(8, 711625210571341736),
      name: 'Queue',
      lastPropertyId: const IdUid(1, 9037085816497558069),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 9037085816497558069),
            name: 'id',
            type: 6,
            flags: 1)
      ],
      relations: <ModelRelation>[
        ModelRelation(
            id: const IdUid(3, 569238654345829646),
            name: 'songs',
            targetId: const IdUid(1, 9010798967777340560))
      ],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(8, 711625210571341736),
      lastIndexId: const IdUid(1, 3324877264777455464),
      lastRelationId: const IdUid(3, 569238654345829646),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [
        8001341518230850695,
        2695809420363043732,
        6305852949951424807,
        7901599631224104933
      ],
      retiredIndexUids: const [],
      retiredPropertyUids: const [
        5489380764927646302,
        347302859567081836,
        6995005639536957438,
        6977115435854106704,
        8652738848562534240,
        2553839442597324993,
        3719602983658599573,
        3692236497740312392,
        1605686068252087171,
        8930213380727279550,
        6309408186515916460,
        7831192010280214150,
        6060519888185551742,
        1692085368193444789,
        6629946317230573522,
        983891003222283668,
        7727123918288359283,
        2015158093280157473,
        7126892046675706469,
        2700315743673163372,
        6152311172718504653,
        8766596034594712122
      ],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    Song: EntityDefinition<Song>(
        model: _entities[0],
        toOneRelations: (Song object) => [],
        toManyRelations: (Song object) =>
            {RelInfo<Song>.toMany(1, object.id): object.tags},
        getId: (Song object) => object.id,
        setId: (Song object, int id) {
          object.id = id;
        },
        objectToFB: (Song object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          final artistOffset = fbb.writeString(object.artist);
          final spotifyIdOffset = fbb.writeString(object.spotifyId);
          fbb.startTable(9);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nameOffset);
          fbb.addOffset(2, artistOffset);
          fbb.addOffset(3, spotifyIdOffset);
          fbb.addInt64(5, object.dateAdded?.millisecondsSinceEpoch);
          fbb.addInt64(6, object.releaseDate.millisecondsSinceEpoch);
          fbb.addInt64(7, object.duration);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final dateAddedValue =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 14);
          final object = Song(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              name: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 6, ''),
              artist: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 8, ''),
              spotifyId: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 10, ''),
              dateAdded: dateAddedValue == null
                  ? null
                  : DateTime.fromMillisecondsSinceEpoch(dateAddedValue),
              releaseDate: DateTime.fromMillisecondsSinceEpoch(
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 16, 0)),
              duration:
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 18, 0));
          InternalToManyAccess.setRelInfo<Song>(
              object.tags, store, RelInfo<Song>.toMany(1, object.id));
          return object;
        }),
    Tag: EntityDefinition<Tag>(
        model: _entities[1],
        toOneRelations: (Tag object) => [],
        toManyRelations: (Tag object) =>
            {RelInfo<Song>.toManyBacklink(1, object.id): object.songs},
        getId: (Tag object) => object.id,
        setId: (Tag object, int id) {
          object.id = id;
        },
        objectToFB: (Tag object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          fbb.startTable(6);
          fbb.addInt64(1, object.id);
          fbb.addOffset(2, nameOffset);
          fbb.addInt64(3, object.colourIndex);
          fbb.addBool(4, object.userDefined);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Tag(
              name: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 8, ''),
              colourIndex:
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 10, 0),
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 6, 0),
              userDefined: const fb.BoolReader()
                  .vTableGet(buffer, rootOffset, 12, false));
          InternalToManyAccess.setRelInfo<Tag>(
              object.songs, store, RelInfo<Song>.toManyBacklink(1, object.id));
          return object;
        }),
    PlaybackFilter: EntityDefinition<PlaybackFilter>(
        model: _entities[2],
        toOneRelations: (PlaybackFilter object) => [],
        toManyRelations: (PlaybackFilter object) =>
            {RelInfo<PlaybackFilter>.toMany(2, object.id): object.tags},
        getId: (PlaybackFilter object) => object.id,
        setId: (PlaybackFilter object, int id) {
          object.id = id;
        },
        objectToFB: (PlaybackFilter object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          final dbTotalByVersionOffset = object.dbTotalByVersion == null
              ? null
              : fbb.writeString(object.dbTotalByVersion!);
          fbb.startTable(6);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nameOffset);
          fbb.addInt64(2, object.lastAccessed.millisecondsSinceEpoch);
          fbb.addOffset(3, dbTotalByVersionOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = PlaybackFilter(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              name: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 6, ''))
            ..lastAccessed = DateTime.fromMillisecondsSinceEpoch(
                const fb.Int64Reader().vTableGet(buffer, rootOffset, 8, 0))
            ..dbTotalByVersion = const fb.StringReader(asciiOptimization: true)
                .vTableGetNullable(buffer, rootOffset, 10);
          InternalToManyAccess.setRelInfo<PlaybackFilter>(
              object.tags, store, RelInfo<PlaybackFilter>.toMany(2, object.id));
          return object;
        }),
    Queue: EntityDefinition<Queue>(
        model: _entities[3],
        toOneRelations: (Queue object) => [],
        toManyRelations: (Queue object) =>
            {RelInfo<Queue>.toMany(3, object.id): object.songs},
        getId: (Queue object) => object.id,
        setId: (Queue object, int id) {
          object.id = id;
        },
        objectToFB: (Queue object, fb.Builder fbb) {
          fbb.startTable(2);
          fbb.addInt64(0, object.id);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Queue(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0));
          InternalToManyAccess.setRelInfo<Queue>(
              object.songs, store, RelInfo<Queue>.toMany(3, object.id));
          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [Song] entity fields to define ObjectBox queries.
class Song_ {
  /// see [Song.id]
  static final id = QueryIntegerProperty<Song>(_entities[0].properties[0]);

  /// see [Song.name]
  static final name = QueryStringProperty<Song>(_entities[0].properties[1]);

  /// see [Song.artist]
  static final artist = QueryStringProperty<Song>(_entities[0].properties[2]);

  /// see [Song.spotifyId]
  static final spotifyId =
      QueryStringProperty<Song>(_entities[0].properties[3]);

  /// see [Song.dateAdded]
  static final dateAdded =
      QueryIntegerProperty<Song>(_entities[0].properties[4]);

  /// see [Song.releaseDate]
  static final releaseDate =
      QueryIntegerProperty<Song>(_entities[0].properties[5]);

  /// see [Song.duration]
  static final duration =
      QueryIntegerProperty<Song>(_entities[0].properties[6]);

  /// see [Song.tags]
  static final tags = QueryRelationToMany<Song, Tag>(_entities[0].relations[0]);
}

/// [Tag] entity fields to define ObjectBox queries.
class Tag_ {
  /// see [Tag.id]
  static final id = QueryIntegerProperty<Tag>(_entities[1].properties[0]);

  /// see [Tag.name]
  static final name = QueryStringProperty<Tag>(_entities[1].properties[1]);

  /// see [Tag.colourIndex]
  static final colourIndex =
      QueryIntegerProperty<Tag>(_entities[1].properties[2]);

  /// see [Tag.userDefined]
  static final userDefined =
      QueryBooleanProperty<Tag>(_entities[1].properties[3]);
}

/// [PlaybackFilter] entity fields to define ObjectBox queries.
class PlaybackFilter_ {
  /// see [PlaybackFilter.id]
  static final id =
      QueryIntegerProperty<PlaybackFilter>(_entities[2].properties[0]);

  /// see [PlaybackFilter.name]
  static final name =
      QueryStringProperty<PlaybackFilter>(_entities[2].properties[1]);

  /// see [PlaybackFilter.lastAccessed]
  static final lastAccessed =
      QueryIntegerProperty<PlaybackFilter>(_entities[2].properties[2]);

  /// see [PlaybackFilter.dbTotalByVersion]
  static final dbTotalByVersion =
      QueryStringProperty<PlaybackFilter>(_entities[2].properties[3]);

  /// see [PlaybackFilter.tags]
  static final tags =
      QueryRelationToMany<PlaybackFilter, Tag>(_entities[2].relations[0]);
}

/// [Queue] entity fields to define ObjectBox queries.
class Queue_ {
  /// see [Queue.id]
  static final id = QueryIntegerProperty<Queue>(_entities[3].properties[0]);

  /// see [Queue.songs]
  static final songs =
      QueryRelationToMany<Queue, Song>(_entities[3].relations[0]);
}
