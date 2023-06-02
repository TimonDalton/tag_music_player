import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/project/components/tag_widgets/default_tag/default_tag_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'editable_tag_group_model.dart';
export 'editable_tag_group_model.dart';

class EditableTagGroupWidget extends StatefulWidget {
  const EditableTagGroupWidget({Key? key}) : super(key: key);

  @override
  _EditableTagGroupWidgetState createState() => _EditableTagGroupWidgetState();
}

class _EditableTagGroupWidgetState extends State<EditableTagGroupWidget> {
  late EditableTagGroupModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditableTagGroupModel());
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
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
      child: Container(
        height: 174.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primary,
          borderRadius: BorderRadius.circular(0.0),
          shape: BoxShape.rectangle,
        ),
        child: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 150.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).accent1,
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(-0.9, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(7.0, 7.0, 7.0, 7.0),
                      child: Text(
                        'Tap to Edit',
                        style:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  fontFamily: 'Roboto Condensed',
                                  color: FlutterFlowTheme.of(context).accent1,
                                  fontWeight: FontWeight.w600,
                                ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 0.0, 5.0, 0.0),
                          child: Container(
                            width: 5.0,
                            height: 98,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).secondary,
                              borderRadius: BorderRadius.circular(2.0),
                            ),
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
                                model: _model.defaultTagModel4,
                                updateCallback: () => setState(() {}),
                                child: DefaultTagWidget(
                                  name: 'Acoustic',
                                  colour: Color(0xFF5AA849),
                                  fontSize: 12.0,
                                ),
                              ),
                              wrapWithModel(
                                model: _model.defaultTagModel5,
                                updateCallback: () => setState(() {}),
                                child: DefaultTagWidget(
                                  name: 'Vocals',
                                  colour: Color(0xFF0094ED),
                                  fontSize: 12.0,
                                ),
                              ),
                              wrapWithModel(
                                model: _model.defaultTagModel6,
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
