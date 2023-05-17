import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/project/components/bottom_bars/bottom_options_bar_widget/bottom_options_bar_widget_widget.dart';
import '/project/components/buttons/colour_button/colour_button_widget.dart';
import '/project/components/buttons/filter_button/filter_button_widget.dart';
import '/project/components/song_widgets/defualt_song/defualt_song_widget.dart';
import '/project/components/tag_widgets/default_tag/default_tag_widget.dart';
import '/project/components/text_widgets/heading_text/heading_text_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChangeSongsTagsByGroupPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for filter_button component.
  late FilterButtonModel filterButtonModel;
  // Model for heading_text component.
  late HeadingTextModel headingTextModel;
  // Model for Default_Tag component.
  late DefaultTagModel defaultTagModel;
  // Model for colour_button component.
  late ColourButtonModel colourButtonModel1;
  // Model for colour_button component.
  late ColourButtonModel colourButtonModel2;
  // Model for colour_button component.
  late ColourButtonModel colourButtonModel3;
  // Model for Defualt_Song component.
  late DefualtSongModel defualtSongModel1;
  // Model for Defualt_Song component.
  late DefualtSongModel defualtSongModel2;
  // Model for bottom_options_bar_widget component.
  late BottomOptionsBarWidgetModel bottomOptionsBarWidgetModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    filterButtonModel = createModel(context, () => FilterButtonModel());
    headingTextModel = createModel(context, () => HeadingTextModel());
    defaultTagModel = createModel(context, () => DefaultTagModel());
    colourButtonModel1 = createModel(context, () => ColourButtonModel());
    colourButtonModel2 = createModel(context, () => ColourButtonModel());
    colourButtonModel3 = createModel(context, () => ColourButtonModel());
    defualtSongModel1 = createModel(context, () => DefualtSongModel());
    defualtSongModel2 = createModel(context, () => DefualtSongModel());
    bottomOptionsBarWidgetModel =
        createModel(context, () => BottomOptionsBarWidgetModel());
  }

  void dispose() {
    filterButtonModel.dispose();
    headingTextModel.dispose();
    defaultTagModel.dispose();
    colourButtonModel1.dispose();
    colourButtonModel2.dispose();
    colourButtonModel3.dispose();
    defualtSongModel1.dispose();
    defualtSongModel2.dispose();
    bottomOptionsBarWidgetModel.dispose();
  }

  /// Additional helper methods are added here.

}
