import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/project/components/other/bottom_options_bar_widget/bottom_options_bar_widget_widget.dart';
import '/project/components/tag_widgets/default_tag/default_tag_widget.dart';
import '/project/components/text_widgets/heading_text/heading_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'confirm_tag_deletion_popup_model.dart';
export 'confirm_tag_deletion_popup_model.dart';

class ConfirmTagDeletionPopupWidget extends StatefulWidget {
  const ConfirmTagDeletionPopupWidget({Key? key}) : super(key: key);

  @override
  _ConfirmTagDeletionPopupWidgetState createState() =>
      _ConfirmTagDeletionPopupWidgetState();
}

class _ConfirmTagDeletionPopupWidgetState
    extends State<ConfirmTagDeletionPopupWidget> {
  late ConfirmTagDeletionPopupModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConfirmTagDeletionPopupModel());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primary,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 36.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Align(
            alignment: AlignmentDirectional(-0.65, 0.0),
            child: Text(
              'Tags to be Deleted',
              style: FlutterFlowTheme.of(context).displaySmall.override(
                    fontFamily: 'Roboto Condensed',
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.85,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Color(0x00FFFFFF),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
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
                        wrapWithModel(
                          model: _model.defaultTagModel1,
                          updateCallback: () => setState(() {}),
                          child: DefaultTagWidget(
                            name: 'Rock',
                            colour: Color(0xFFE85536),
                          ),
                        ),
                        wrapWithModel(
                          model: _model.defaultTagModel2,
                          updateCallback: () => setState(() {}),
                          child: DefaultTagWidget(
                            name: 'Slow',
                            colour: Color(0xFF5AA849),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: wrapWithModel(
                        model: _model.headingTextModel,
                        updateCallback: () => setState(() {}),
                        child: HeadingTextWidget(
                          text:
                              'Are you sure you want to delete these tags and remove them from all of your songs?',
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: wrapWithModel(
                      model: _model.bottomOptionsBarWidgetModel,
                      updateCallback: () => setState(() {}),
                      child: BottomOptionsBarWidgetWidget(
                        confirmText: 'Delete',
                        confirmColour: Color(0xFFE85536),
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
