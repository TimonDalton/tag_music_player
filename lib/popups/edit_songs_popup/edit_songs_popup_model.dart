import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/project/components/buttons/default_text_button/default_text_button_widget.dart';
import '/project/components/text_widgets/heading_text/heading_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditSongsPopupModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for heading_text component.
  late HeadingTextModel headingTextModel1;
  // Model for default_text_button component.
  late DefaultTextButtonModel defaultTextButtonModel1;
  // Model for default_text_button component.
  late DefaultTextButtonModel defaultTextButtonModel2;
  // Model for heading_text component.
  late HeadingTextModel headingTextModel2;
  // Model for default_text_button component.
  late DefaultTextButtonModel defaultTextButtonModel3;
  // Model for heading_text component.
  late HeadingTextModel headingTextModel3;
  // Model for default_text_button component.
  late DefaultTextButtonModel defaultTextButtonModel4;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    headingTextModel1 = createModel(context, () => HeadingTextModel());
    defaultTextButtonModel1 =
        createModel(context, () => DefaultTextButtonModel());
    defaultTextButtonModel2 =
        createModel(context, () => DefaultTextButtonModel());
    headingTextModel2 = createModel(context, () => HeadingTextModel());
    defaultTextButtonModel3 =
        createModel(context, () => DefaultTextButtonModel());
    headingTextModel3 = createModel(context, () => HeadingTextModel());
    defaultTextButtonModel4 =
        createModel(context, () => DefaultTextButtonModel());
  }

  void dispose() {
    headingTextModel1.dispose();
    defaultTextButtonModel1.dispose();
    defaultTextButtonModel2.dispose();
    headingTextModel2.dispose();
    defaultTextButtonModel3.dispose();
    headingTextModel3.dispose();
    defaultTextButtonModel4.dispose();
  }

  /// Additional helper methods are added here.

}
