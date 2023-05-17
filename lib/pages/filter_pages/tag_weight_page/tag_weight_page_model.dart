import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/project/components/bottom_bars/bottom_options_bar_widget/bottom_options_bar_widget_widget.dart';
import '/project/components/other/tag_weight_slider/tag_weight_slider_widget.dart';
import '/project/components/text_widgets/heading_text/heading_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TagWeightPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for heading_text component.
  late HeadingTextModel headingTextModel;
  // Model for tag_weight_slider component.
  late TagWeightSliderModel tagWeightSliderModel;
  // Model for bottom_options_bar_widget component.
  late BottomOptionsBarWidgetModel bottomOptionsBarWidgetModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    headingTextModel = createModel(context, () => HeadingTextModel());
    tagWeightSliderModel = createModel(context, () => TagWeightSliderModel());
    bottomOptionsBarWidgetModel =
        createModel(context, () => BottomOptionsBarWidgetModel());
  }

  void dispose() {
    headingTextModel.dispose();
    tagWeightSliderModel.dispose();
    bottomOptionsBarWidgetModel.dispose();
  }

  /// Additional helper methods are added here.

}
