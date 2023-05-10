import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/project/components/buttons/filter_button/filter_button_widget.dart';
import '/project/components/other/bottom_options_bar_widget/bottom_options_bar_widget_widget.dart';
import '/project/components/other/search_bar_widget/search_bar_widget_widget.dart';
import '/project/components/tag_group_widgets/included_excluded_tag_group/included_excluded_tag_group_widget.dart';
import '/project/components/tag_group_widgets/select_required_tag/select_required_tag_widget.dart';
import '/project/components/text_widgets/heading_text/heading_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class QueueEditFilterPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for heading_text component.
  late HeadingTextModel headingTextModel1;
  // Model for search_bar_widget component.
  late SearchBarWidgetModel searchBarWidgetModel;
  // Model for heading_text component.
  late HeadingTextModel headingTextModel2;
  // Model for filter_button component.
  late FilterButtonModel filterButtonModel;
  // Model for select_required_tag component.
  late SelectRequiredTagModel selectRequiredTagModel;
  // Model for heading_text component.
  late HeadingTextModel headingTextModel3;
  // Model for included_excluded_tag_group component.
  late IncludedExcludedTagGroupModel includedExcludedTagGroupModel;
  // Model for bottom_options_bar_widget component.
  late BottomOptionsBarWidgetModel bottomOptionsBarWidgetModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    headingTextModel1 = createModel(context, () => HeadingTextModel());
    searchBarWidgetModel = createModel(context, () => SearchBarWidgetModel());
    headingTextModel2 = createModel(context, () => HeadingTextModel());
    filterButtonModel = createModel(context, () => FilterButtonModel());
    selectRequiredTagModel =
        createModel(context, () => SelectRequiredTagModel());
    headingTextModel3 = createModel(context, () => HeadingTextModel());
    includedExcludedTagGroupModel =
        createModel(context, () => IncludedExcludedTagGroupModel());
    bottomOptionsBarWidgetModel =
        createModel(context, () => BottomOptionsBarWidgetModel());
  }

  void dispose() {
    headingTextModel1.dispose();
    searchBarWidgetModel.dispose();
    headingTextModel2.dispose();
    filterButtonModel.dispose();
    selectRequiredTagModel.dispose();
    headingTextModel3.dispose();
    includedExcludedTagGroupModel.dispose();
    bottomOptionsBarWidgetModel.dispose();
  }

  /// Additional helper methods are added here.

}
