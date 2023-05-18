import 'dart:math';

import 'package:spotify_sdk/spotify_sdk.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

  Future<void> connectToSpotifyRemote() async {
    try {
      var result = await SpotifySdk.connectToSpotifyRemote(
          clientId: dotenv.env['CLIENT_ID'].toString(),
          redirectUrl: dotenv.env['REDIRECT_URL'].toString());
      print('connected');
      
    } on PlatformException catch (e) {
      print('connection error:');
      print(e);
    } on MissingPluginException {
      print('connection error:');
      print(e);
    }
  }