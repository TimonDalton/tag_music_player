import 'package:flutter/material.dart';
import 'package:tag_music_player/timoncode/models/tag.dart';

class FilterTagSelector extends StatefulWidget {
  final List<Tag> availableTags;
  List<int> availableTagIdBin = [];
  List<int> includedTagIds;
  List<int> excludedTagIds;
  FilterTagSelector({
    required this.availableTags,
    this.includedTagIds = const [],
    this.excludedTagIds = const [],
  }) {
    for (int i = 0; i < availableTags.length; i++) {
      if (!((includedTagIds.contains(availableTags[i].id)) ||
          (excludedTagIds.contains(availableTags[i].id)))) {
        availableTagIdBin.add(availableTags[i].id);
      }
    }
  }

  @override
  State<FilterTagSelector> createState() => _FilterTagSelectorState();
}

class _FilterTagSelectorState extends State<FilterTagSelector> {
  int highlightedIndex = 1;
  List<DragTargetBox> boxes = List.filled(3, DragTargetBox(typeId: -1,tags: [],));
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

  Widget buildAllBoxes(
      BuildContext context, int highlightIndex, List<DragTargetBox> tagBoxes) {
    tagBoxes[0] = DragTargetBox(
      tagIds: widget.availableTagIdBin,
      typeId: 0,
      itemOnTap: itemTap,
      tags: widget.availableTags,
    );
    tagBoxes[1] = DragTargetBox(
      tagIds: widget.includedTagIds,
      highLighted: highlightIndex == 1,
      boxOnTap: boxTap,
      typeId: 1,
      tags: widget.availableTags,
    );
    tagBoxes[2] = DragTargetBox(
        tagIds: widget.excludedTagIds,
        highLighted: highlightIndex == 2,
        boxOnTap: boxTap,
        tags: widget.availableTags,
        typeId: 2);
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
    return Center(
      child: buildAllBoxes(context, highlightedIndex, boxes),
    );
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
  });
  final List<Tag> tags;
  List<int> tagIds;
  Function? itemOnTap;
  Function? boxOnTap;
  final int typeId;
  bool highLighted;

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
          margin: EdgeInsets.all(10),
          width: 170,
          height: 170,
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
            for (int i = 0; i < widget.tagIds.length; i++) {
              tagWidgets.add(DragTag(
                tagId: widget.tagIds[i],
                onRemove: removeTag,
                onTap: widget.itemOnTap,
                tag: widget.tags[widget.tagIds[i]],
                // onTap: ,
                containerTypeId: widget.typeId,
              ));
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
  DragTag(
      {required this.tagId,
      required this.onRemove,
      this.onTap,
      this.tag,
      this.containerTypeId = -1});

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
