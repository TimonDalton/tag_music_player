import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dropdown_text_widget_model.dart';
export 'dropdown_text_widget_model.dart';

class DropdownTextWidgetWidget extends StatefulWidget {
  const DropdownTextWidgetWidget({
    Key? key,
    this.hintText,
  }) : super(key: key);

  final String? hintText;

  @override
  _DropdownTextWidgetWidgetState createState() =>
      _DropdownTextWidgetWidgetState();
}

class _DropdownTextWidgetWidgetState extends State<DropdownTextWidgetWidget> {
  late DropdownTextWidgetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DropdownTextWidgetModel());

    _model.textController ??= TextEditingController();
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
      width: double.infinity,
      height: 50.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primary,
      ),
      child: Container(
        width: 100.0,
        height: 100.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).accent1,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 8,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                child: TextFormField(
                  controller: _model.textController,
                  autofocus: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: widget.hintText,
                    hintStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Roboto Condensed',
                          color: FlutterFlowTheme.of(context).accent1,
                        ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1.0,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1.0,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1.0,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    focusedErrorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1.0,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Roboto Condensed',
                        fontSize: 16.0,
                      ),
                  validator:
                      _model.textControllerValidator.asValidator(context),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Align(
                alignment: AlignmentDirectional(0.0, -0.15),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 10.0),
                  child: Icon(
                    Icons.arrow_drop_down,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 70.0,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                  color: Color(0x00FFFFFF),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
