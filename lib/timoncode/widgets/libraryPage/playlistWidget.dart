import 'package:flutter/material.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/project/components/text_widgets/heading_text/heading_text_widget.dart';
import 'dart:math';

class PlaylistWidget extends StatelessWidget {
  final String playlistName;
  final Function onTap;
  final String? imageUrl;
  PlaylistWidget(
      {required this.playlistName,
      required this.onTap,
      required this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>onTap(),
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
        width: MediaQuery.of(context).size.width * 0.36,
        child: Column(
          children: [
            Container(
              height: 120.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).accent1,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: imageUrl != null ? Image.network(imageUrl!) : Container(),
              margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
            ),
            Text(
              playlistName,
              style: FlutterFlowTheme.of(context).titleLarge.override(
                    fontFamily: 'Roboto Condensed',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
