import 'package:objectbox/objectbox.dart';
import 'tag.dart';
//https://docs.objectbox.io/relations#many-to-many-n-m

@Entity()
class Song{
  @Id()
  int id;

  late final String name;
  late final String artist;
  late final String spotifyId;
  final tags = ToMany<Tag>();
  Song({this.id=0,required name,required artist,required spotifyId,tagIds = const []});
}