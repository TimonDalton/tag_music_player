import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/project/components/text_widgets/dropdown_text_widget/dropdown_text_widget_widget.dart';
import '/project/components/text_widgets/heading_text/heading_text_widget.dart';
import '/project/components/text_widgets/textfield_widget/textfield_widget_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateTagPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for heading_text component.
  late HeadingTextModel headingTextModel1;
  // Model for textfield_widget component.
  late TextfieldWidgetModel textfieldWidgetModel;
  // Model for heading_text component.
  late HeadingTextModel headingTextModel2;
  // Model for dropdown_text_widget component.
  late DropdownTextWidgetModel dropdownTextWidgetModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    headingTextModel1 = createModel(context, () => HeadingTextModel());
    textfieldWidgetModel = createModel(context, () => TextfieldWidgetModel());
    headingTextModel2 = createModel(context, () => HeadingTextModel());
    dropdownTextWidgetModel =
        createModel(context, () => DropdownTextWidgetModel());
  }

  void dispose() {
    headingTextModel1.dispose();
    textfieldWidgetModel.dispose();
    headingTextModel2.dispose();
    dropdownTextWidgetModel.dispose();
  }

  /// Additional helper methods are added here.

}
