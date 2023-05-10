import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/project/components/text_widgets/heading_text/heading_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LibraryPlaylistWidgetModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // Model for heading_text component.
  late HeadingTextModel headingTextModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    headingTextModel = createModel(context, () => HeadingTextModel());
  }

  void dispose() {
    headingTextModel.dispose();
  }

  /// Additional helper methods are added here.

}
