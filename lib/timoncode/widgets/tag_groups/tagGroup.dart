import 'package:flutter/material.dart';
import 'package:tag_music_player/timoncode/models/tag.dart';
import 'package:tag_music_player/timoncode/functions/roundedCorners.dart';

class TagWidget extends StatefulWidget {
  const TagWidget(
      {required this.tag,
      required this.selected,
      required this.index,
      required this.callback,
      required this.height,
      required this.width});
  final Tag tag;
  final bool selected;
  final int index;
  final Function callback;
  final double width, height;
  @override
  State<TagWidget> createState() => _TagWidgetState();
}

class _TagWidgetState extends State<TagWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.width < 20) {
      double newWidth = 4;
      double newHeight = 12;
      if (widget.width <10){
        newHeight = 4;
      }
      return Container(
        width: newWidth,
        height: newHeight,
        margin: EdgeInsets.all(newHeight/8),
        decoration: BoxDecoration(
            color: widget.tag.colour(),
            borderRadius: BorderRadius.circular(
                borderRadiusFromSides(newWidth, newHeight))),
      );
    }
    const double textSizeMultipier = 0.75;
    return Container(
      width: widget.width,
      height: widget.height,
        margin: EdgeInsets.all(widget.height/8),
      decoration: BoxDecoration(
        color: widget.tag.colour(),
        borderRadius: BorderRadius.circular(
            borderRadiusFromSides(widget.width, widget.height)),
      ),
      child: Center(
          child: Text(widget.tag.name,
              style: TextStyle(fontSize: widget.height * textSizeMultipier,fontWeight: FontWeight.normal))),
    );
  }
}

class TagGroup extends StatefulWidget {
  TagGroup({this.tags = const []});
  List<Tag> tags;
  @override
  State<TagGroup> createState() => _TagGroupState();
}

class _TagGroupState extends State<TagGroup> {
  void callback(int index) {
    setState(() {
      // widget.rating = ratingTap;
    });
  }

  @override
  Widget build(BuildContext context) {
    const double maxItemWidth = 100;

    return Container(
      child: new LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        const double widthToHeight = 3.5;
        int itemCount = widget.tags.length;
        double area = constraints.maxHeight * constraints.maxWidth;
        double itemArea = area / itemCount;
        double maxColWidth = itemArea * (widthToHeight / (widthToHeight + 1));
        if (maxColWidth > maxItemWidth) {
          maxColWidth = maxItemWidth;
        }

        int itemsPerRow = (constraints.maxWidth / maxColWidth).ceil();
        double itemWidth = -1, itemHeight = -1;
        bool shouldLoop = true;
        while (shouldLoop) {
          itemWidth = constraints.maxWidth / itemsPerRow;
          itemHeight = itemWidth / widthToHeight;
          if ((constraints.maxHeight / itemHeight).floor() *
                  (constraints.maxWidth / itemWidth).floor() <
              itemCount) {
            itemsPerRow += 1;
          } else {
            shouldLoop = false;
          }
        }
        List<Widget> children = [];
        for (int i = 0; i < itemCount; i++) {
          children.add(TagWidget(
              tag: widget.tags[i],
              selected: false,
              index: i,
              callback: callback,
              height: itemHeight,
              width: itemWidth));
        }
        return Wrap(
          children: children,
        );
      }),
    );
  }
}