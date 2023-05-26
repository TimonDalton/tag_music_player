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
import 'package:tag_music_player/timoncode/globals.dart';
import 'package:spotify_sdk/spotify_sdk.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void connectSpotifyAppButton_onTap(BuildContext context) async {
  try {
    var result = await SpotifySdk.connectToSpotifyRemote(
        clientId: dotenv.env['CLIENT_ID'].toString(),
        redirectUrl: dotenv.env['REDIRECT_URL'].toString());
    print('connected');
    FFAppState().spotifyConnectionStatus = 'Connected';
    showMessageSnackbar('Connected to Spotify', context);
  } catch (e) {
    print('connection error:');
    print(e);
    // setState(() {
    FFAppState().spotifyConnectionStatus = 'Not Connected';
    // });
    showMessageSnackbar(
        'Error connecting to Spotify. Check to see if Spotify is open',
        context);
  }
}

void connectSpotifyAccountButton_onTap(BuildContext context) async {
  try {
    var authenticationToken = await SpotifySdk.getAccessToken(
        clientId: CLIENT_ID,
        redirectUrl: REDIRECT_URL,
        scope: 'app-remote-control, '
            'user-modify-playback-state, '
            'playlist-read-private, '
            'playlist-modify-public,user-read-currently-playing');

    // setState(() {
    FFAppState().spotifyAuthToken = authenticationToken;
    FFAppState().hasAuthToken = true;
    // });
    ;
  } catch (e) {
    print('error getting Auth Token:');
    print(e);
    // setState(() {
    FFAppState().hasAuthToken = false;
    // });
    showMessageSnackbar('Error connecting Auth Token', context);
  }
}
