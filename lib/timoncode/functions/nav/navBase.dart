
import 'package:flutter/material.dart';
import '/flutter_flow/flutter_flow_util.dart';

void navBase (BuildContext context){
  if (FFAppState().basePage == 0) {
    context.pushNamed('Queue_Page');
  } else {
    if (FFAppState().basePage == 1) {
      context.pushNamed('Filters_Page');
    } else {
      context.pushNamed('song_library_page');
    }
  }
}