import 'package:flutter/material.dart';
import 'package:tag_music_player/timoncode/models/tag.dart';
import 'package:collection/collection.dart';

class FilterTagSelector extends StatefulWidget {
  final List<Tag> availableTags;
  List<int> availableTagIdBin = [];
  List<int> includedTagIds;
  List<int> excludedTagIds;
  FilterTagSelector({
    required this.availableTags,
    required this.includedTagIds,
    required this.excludedTagIds,
  }) {
    for (int i = 0; i < availableTags.length; i++) {
      if (!((includedTagIds.contains(availableTags[i].id)) || (excludedTagIds.contains(availableTags[i].id)))) {
        availableTagIdBin.add(availableTags[i].id);
      }
    }
  }
  List<Tag> getIncluded(){
    return availableTags.where((tag) => includedTagIds.contains(tag.id)).toList();
  }
  List<Tag> getExcluded(){
    return availableTags.where((tag) => excludedTagIds.contains(tag.id)).toList();
  }

  @override
  State<FilterTagSelector> createState() => _FilterTagSelectorState();
}

class _FilterTagSelectorState extends State<FilterTagSelector> {
  int highlightedIndex = 1;
  List<DragTargetBox> boxes = List.filled(
      3,
      DragTargetBox(
        typeId: -1,
        tags: [],
      ));
  void boxTap(DragTargetBox box) {
    if (!box.highLighted) {
      setState(() {
        highlightedIndex == 1 ? highlightedIndex = 2 : highlightedIndex = 1;
      });
    }
  }

  void itemTap(DragTag tagW) {
    if (tagW.containerTypeId == 0) {
      setState(() {
        boxes[0].tagIds.remove(tagW.tagId);
        boxes[highlightedIndex].tagIds.add(tagW.tagId);
      });
    }
  }

  Widget buildAllBoxes(BuildContext context, int highlightIndex, List<DragTargetBox> tagBoxes, {double parentWidth = 360}) {
    double padding = parentWidth * 0.01;
    double usableWidth = (parentWidth - padding * 4) / 2;
    List<int> availableTagsIntList = List<int>.generate(widget.availableTags.length, (index) => widget.availableTags[index].id);
    // print('Available Tags List: ${availableTagsIntList.toString()}');
    // print('included Tags List: ${widget.includedTagIds.where((tagId) => availableTagsIntList.contains(tagId)).toList().toString()}');
    tagBoxes[0] = DragTargetBox(
      tagIds: widget.availableTagIdBin,
      typeId: 0,
      itemOnTap: itemTap,
      width: usableWidth,
      height: usableWidth,
      padding: padding,
      tags: widget.availableTags,
    );
    tagBoxes[1] = DragTargetBox(
      tagIds: widget.includedTagIds,
      // tagIds: widget.includedTagIds.where((tagId)=>availableTagsIntList.contains(tagId)).toList(),
      highLighted: highlightIndex == 1,
      boxOnTap: boxTap,
      typeId: 1,
      width: usableWidth,
      height: usableWidth,
      padding: padding,
      tags: widget.availableTags,
    );
    tagBoxes[2] = DragTargetBox(
      tagIds: widget.excludedTagIds,
      highLighted: highlightIndex == 2,
      boxOnTap: boxTap,
      typeId: 2,
      width: usableWidth,
      height: usableWidth,
      padding: padding,
      tags: widget.availableTags,
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        tagBoxes[0],
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [tagBoxes[1], tagBoxes[2]],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
      return buildAllBoxes(context, highlightedIndex, boxes, parentWidth: constraints.maxWidth);
    });
  }
}

class DragTargetBox extends StatefulWidget {
  DragTargetBox({
    required this.tags,
    this.tagIds = const [],
    this.boxOnTap,
    this.itemOnTap,
    required this.typeId,
    this.highLighted = false,
    this.height = 170,
    this.width = 170,
    this.padding = 10,
  });
  final List<Tag> tags;
  List<int> tagIds;
  Function? itemOnTap;
  Function? boxOnTap;
  final int typeId;
  bool highLighted;
  double height;
  double width;
  double padding;

  @override
  State<DragTargetBox> createState() => _DragTargetBoxState();
}

class _DragTargetBoxState extends State<DragTargetBox> {
  void addTag(int tagId) {
    if (!widget.tagIds.contains(tagId)) {
      setState(() {
        widget.tagIds.add(tagId);
      });
    }
  }

  void removeTag(int tagId) {
    setState(() {
      widget.tagIds.remove(tagId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () => widget.boxOnTap != null ? widget.boxOnTap!(widget) : '',
        child: Container(
          margin: EdgeInsets.all(widget.padding),
          width: widget.width,
          height: widget.height,
          color: widget.highLighted ? Colors.lightBlue : Colors.grey,
          child: DragTarget(onAccept: (data) {
            DragTag sender = data as DragTag;
            Tag tag = sender.tag!;
            if (!widget.tagIds.contains(tag.id)) {
              addTag(tag.id);
              sender.onRemove(tag.id);
            }
          }, builder: (context, candidateData, rejectedData) {

            List<Widget> tagWidgets = [];
            // print('Box typeId ${widget.typeId}');
            // print('tags ${List<int>.generate(widget.tags.length, (index) => widget.tags[index].id).toString()}');
            // print('box tags ${widget.tagIds.toString()}, length: ${widget.tagIds.length}');
            if (widget.typeId != 1) {
              for (int i = 0; i < widget.tagIds.length; i++) {
                tagWidgets.add(DragTag(
                  tagId: widget.tagIds[i],
                  onRemove: removeTag,
                  onTap: widget.itemOnTap,
                  tag: widget.tags.firstWhere((tag) => tag.id == widget.tagIds[i]),
                  // onTap: ,
                  containerTypeId: widget.typeId,
                ));
              }
            }else{
              List<int> userTagIds = List<int>.generate(widget.tags.length,(index)=>widget.tags[index].id);
              List<int> includedUserTagIds = userTagIds.where((tagId)=>widget.tagIds.contains(tagId)).toList();
              for (int i = 0; i < includedUserTagIds.length; i++) {
                tagWidgets.add(DragTag(
                  tagId: includedUserTagIds[i],
                  onRemove: removeTag,
                  onTap: widget.itemOnTap,
                  tag: widget.tags.firstWhere((tag) => tag.id == includedUserTagIds[i]),
                  // onTap: ,
                  containerTypeId: widget.typeId,
                ));
              }
            }

            return Wrap(
              children: tagWidgets,
            );
          }),
        ));
  }
}

class DragTag extends StatelessWidget {
  final int tagId;
  final Function onRemove;
  final Function? onTap;
  late Tag? tag;
  int containerTypeId;
  DragTag({required this.tagId, required this.onRemove, this.onTap, this.tag, this.containerTypeId = -1});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap != null ? onTap!(this) : '',
      child: Draggable(
        data: this,
        onDragCompleted: () {},
        child: Container(
          margin: EdgeInsets.all(2),
          width: 70,
          height: 20,
          color: tag!.colour(),
          child: Text(tag!.name),
        ),
        childWhenDragging: Container(
          width: 70,
          height: 20,
          color: tag!.colour().withOpacity(0.7),
        ),
        feedback: Container(
          margin: EdgeInsets.all(2),
          width: 70,
          height: 20,
          color: tag!.colour(),
          child: Text(tag!.name),
        ),
      ),
    );
  }
}
