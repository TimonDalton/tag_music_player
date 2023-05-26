import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/project/components/buttons/default_button/default_button_widget.dart';
import '/project/components/text_widgets/heading_text/heading_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ControlSpotifyAccountModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for Default_Button component.
  late DefaultButtonModel defaultButtonModel1;
  // Model for Default_Button component.
  late DefaultButtonModel defaultButtonModel2;
  // Model for heading_text component.
  late HeadingTextModel headingTextModel1;
  // Model for heading_text component.
  late HeadingTextModel headingTextModel2;
  // Model for heading_text component.
  late HeadingTextModel headingTextModel3;
  // Model for heading_text component.
  late HeadingTextModel headingTextModel4;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    defaultButtonModel1 = createModel(context, () => DefaultButtonModel());
    defaultButtonModel2 = createModel(context, () => DefaultButtonModel());
    headingTextModel1 = createModel(context, () => HeadingTextModel());
    headingTextModel2 = createModel(context, () => HeadingTextModel());
    headingTextModel3 = createModel(context, () => HeadingTextModel());
    headingTextModel4 = createModel(context, () => HeadingTextModel());
  }

  void dispose() {
    defaultButtonModel1.dispose();
    defaultButtonModel2.dispose();
    headingTextModel1.dispose();
    headingTextModel2.dispose();
    headingTextModel3.dispose();
    headingTextModel4.dispose();
  }

  /// Additional helper methods are added here.

}
