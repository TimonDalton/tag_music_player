import 'dart:math';

import '/flutter_flow/flutter_flow_util.dart';
import 'package:spotify_sdk/spotify_sdk.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:tag_music_player/timoncode/control_spotify/getAccessToken.dart';
import 'package:tag_music_player/timoncode/globals.dart';
import 'package:http/http.dart' as http;

///Connects Spotify App Remote
Future<void> connectToSpotifyRemote() async {
  try {
    String token = await getAccessToken();
    var result = await SpotifySdk.connectToSpotifyRemote(
        clientId: CLIENT_ID, redirectUrl: REDIRECT_URL, accessToken: token);
    print('connected');
  } on PlatformException catch (e) {
    print('connection error:');
    print(e);
  } on MissingPluginException {
    print('connection error:');
    print(e);
  }
}

