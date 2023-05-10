import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/project/components/tag_widgets/default_tag/default_tag_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DisplayFilterModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // Model for Default_Tag component.
  late DefaultTagModel defaultTagModel1;
  // Model for Default_Tag component.
  late DefaultTagModel defaultTagModel2;
  // Model for Default_Tag component.
  late DefaultTagModel defaultTagModel3;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    defaultTagModel1 = createModel(context, () => DefaultTagModel());
    defaultTagModel2 = createModel(context, () => DefaultTagModel());
    defaultTagModel3 = createModel(context, () => DefaultTagModel());
  }

  void dispose() {
    defaultTagModel1.dispose();
    defaultTagModel2.dispose();
    defaultTagModel3.dispose();
  }

  /// Additional helper methods are added here.

}
