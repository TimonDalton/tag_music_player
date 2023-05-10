import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/project/components/buttons/default_button/default_button_widget.dart';
import '/project/components/buttons/filter_button/filter_button_widget.dart';
import '/project/components/buttons/mini_button/mini_button_widget.dart';
import '/project/components/song_widgets/defualt_song/defualt_song_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SongLibraryPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for Default_Button component.
  late DefaultButtonModel defaultButtonModel1;
  // Model for Default_Button component.
  late DefaultButtonModel defaultButtonModel2;
  // Model for filter_button component.
  late FilterButtonModel filterButtonModel;
  // Model for mini_button component.
  late MiniButtonModel miniButtonModel;
  // Model for Defualt_Song component.
  late DefualtSongModel defualtSongModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    defaultButtonModel1 = createModel(context, () => DefaultButtonModel());
    defaultButtonModel2 = createModel(context, () => DefaultButtonModel());
    filterButtonModel = createModel(context, () => FilterButtonModel());
    miniButtonModel = createModel(context, () => MiniButtonModel());
    defualtSongModel = createModel(context, () => DefualtSongModel());
  }

  void dispose() {
    defaultButtonModel1.dispose();
    defaultButtonModel2.dispose();
    filterButtonModel.dispose();
    miniButtonModel.dispose();
    defualtSongModel.dispose();
  }

  /// Additional helper methods are added here.

}
