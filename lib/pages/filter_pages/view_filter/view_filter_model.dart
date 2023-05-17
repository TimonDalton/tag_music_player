import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/project/components/bottom_bars/start_playing_bar/start_playing_bar_widget.dart';
import '/project/components/buttons/default_button/default_button_widget.dart';
import '/project/components/song_widgets/defualt_song/defualt_song_widget.dart';
import '/project/components/tag_group_widgets/default_tag_group/default_tag_group_widget.dart';
import '/project/components/text_widgets/heading_text/heading_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ViewFilterModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for Default_Tag_Group component.
  late DefaultTagGroupModel defaultTagGroupModel;
  // Model for Default_Button component.
  late DefaultButtonModel defaultButtonModel1;
  // Model for Default_Button component.
  late DefaultButtonModel defaultButtonModel2;
  // Model for heading_text component.
  late HeadingTextModel headingTextModel;
  // Model for Defualt_Song component.
  late DefualtSongModel defualtSongModel;
  // Model for start_playing_bar component.
  late StartPlayingBarModel startPlayingBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    defaultTagGroupModel = createModel(context, () => DefaultTagGroupModel());
    defaultButtonModel1 = createModel(context, () => DefaultButtonModel());
    defaultButtonModel2 = createModel(context, () => DefaultButtonModel());
    headingTextModel = createModel(context, () => HeadingTextModel());
    defualtSongModel = createModel(context, () => DefualtSongModel());
    startPlayingBarModel = createModel(context, () => StartPlayingBarModel());
  }

  void dispose() {
    defaultTagGroupModel.dispose();
    defaultButtonModel1.dispose();
    defaultButtonModel2.dispose();
    headingTextModel.dispose();
    defualtSongModel.dispose();
    startPlayingBarModel.dispose();
  }

  /// Additional helper methods are added here.

}
