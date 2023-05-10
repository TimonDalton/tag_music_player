import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/project/components/other/search_bar_widget/search_bar_widget_widget.dart';
import '/project/components/song_widgets/defualt_song/defualt_song_widget.dart';
import '/project/components/text_widgets/heading_text/heading_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddSongSearchPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for heading_text component.
  late HeadingTextModel headingTextModel;
  // Model for search_bar_widget component.
  late SearchBarWidgetModel searchBarWidgetModel;
  // Model for Defualt_Song component.
  late DefualtSongModel defualtSongModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    headingTextModel = createModel(context, () => HeadingTextModel());
    searchBarWidgetModel = createModel(context, () => SearchBarWidgetModel());
    defualtSongModel = createModel(context, () => DefualtSongModel());
  }

  void dispose() {
    headingTextModel.dispose();
    searchBarWidgetModel.dispose();
    defualtSongModel.dispose();
  }

  /// Additional helper methods are added here.

}
