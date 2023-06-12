import 'package:flutter/material.dart';
import 'package:tag_music_player/timoncode/widgets/tag_groups/tagSelector.dart';
import 'package:tag_music_player/timoncode/models/tag.dart';
import 'package:tag_music_player/timoncode/objectbox.dart';
            
Future<void> showSelectSingleTagPopup(BuildContext context, Function(Tag?) callback) async {
  List<Tag> tags = objectBox.getAllUserDefTags();
  print('Tags');
  print(List<String>.generate(tags.length, (index) => tags[index].name));
  TagSelector tagSelector = TagSelector(
            maxSelectable: 1,
            tags: tags,            
          );  
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Choose a tag'),
        content: Container(
          height: MediaQuery.of(context).size.height*0.8,
          width: MediaQuery.of(context).size.width*0.8,
          child: tagSelector
        ),    
        actions: <Widget>[
          TextButton(
            child: const Text('Use tag'),
            onPressed: () {
              List<Tag> retArr = tagSelector.getSelectedTags();
              Tag? ret;
              if (retArr.length > 0){
                ret = retArr[0];
              }
              callback(ret);
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}