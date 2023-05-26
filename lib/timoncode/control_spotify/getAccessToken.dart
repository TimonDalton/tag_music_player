import 'dart:math';

import '/flutter_flow/flutter_flow_util.dart';
import 'package:spotify_sdk/spotify_sdk.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;
import 'package:tag_music_player/timoncode/globals.dart';

Future<String> getNewAccessToken() async {
  try {
    var authenticationToken = await SpotifySdk.getAccessToken(
        clientId: CLIENT_ID,
        redirectUrl: REDIRECT_URL,
        scope: 'app-remote-control, '
            'user-modify-playback-state, '
            'playlist-read-private, '
            'playlist-read-collaborative, '
            'playlist-modify-public,user-read-currently-playing');
    // setStatus('Got a token: $authenticationToken');
    FFAppState().hasAuthToken = true;
    FFAppState().spotifyAuthToken = authenticationToken;
    return authenticationToken;
  } catch (e) {
    print('Error in getAccessToken()');
    print(e);
    return '';
  }
}

Future<String> getAccessToken()async{
  try{
  return FFAppState().hasAuthToken?FFAppState().spotifyAuthToken: await getNewAccessToken();
  }catch(e){
    print('Error Retrieving Access Token:');
    throw e;
  }
}
