import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/project/components/text_widgets/heading_text/heading_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'library_playlist_widget_model.dart';
export 'library_playlist_widget_model.dart';

class LibraryPlaylistWidgetWidget extends StatefulWidget {
  const LibraryPlaylistWidgetWidget({
    Key? key,
    this.playlistName,
  }) : super(key: key);

  final String? playlistName;

  @override
  _LibraryPlaylistWidgetWidgetState createState() =>
      _LibraryPlaylistWidgetWidgetState();
}

class _LibraryPlaylistWidgetWidgetState
    extends State<LibraryPlaylistWidgetWidget> {
  late LibraryPlaylistWidgetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LibraryPlaylistWidgetModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.36,
          height: 100.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).accent1,
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        wrapWithModel(
          model: _model.headingTextModel,
          updateCallback: () => setState(() {}),
          child: HeadingTextWidget(
            text: widget.playlistName,
          ),
        ),
      ],
    );
  }
}
