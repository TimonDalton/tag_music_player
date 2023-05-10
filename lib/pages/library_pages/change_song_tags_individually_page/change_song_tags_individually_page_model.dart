import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/project/components/buttons/filter_button/filter_button_widget.dart';
import '/project/components/other/bottom_options_bar_widget/bottom_options_bar_widget_widget.dart';
import '/project/components/other/colour_toggle_bubble_widget/colour_toggle_bubble_widget_widget.dart';
import '/project/components/song_widgets/song_artist_and_name_widget/song_artist_and_name_widget_widget.dart';
import '/project/components/tag_widgets/default_tag/default_tag_widget.dart';
import '/project/components/text_widgets/heading_text/heading_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChangeSongTagsIndividuallyPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for heading_text component.
  late HeadingTextModel headingTextModel1;
  // Model for Default_Tag component.
  late DefaultTagModel defaultTagModel1;
  // Model for Default_Tag component.
  late DefaultTagModel defaultTagModel2;
  // Model for Default_Tag component.
  late DefaultTagModel defaultTagModel3;
  // Model for filter_button component.
  late FilterButtonModel filterButtonModel;
  // Model for heading_text component.
  late HeadingTextModel headingTextModel2;
  // Model for heading_text component.
  late HeadingTextModel headingTextModel3;
  // Model for heading_text component.
  late HeadingTextModel headingTextModel4;
  // Model for heading_text component.
  late HeadingTextModel headingTextModel5;
  // Model for heading_text component.
  late HeadingTextModel headingTextModel6;
  // Model for song_artist_and_name_widget component.
  late SongArtistAndNameWidgetModel songArtistAndNameWidgetModel;
  // Model for colour_toggle_bubble_widget component.
  late ColourToggleBubbleWidgetModel colourToggleBubbleWidgetModel1;
  // Model for colour_toggle_bubble_widget component.
  late ColourToggleBubbleWidgetModel colourToggleBubbleWidgetModel2;
  // Model for colour_toggle_bubble_widget component.
  late ColourToggleBubbleWidgetModel colourToggleBubbleWidgetModel3;
  // Model for bottom_options_bar_widget component.
  late BottomOptionsBarWidgetModel bottomOptionsBarWidgetModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    headingTextModel1 = createModel(context, () => HeadingTextModel());
    defaultTagModel1 = createModel(context, () => DefaultTagModel());
    defaultTagModel2 = createModel(context, () => DefaultTagModel());
    defaultTagModel3 = createModel(context, () => DefaultTagModel());
    filterButtonModel = createModel(context, () => FilterButtonModel());
    headingTextModel2 = createModel(context, () => HeadingTextModel());
    headingTextModel3 = createModel(context, () => HeadingTextModel());
    headingTextModel4 = createModel(context, () => HeadingTextModel());
    headingTextModel5 = createModel(context, () => HeadingTextModel());
    headingTextModel6 = createModel(context, () => HeadingTextModel());
    songArtistAndNameWidgetModel =
        createModel(context, () => SongArtistAndNameWidgetModel());
    colourToggleBubbleWidgetModel1 =
        createModel(context, () => ColourToggleBubbleWidgetModel());
    colourToggleBubbleWidgetModel2 =
        createModel(context, () => ColourToggleBubbleWidgetModel());
    colourToggleBubbleWidgetModel3 =
        createModel(context, () => ColourToggleBubbleWidgetModel());
    bottomOptionsBarWidgetModel =
        createModel(context, () => BottomOptionsBarWidgetModel());
  }

  void dispose() {
    headingTextModel1.dispose();
    defaultTagModel1.dispose();
    defaultTagModel2.dispose();
    defaultTagModel3.dispose();
    filterButtonModel.dispose();
    headingTextModel2.dispose();
    headingTextModel3.dispose();
    headingTextModel4.dispose();
    headingTextModel5.dispose();
    headingTextModel6.dispose();
    songArtistAndNameWidgetModel.dispose();
    colourToggleBubbleWidgetModel1.dispose();
    colourToggleBubbleWidgetModel2.dispose();
    colourToggleBubbleWidgetModel3.dispose();
    bottomOptionsBarWidgetModel.dispose();
  }

  /// Additional helper methods are added here.

}
