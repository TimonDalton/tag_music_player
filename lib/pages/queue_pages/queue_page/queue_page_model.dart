import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/project/components/bottom_bars/now_playing_bar/now_playing_bar_widget.dart';
import '/project/components/buttons/default_button/default_button_widget.dart';
import '/project/components/buttons/mini_button/mini_button_widget.dart';
import '/project/components/other/bottom_nav_bar_widget/bottom_nav_bar_widget_widget.dart';
import '/project/components/song_widgets/defualt_song/defualt_song_widget.dart';
import '/project/components/tag_group_widgets/editable_tag_group/editable_tag_group_widget.dart';
import '/project/components/text_widgets/heading_text/heading_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class QueuePageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for editable_tag_group component.
  late EditableTagGroupModel editableTagGroupModel;
  // Model for Default_Button component.
  late DefaultButtonModel defaultButtonModel1;
  // Model for Default_Button component.
  late DefaultButtonModel defaultButtonModel2;
  // Model for heading_text component.
  late HeadingTextModel headingTextModel1;
  // Model for Defualt_Song component.
  late DefualtSongModel defualtSongModel1;
  // Model for heading_text component.
  late HeadingTextModel headingTextModel2;
  // Model for Defualt_Song component.
  late DefualtSongModel defualtSongModel2;
  // Model for Defualt_Song component.
  late DefualtSongModel defualtSongModel3;
  // Model for mini_button component.
  late MiniButtonModel miniButtonModel1;
  // Model for mini_button component.
  late MiniButtonModel miniButtonModel2;
  // Model for now_playing_bar component.
  late NowPlayingBarModel nowPlayingBarModel;
  // Model for bottom_nav_bar_widget component.
  late BottomNavBarWidgetModel bottomNavBarWidgetModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    editableTagGroupModel = createModel(context, () => EditableTagGroupModel());
    defaultButtonModel1 = createModel(context, () => DefaultButtonModel());
    defaultButtonModel2 = createModel(context, () => DefaultButtonModel());
    headingTextModel1 = createModel(context, () => HeadingTextModel());
    defualtSongModel1 = createModel(context, () => DefualtSongModel());
    headingTextModel2 = createModel(context, () => HeadingTextModel());
    defualtSongModel2 = createModel(context, () => DefualtSongModel());
    defualtSongModel3 = createModel(context, () => DefualtSongModel());
    miniButtonModel1 = createModel(context, () => MiniButtonModel());
    miniButtonModel2 = createModel(context, () => MiniButtonModel());
    nowPlayingBarModel = createModel(context, () => NowPlayingBarModel());
    bottomNavBarWidgetModel =
        createModel(context, () => BottomNavBarWidgetModel());
  }

  void dispose() {
    editableTagGroupModel.dispose();
    defaultButtonModel1.dispose();
    defaultButtonModel2.dispose();
    headingTextModel1.dispose();
    defualtSongModel1.dispose();
    headingTextModel2.dispose();
    defualtSongModel2.dispose();
    defualtSongModel3.dispose();
    miniButtonModel1.dispose();
    miniButtonModel2.dispose();
    nowPlayingBarModel.dispose();
    bottomNavBarWidgetModel.dispose();
  }

  /// Additional helper methods are added here.

}
