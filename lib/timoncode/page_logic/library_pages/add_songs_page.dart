import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/project/components/buttons/default_button/default_button_widget.dart';
import '/project/components/text_widgets/heading_text/heading_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:tag_music_player/timoncode/showSnackbar/showMessageSnackbar.dart';
import 'package:spotify_sdk/spotify_sdk.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import 'package:tag_music_player/timoncode/objectbox.dart';

import 'package:tag_music_player/timoncode/widgets/libraryPage/playlistWidget.dart';
import 'package:tag_music_player/timoncode/control_spotify/api_calls.dart';
import 'package:tag_music_player/timoncode/widgets/misc/confirmation_popup.dart';
import 'package:tag_music_player/timoncode/models/song.dart';
import 'package:tag_music_player/timoncode/models/tag.dart';

Future<http.Response> getCurrentUser() async {
  if (!FFAppState().hasAuthToken) {
    print('No Auth Token. Cannot access API');
  }
  var res = await http.get(Uri.parse('https://api.spotify.com/v1/me'));
  print(res.body);
  return res;
}

FutureBuilder showUserPlaylists(context) => FutureBuilder(
    future: getUserPlaylists(),
    builder: (context, snapshot) {
      if (snapshot.connectionState != ConnectionState.done) {
        return Icon(Icons.refresh);
      }
      List<dynamic> playlists = snapshot.data as List<dynamic>;
      List<Widget> children = [];
      // print('Images length:');
      for (int i = 0; i < playlists.length; i++) {
        children.add(PlaylistWidget(
            playlistName: playlists[i]['name'],
            imageUrl: playlists[i]['images'][0]['url'],
            onTap: () async {
              List<Song> songs = await getPlaylistSongs(playlists[i]['id']);
              // Navigator.of(context).push('That Page');
              showConfirmationDialogAndExecute(
                  context: context,
                  title: 'Save Playlist',
                  message:
                      'Save all of the songs in ${playlists[i]['name']} to your library?',
                  cancelName: 'Cancel',
                  onConfirm: () {
                    Tag tag = Tag(
                        colourId: -1,
                        name: 'playlist: ${playlists[i]['name']}',
                        userDefined: false);
                    objectBox.protectedSaveTagWithSongs(tag, songs);
                    print('saved playlist');
                  },
                  thirdOptionName: 'Save and choose tags',
                  thirdOptionFunc: () {
                    Tag tag = Tag(
                        colourId: -1,
                        name: 'playlist: ${playlists[i]['name']}',
                        userDefined: false);
                    objectBox.protectedSaveTagWithSongs(tag, songs);
                    print('saved playlist. adding tags');

                  });
            }));
      }
      return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Wrap(
            spacing: 30.0,
            runSpacing: 0.0,
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            direction: Axis.horizontal,
            runAlignment: WrapAlignment.start,
            verticalDirection: VerticalDirection.down,
            clipBehavior: Clip.none,
            children: children,
          ));
    });
