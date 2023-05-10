import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/project/components/buttons/mini_button/mini_button_widget.dart';
import '/project/components/tag_widgets/default_tag/default_tag_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SelectRequiredTagModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // Model for mini_button component.
  late MiniButtonModel miniButtonModel;
  // Model for Default_Tag component.
  late DefaultTagModel defaultTagModel1;
  // Model for Default_Tag component.
  late DefaultTagModel defaultTagModel2;
  // Model for Default_Tag component.
  late DefaultTagModel defaultTagModel3;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    miniButtonModel = createModel(context, () => MiniButtonModel());
    defaultTagModel1 = createModel(context, () => DefaultTagModel());
    defaultTagModel2 = createModel(context, () => DefaultTagModel());
    defaultTagModel3 = createModel(context, () => DefaultTagModel());
  }

  void dispose() {
    miniButtonModel.dispose();
    defaultTagModel1.dispose();
    defaultTagModel2.dispose();
    defaultTagModel3.dispose();
  }

  /// Additional helper methods are added here.

}
