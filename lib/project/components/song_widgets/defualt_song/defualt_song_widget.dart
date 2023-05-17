import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/project/components/tag_widgets/default_tag/default_tag_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'defualt_song_model.dart';
export 'defualt_song_model.dart';

class DefualtSongWidget extends StatefulWidget {
  const DefualtSongWidget({
    Key? key,
    String? index,
    String? songName,
    String? songLength,
  })  : this.index = index ?? '1',
        this.songName = songName ?? 'SECRET TUNNEL',
        this.songLength = songLength ?? '4:20',
        super(key: key);

  final String index;
  final String songName;
  final String songLength;

  @override
  _DefualtSongWidgetState createState() => _DefualtSongWidgetState();
}

class _DefualtSongWidgetState extends State<DefualtSongWidget> {
  late DefualtSongModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DefualtSongModel());
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
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
      child: Container(
        height: 45.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primary,
          borderRadius: BorderRadius.circular(0.0),
          shape: BoxShape.rectangle,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Container(
            width: double.infinity,
            height: 40.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).accent1,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 0.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).accent1,
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Wrap(
                      spacing: 0.0,
                      runSpacing: 0.0,
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      direction: Axis.horizontal,
                      runAlignment: WrapAlignment.start,
                      verticalDirection: VerticalDirection.down,
                      clipBehavior: Clip.none,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 0.0, 0.0),
                            child: Text(
                              widget.index,
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 0.0, 0.0),
                          child: Text(
                            widget.songName,
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 20.0, 0.0),
                          child: Text(
                            widget.songLength,
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Wrap(
                      spacing: 0.0,
                      runSpacing: 0.0,
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      direction: Axis.horizontal,
                      runAlignment: WrapAlignment.start,
                      verticalDirection: VerticalDirection.down,
                      clipBehavior: Clip.none,
                      children: [
                        wrapWithModel(
                          model: _model.defaultTagModel1,
                          updateCallback: () => setState(() {}),
                          child: DefaultTagWidget(
                            name: 'Acoustic',
                            colour: Color(0xFF5AA849),
                            fontSize: 12.0,
                          ),
                        ),
                        wrapWithModel(
                          model: _model.defaultTagModel2,
                          updateCallback: () => setState(() {}),
                          child: DefaultTagWidget(
                            name: 'Vocals',
                            colour: Color(0xFF0094ED),
                            fontSize: 12.0,
                          ),
                        ),
                        wrapWithModel(
                          model: _model.defaultTagModel3,
                          updateCallback: () => setState(() {}),
                          child: DefaultTagWidget(
                            name: 'Singalong',
                            colour: Color(0xFFFFD600),
                            fontSize: 12.0,
                          ),
                        ),
                      ],
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
