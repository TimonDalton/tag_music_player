import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/project/components/buttons/colour_button/colour_button_widget.dart';
import '/project/components/tag_group_widgets/select_tag_widget/select_tag_widget_widget.dart';
import '/project/components/text_widgets/heading_text/heading_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SelectEditableSongTagsPopupModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for heading_text component.
  late HeadingTextModel headingTextModel1;
  // Model for colour_button component.
  late ColourButtonModel colourButtonModel1;
  // Model for colour_button component.
  late ColourButtonModel colourButtonModel2;
  // Model for heading_text component.
  late HeadingTextModel headingTextModel2;
  // Model for select_tag_widget component.
  late SelectTagWidgetModel selectTagWidgetModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    headingTextModel1 = createModel(context, () => HeadingTextModel());
    colourButtonModel1 = createModel(context, () => ColourButtonModel());
    colourButtonModel2 = createModel(context, () => ColourButtonModel());
    headingTextModel2 = createModel(context, () => HeadingTextModel());
    selectTagWidgetModel = createModel(context, () => SelectTagWidgetModel());
  }

  void dispose() {
    headingTextModel1.dispose();
    colourButtonModel1.dispose();
    colourButtonModel2.dispose();
    headingTextModel2.dispose();
    selectTagWidgetModel.dispose();
  }

  /// Additional helper methods are added here.

}
