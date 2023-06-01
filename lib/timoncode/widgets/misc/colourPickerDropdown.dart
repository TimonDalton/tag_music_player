import 'package:flutter/material.dart';
import 'package:tag_music_player/timoncode/models/tag.dart';

class ColourPickerDropDown extends StatefulWidget {
  int selectedId;
  late Color selectedColour;
  Function(int) selectIndex;
  ColourPickerDropDown({required this.selectIndex,this.selectedId = 0}) {
    selectedColour = Tag.colours[selectedId];
  }

  @override
  State<ColourPickerDropDown> createState() => _ColourPickerDropDownState();
}

class _ColourPickerDropDownState extends State<ColourPickerDropDown> {
  void onSelectCallback(int newId) {
    setState(() {
      if (newId >= Tag.colours.length) {
        throw 'Index ${newId} out of range for colours';
      }
      widget.selectedId = newId;
      widget.selectedColour = Tag.colours[newId];
      widget.selectIndex(newId);
    });
  }

  List<DropdownMenuItem<int>> buildItems(BuildContext context,Function(int) onTap) {
    List<DropdownMenuItem<int>> ret = [];
    for (int i = 0; i < Tag.colours.length; i++) {
      ret.add(DropdownMenuItem<int>(
        onTap: ()=> onTap(i),
        child: buildItem(context,i),
        value: i,
      ));
    }
    return ret;
  }

  Widget buildItem(BuildContext context, int colorId){
    return Container(
          width: 100,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: Tag.colours[colorId],
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = buildItems(context,onSelectCallback);
    return DropdownButton(
      value: widget.selectedId,
      items: buildItems(context,onSelectCallback),
      onChanged: (value) => onSelectCallback(value as int),
      // selectedItemBuilder: ,
    );
  }
}
