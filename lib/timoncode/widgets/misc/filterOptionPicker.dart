import 'package:flutter/material.dart';
import 'package:tag_music_player/timoncode/models/tag.dart';
import 'package:tag_music_player/timoncode/objectbox.dart';

class FilterPickerDropDown extends StatefulWidget {
  int selectedIndex;
  String selectedFilterType;
  late List<String> filters;
  Function(String) setTagName;
  FilterPickerDropDown({required this.setTagName,this.selectedIndex = 0,required this.selectedFilterType}) {
    filters = objectBox.getGeneratedTagsOfType(selectedFilterType);
  }

  @override
  State<FilterPickerDropDown> createState() => _FilterPickerDropDownState();
}

class _FilterPickerDropDownState extends State<FilterPickerDropDown> {
  void onSelectCallback(int index) {
    setState(() {
      widget.selectedIndex = index;
      widget.setTagName(widget.filters[index]);
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

  Widget buildItem(BuildContext context, int index){
    return Container(
          width: 100,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Text(widget.filters[index]),
        );
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: widget.filters[widget.selectedIndex],
      items: buildItems(context,onSelectCallback),
      onChanged: (value) => onSelectCallback(value as int),
      // selectedItemBuilder: ,
    );
  }
}
