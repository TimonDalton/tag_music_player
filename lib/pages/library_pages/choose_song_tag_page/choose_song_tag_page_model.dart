import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/project/components/bottom_bars/bottom_options_bar_widget/bottom_options_bar_widget_widget.dart';
import '/project/components/bottom_bars/now_playing_bar/now_playing_bar_widget.dart';
import '/project/components/buttons/filter_button/filter_button_widget.dart';
import '/project/components/other/search_bar_widget/search_bar_widget_widget.dart';
import '/project/components/song_widgets/tagless_song_widget/tagless_song_widget_widget.dart';
import '/project/components/tag_group_widgets/included_excluded_tag_group/included_excluded_tag_group_widget.dart';
import '/project/components/tag_group_widgets/select_tag_widget/select_tag_widget_widget.dart';
import '/project/components/text_widgets/heading_text/heading_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChooseSongTagPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for heading_text component.
  late HeadingTextModel headingTextModel1;
  // Model for tagless_song_widget component.
  late TaglessSongWidgetModel taglessSongWidgetModel;
  // Model for now_playing_bar component.
  late NowPlayingBarModel nowPlayingBarModel;
  // Model for heading_text component.
  late HeadingTextModel headingTextModel2;
  // Model for search_bar_widget component.
  late SearchBarWidgetModel searchBarWidgetModel;
  // Model for heading_text component.
  late HeadingTextModel headingTextModel3;
  // Model for filter_button component.
  late FilterButtonModel filterButtonModel;
  // Model for select_tag_widget component.
  late SelectTagWidgetModel selectTagWidgetModel;
  // Model for heading_text component.
  late HeadingTextModel headingTextModel4;
  // Model for included_excluded_tag_group component.
  late IncludedExcludedTagGroupModel includedExcludedTagGroupModel;
  // Model for bottom_options_bar_widget component.
  late BottomOptionsBarWidgetModel bottomOptionsBarWidgetModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    headingTextModel1 = createModel(context, () => HeadingTextModel());
    taglessSongWidgetModel =
        createModel(context, () => TaglessSongWidgetModel());
    nowPlayingBarModel = createModel(context, () => NowPlayingBarModel());
    headingTextModel2 = createModel(context, () => HeadingTextModel());
    searchBarWidgetModel = createModel(context, () => SearchBarWidgetModel());
    headingTextModel3 = createModel(context, () => HeadingTextModel());
    filterButtonModel = createModel(context, () => FilterButtonModel());
    selectTagWidgetModel = createModel(context, () => SelectTagWidgetModel());
    headingTextModel4 = createModel(context, () => HeadingTextModel());
    includedExcludedTagGroupModel =
        createModel(context, () => IncludedExcludedTagGroupModel());
    bottomOptionsBarWidgetModel =
        createModel(context, () => BottomOptionsBarWidgetModel());
  }

  void dispose() {
    headingTextModel1.dispose();
    taglessSongWidgetModel.dispose();
    nowPlayingBarModel.dispose();
    headingTextModel2.dispose();
    searchBarWidgetModel.dispose();
    headingTextModel3.dispose();
    filterButtonModel.dispose();
    selectTagWidgetModel.dispose();
    headingTextModel4.dispose();
    includedExcludedTagGroupModel.dispose();
    bottomOptionsBarWidgetModel.dispose();
  }

  /// Additional helper methods are added here.

}
