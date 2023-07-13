import 'dart:convert';

import 'package:objectbox/objectbox.dart';
import 'package:tag_music_player/timoncode/models/song.dart';
import 'package:tag_music_player/timoncode/models/tag.dart';
import 'package:tag_music_player/timoncode/models/songFilter.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
@Entity()
class PlaybackFilter {
  @JsonKey(defaultValue: 0)
  int id;
  String name;
  @Property(type: PropertyType.date) // Store as int in milliseconds
  late DateTime lastAccessed;
  final tags = ToMany<Tag>();
  @Transient()
  Map<int, double>? tagWeights;
  PlaybackFilter({
    this.id = 0,
    required this.name,
  }) {
    lastAccessed = DateTime.now();
  }

  String? get dbTotalByVersion {
    if (tagWeights == null) {
      return null;
    } else {
      Map<String, double> toJsonMap = {};
      tagWeights!.forEach((id, weight) {
        toJsonMap[id.toString()] = weight;
      });
      return json.encode(toJsonMap);
    }
  }

  set dbTotalByVersion(String? value) {
    if (value == null) {
      tagWeights = null;
    } else {
      tagWeights = Map.from(json.decode(value).map((idString, d) => MapEntry(int.parse(idString as String), d as double)));
    }
  }

  static const double minRequiredWeight = 100.0;
  static const double maxExcludedWeight = 0.01;

  ///Splits the tags into
  ///required, included and excluded
  ///which are all indexable.
  ///['required'] : List<Tag>
  ///['excluded'] : List<Tag>
  ///['included'] : Map<Tag, double>
  dynamic getTagsByCategory() {
    List<Tag> requiredTags = [];
    Map<Tag, double> included = {};
    List<Tag> excludedTags = [];
    final tagList = tags.toList(growable: false);
    if (tagWeights != null) {
      for (int i = 0; i < tagList.length; i++) {
        if (tagWeights![tagList[i].id] == null) {
          print('tagWeights: ${tagWeights}');
          print('tags: ${List<String>.generate(tagList.length, (index) => tagList[index].toString())}');
          print('missing id: ${tagList[i].id}');
          throw ('tagWeights![${tagList[i].id}] = null');
        } else {
          double weight = tagWeights![tagList[i].id]!;
          if (weight < maxExcludedWeight) {
            excludedTags.add(tagList[i]);
          } else if (weight > minRequiredWeight) {
            requiredTags.add(tagList[i]);
          } else {
            included.addAll({tagList[i]: weight});
          }
        }
      }
    } else {
      throw ('tagWeights = null');
    }
    return {
      'required': requiredTags,
      'included': included,
      'excluded': excludedTags,
    };
  }

  SongFilter getSongFilter() {
    List<Tag> includedTags = [];
    List<Tag> excludedTags = [];
    final tagList = tags.toList(growable: false);
    if (tagWeights != null) {
      for (int i = 0; i < tagList.length; i++) {
        if (tagWeights![tagList[i].id] == null) {
          print('tagWeights: ${tagWeights}');
          print('tags: ${List<String>.generate(tagList.length, (index) => tagList[index].toString())}');
          print('missing id: ${tagList[i].id}');
          throw ('tagWeights![${tagList[i].id}] = null');
        } else {
          double weight = tagWeights![tagList[i].id]!;
          if (weight < maxExcludedWeight) {
            excludedTags.add(tagList[i]);
          } else {
            includedTags.add(tagList[i]);
          }
        }
      }
    } else {
      throw ('tagWeights = null');
    }
    List<TagFilterCondition> incConditions = [];
    List<TagFilterCondition> exConditions = [];
    for(int i =0;i<includedTags.length;i++){
      incConditions.add(TagFilterCondition(
        include: true,
        tagId: includedTags[i].id,
        ));
    }
    for(int i =0;i<excludedTags.length;i++){
      incConditions.add(TagFilterCondition(
        include: false,
        tagId: excludedTags[i].id,
        ));
    }
    return SongFilter(unprocessedConditions: [...incConditions,...exConditions]);
  }
}
