import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/project/components/buttons/colour_button/colour_button_widget.dart';
import '/project/components/other/search_bar_widget/search_bar_widget_widget.dart';
import '/project/components/tag_group_widgets/select_tag_widget/select_tag_widget_widget.dart';
import '/project/components/text_widgets/heading_text/heading_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChooseTagPopupModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for heading_text component.
  late HeadingTextModel headingTextModel;
  // Model for search_bar_widget component.
  late SearchBarWidgetModel searchBarWidgetModel;
  // Model for select_tag_widget component.
  late SelectTagWidgetModel selectTagWidgetModel;
  // Model for colour_button component.
  late ColourButtonModel colourButtonModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    headingTextModel = createModel(context, () => HeadingTextModel());
    searchBarWidgetModel = createModel(context, () => SearchBarWidgetModel());
    selectTagWidgetModel = createModel(context, () => SelectTagWidgetModel());
    colourButtonModel = createModel(context, () => ColourButtonModel());
  }

  void dispose() {
    headingTextModel.dispose();
    searchBarWidgetModel.dispose();
    selectTagWidgetModel.dispose();
    colourButtonModel.dispose();
  }

  /// Additional helper methods are added here.

}
