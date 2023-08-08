import 'package:tag_music_player/timoncode/control_spotify/playback.dart';
import 'package:tag_music_player/timoncode/control_spotify/playbackLogic.dart';

import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/project/components/buttons/default_text_button/default_text_button_widget.dart';
import 'package:tag_music_player/timoncode/models/tag.dart';
import 'package:tag_music_player/timoncode/models/song.dart';
import 'package:tag_music_player/timoncode/widgets/popups/selectSingleTagPopup.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void showHoldSongSnackbar(BuildContext context, Song song) {
  final snackBar = SnackBar(
    content: Container(
      color: FlutterFlowTheme.of(context).primaryBackground.withOpacity(0.7),
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.65,
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          ListTile(title: Text('Play'), onTap: () {
            playSong(song);
            context.pop();
          }),
          ListTile(title: Text('Remove From Queue'), onTap: () {}),
        ],
      ),
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
