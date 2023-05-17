import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/project/components/bottom_bars/bottom_options_bar_widget/bottom_options_bar_widget_widget.dart';
import '/project/components/buttons/filter_button/filter_button_widget.dart';
import '/project/components/song_widgets/defualt_song/defualt_song_widget.dart';
import '/project/components/text_widgets/heading_text/heading_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TrimQueuePageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for heading_text component.
  late HeadingTextModel headingTextModel1;
  // Model for heading_text component.
  late HeadingTextModel headingTextModel2;
  // Model for filter_button component.
  late FilterButtonModel filterButtonModel;
  // Model for Defualt_Song component.
  late DefualtSongModel defualtSongModel;
  // Model for bottom_options_bar_widget component.
  late BottomOptionsBarWidgetModel bottomOptionsBarWidgetModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    headingTextModel1 = createModel(context, () => HeadingTextModel());
    headingTextModel2 = createModel(context, () => HeadingTextModel());
    filterButtonModel = createModel(context, () => FilterButtonModel());
    defualtSongModel = createModel(context, () => DefualtSongModel());
    bottomOptionsBarWidgetModel =
        createModel(context, () => BottomOptionsBarWidgetModel());
  }

  void dispose() {
    headingTextModel1.dispose();
    headingTextModel2.dispose();
    filterButtonModel.dispose();
    defualtSongModel.dispose();
    bottomOptionsBarWidgetModel.dispose();
  }

  /// Additional helper methods are added here.

}
