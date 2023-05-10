import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/project/components/other/bottom_options_bar_widget/bottom_options_bar_widget_widget.dart';
import '/project/components/tag_widgets/default_tag/default_tag_widget.dart';
import '/project/components/text_widgets/heading_text/heading_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ConfirmTagDeletionPopupModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for Default_Tag component.
  late DefaultTagModel defaultTagModel1;
  // Model for Default_Tag component.
  late DefaultTagModel defaultTagModel2;
  // Model for heading_text component.
  late HeadingTextModel headingTextModel;
  // Model for bottom_options_bar_widget component.
  late BottomOptionsBarWidgetModel bottomOptionsBarWidgetModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    defaultTagModel1 = createModel(context, () => DefaultTagModel());
    defaultTagModel2 = createModel(context, () => DefaultTagModel());
    headingTextModel = createModel(context, () => HeadingTextModel());
    bottomOptionsBarWidgetModel =
        createModel(context, () => BottomOptionsBarWidgetModel());
  }

  void dispose() {
    defaultTagModel1.dispose();
    defaultTagModel2.dispose();
    headingTextModel.dispose();
    bottomOptionsBarWidgetModel.dispose();
  }

  /// Additional helper methods are added here.

}
