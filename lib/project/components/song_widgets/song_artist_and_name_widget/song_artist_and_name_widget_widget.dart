import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'song_artist_and_name_widget_model.dart';
export 'song_artist_and_name_widget_model.dart';

class SongArtistAndNameWidgetWidget extends StatefulWidget {
  const SongArtistAndNameWidgetWidget({
    Key? key,
    this.songName,
    this.artistName,
  }) : super(key: key);

  final String? songName;
  final String? artistName;

  @override
  _SongArtistAndNameWidgetWidgetState createState() =>
      _SongArtistAndNameWidgetWidgetState();
}

class _SongArtistAndNameWidgetWidgetState
    extends State<SongArtistAndNameWidgetWidget> {
  late SongArtistAndNameWidgetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SongArtistAndNameWidgetModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
      child: Container(
        width: 100.0,
        height: 40.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primary,
          borderRadius: BorderRadius.circular(0.0),
          shape: BoxShape.rectangle,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).accent1,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Align(
              alignment: AlignmentDirectional(-1.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: AlignmentDirectional(-0.1, 0.0),
                    child: Text(
                      valueOrDefault<String>(
                        widget.songName,
                        'songName',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Roboto Condensed',
                            fontSize: 12.0,
                          ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-0.1, 0.0),
                    child: Text(
                      widget.artistName!,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Roboto Condensed',
                            color: FlutterFlowTheme.of(context).accent1,
                            fontSize: 10.0,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
