import 'dart:convert';
import 'dart:developer';
import 'package:tag_music_player/timoncode/control_spotify/getAccessToken.dart';
import 'package:tag_music_player/timoncode/globals.dart';
import 'package:tag_music_player/timoncode/models/song.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'package:spotify_sdk/spotify_sdk.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;

ensureRequestAvailable() async {
  try {
    if (userId == '') {
      await getUserId();
    }
  } catch (e) {
    print('Error at ensureRequestAvailable:');
    print(e);
  }
}

///gets and sets the user ID from spotify
Future<String> getUserId() async {
  try {
    var res = await http.get(Uri.parse('https://api.spotify.com/v1/me'),
        headers: {'Authorization': 'Bearer ${await getAccessToken()}'});
    userId = json.decode(res.body)['id'];
    print('User Id: ${json.decode(res.body)['id']}');
    return userId;
  } catch (e) {
    print('error getting Current User:');
    throw e;
  }
}

Future<List<dynamic>> getUserPlaylists() async {
  try {
    await ensureRequestAvailable();
    int total = 50;
    int offset = 0;
    var items = [];
    var playlists = [];
    var res;
    while (total == 50) {
      res = await http.get(
          Uri.parse(
              'https://api.spotify.com/v1/me/playlists?offset=${offset}&limit=50'),
          headers: {'Authorization': 'Bearer ${await getAccessToken()}'});
      offset += 50;
      items = json.decode(res.body)['items'];

      total = items.length;
      playlists..addAll(items);
    }
    // print('All ${playlists.length} Playlists:');
    // for (var i = 0; i < playlists.length; i++) {
    //   print(playlists[i]['name']);
    // }
    return playlists;
  } catch (e) {
    print('error getting User Playlists:');
    throw (e);
  }
}

Future<List<Song>> getPlaylistSongs(String playlistId) async {
  try {
    await ensureRequestAvailable();
    int total = 50;
    int offset = 0;
    var items = [];
    List<Song> songs = [];
    var res;
    while (total == 50) {
      res = await http.get(
          Uri.parse(
              'https://api.spotify.com/v1/playlists/${playlistId}/tracks?offset=${offset}&limit=50'),
          headers: {'Authorization': 'Bearer ${await getAccessToken()}'});
      // print('res::: for playlistId: ${playlistId}');
      // print(res.body);
      offset += 50;
      items = json.decode(res.body)['items'];
      total = items.length;
      songs.addAll(List<Song>.generate(items.length, (index) => Song.fromJsonObj(items[index])));
    }
    // print('All ${playlists.length} Playlists:');
    // for (var i = 0; i < playlists.length; i++) {
    //   print(playlists[i]['name']);
    // }
    
    return songs;
  } catch (e) {
    print('error getting User Playlists:');
    print(e);
    throw (e);
  }
}
