import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/project/components/bottom_bars/bottom_nav_bar_widget/bottom_nav_bar_widget_widget.dart';
import '/project/components/buttons/default_button/default_button_widget.dart';
import '/project/components/display_filter/display_filter/display_filter_widget.dart';
import '/project/components/other/search_bar_widget/search_bar_widget_widget.dart';
import '/project/components/text_widgets/heading_text/heading_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FiltersPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for heading_text component.
  late HeadingTextModel headingTextModel1;
  // Model for search_bar_widget component.
  late SearchBarWidgetModel searchBarWidgetModel;
  // Model for heading_text component.
  late HeadingTextModel headingTextModel2;
  // Model for display_filter component.
  late DisplayFilterModel displayFilterModel1;
  // Model for display_filter component.
  late DisplayFilterModel displayFilterModel2;
  // Model for display_filter component.
  late DisplayFilterModel displayFilterModel3;
  // Model for display_filter component.
  late DisplayFilterModel displayFilterModel4;
  // Model for Default_Button component.
  late DefaultButtonModel defaultButtonModel1;
  // Model for Default_Button component.
  late DefaultButtonModel defaultButtonModel2;
  // Model for bottom_nav_bar_widget component.
  late BottomNavBarWidgetModel bottomNavBarWidgetModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    headingTextModel1 = createModel(context, () => HeadingTextModel());
    searchBarWidgetModel = createModel(context, () => SearchBarWidgetModel());
    headingTextModel2 = createModel(context, () => HeadingTextModel());
    displayFilterModel1 = createModel(context, () => DisplayFilterModel());
    displayFilterModel2 = createModel(context, () => DisplayFilterModel());
    displayFilterModel3 = createModel(context, () => DisplayFilterModel());
    displayFilterModel4 = createModel(context, () => DisplayFilterModel());
    defaultButtonModel1 = createModel(context, () => DefaultButtonModel());
    defaultButtonModel2 = createModel(context, () => DefaultButtonModel());
    bottomNavBarWidgetModel =
        createModel(context, () => BottomNavBarWidgetModel());
  }

  void dispose() {
    headingTextModel1.dispose();
    searchBarWidgetModel.dispose();
    headingTextModel2.dispose();
    displayFilterModel1.dispose();
    displayFilterModel2.dispose();
    displayFilterModel3.dispose();
    displayFilterModel4.dispose();
    defaultButtonModel1.dispose();
    defaultButtonModel2.dispose();
    bottomNavBarWidgetModel.dispose();
  }

  /// Additional helper methods are added here.

}
