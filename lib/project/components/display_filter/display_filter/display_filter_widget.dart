import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/project/components/tag_widgets/default_tag/default_tag_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'display_filter_model.dart';
export 'display_filter_model.dart';

class DisplayFilterWidget extends StatefulWidget {
  const DisplayFilterWidget({
    Key? key,
    this.filterName,
  }) : super(key: key);

  final String? filterName;

  @override
  _DisplayFilterWidgetState createState() => _DisplayFilterWidgetState();
}

class _DisplayFilterWidgetState extends State<DisplayFilterWidget> {
  late DisplayFilterModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DisplayFilterModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      height: 160.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primary,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              height: 100.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).accent1,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            wrapWithModel(
                              model: _model.defaultTagModel1,
                              updateCallback: () => setState(() {}),
                              child: DefaultTagWidget(
                                name: 'banjo',
                                colour: Color(0xFFFFD600),
                              ),
                            ),
                            wrapWithModel(
                              model: _model.defaultTagModel2,
                              updateCallback: () => setState(() {}),
                              child: DefaultTagWidget(
                                name: 'strings',
                                colour: FlutterFlowTheme.of(context).alternate,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 5.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(2.0),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            wrapWithModel(
                              model: _model.defaultTagModel3,
                              updateCallback: () => setState(() {}),
                              child: DefaultTagWidget(
                                name: 'not strings',
                                colour: FlutterFlowTheme.of(context).info,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 0.0, 5.0),
                      child: Text(
                        'Source: [source]',
                        style:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Roboto Condensed',
                                  color: FlutterFlowTheme.of(context).accent1,
                                  fontSize: 16.0,
                                ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
            child: Text(
              widget.filterName!,
              style: FlutterFlowTheme.of(context).titleLarge.override(
                    fontFamily: 'Roboto Condensed',
                    fontSize: 20.0,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
