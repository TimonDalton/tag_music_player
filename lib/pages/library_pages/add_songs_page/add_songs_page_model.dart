import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/project/components/other/library_playlist_widget/library_playlist_widget_widget.dart';
import '/project/components/other/search_bar_widget/search_bar_widget_widget.dart';
import '/project/components/text_widgets/heading_text/heading_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddSongsPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for heading_text component.
  late HeadingTextModel headingTextModel1;
  // Model for search_bar_widget component.
  late SearchBarWidgetModel searchBarWidgetModel;
  // Model for heading_text component.
  late HeadingTextModel headingTextModel2;
  // Model for library_playlist_widget component.
  late LibraryPlaylistWidgetModel libraryPlaylistWidgetModel1;
  // Model for library_playlist_widget component.
  late LibraryPlaylistWidgetModel libraryPlaylistWidgetModel2;
  // Model for library_playlist_widget component.
  late LibraryPlaylistWidgetModel libraryPlaylistWidgetModel3;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    headingTextModel1 = createModel(context, () => HeadingTextModel());
    searchBarWidgetModel = createModel(context, () => SearchBarWidgetModel());
    headingTextModel2 = createModel(context, () => HeadingTextModel());
    libraryPlaylistWidgetModel1 =
        createModel(context, () => LibraryPlaylistWidgetModel());
    libraryPlaylistWidgetModel2 =
        createModel(context, () => LibraryPlaylistWidgetModel());
    libraryPlaylistWidgetModel3 =
        createModel(context, () => LibraryPlaylistWidgetModel());
  }

  void dispose() {
    headingTextModel1.dispose();
    searchBarWidgetModel.dispose();
    headingTextModel2.dispose();
    libraryPlaylistWidgetModel1.dispose();
    libraryPlaylistWidgetModel2.dispose();
    libraryPlaylistWidgetModel3.dispose();
  }

  /// Additional helper methods are added here.

}
