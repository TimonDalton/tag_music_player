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

Future<http.Response> getCurrentUser()async{
  if (!FFAppState().hasAuthToken){
    print('No Auth Token. Cannot access API');
  }
  var res = await http.get(Uri.parse('https://api.spotify.com/v1/me'));
  print(res.body);
  return res;
}
