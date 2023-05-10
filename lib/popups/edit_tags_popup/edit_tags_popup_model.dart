import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/project/components/buttons/default_text_button/default_text_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditTagsPopupModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for default_text_button component.
  late DefaultTextButtonModel defaultTextButtonModel1;
  // Model for default_text_button component.
  late DefaultTextButtonModel defaultTextButtonModel2;
  // Model for default_text_button component.
  late DefaultTextButtonModel defaultTextButtonModel3;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    defaultTextButtonModel1 =
        createModel(context, () => DefaultTextButtonModel());
    defaultTextButtonModel2 =
        createModel(context, () => DefaultTextButtonModel());
    defaultTextButtonModel3 =
        createModel(context, () => DefaultTextButtonModel());
  }

  void dispose() {
    defaultTextButtonModel1.dispose();
    defaultTextButtonModel2.dispose();
    defaultTextButtonModel3.dispose();
  }

  /// Additional helper methods are added here.

}
