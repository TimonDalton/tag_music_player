import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/project/components/buttons/default_text_button/default_text_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_tags_popup_model.dart';
export 'edit_tags_popup_model.dart';

class EditTagsPopupWidget extends StatefulWidget {
  const EditTagsPopupWidget({Key? key}) : super(key: key);

  @override
  _EditTagsPopupWidgetState createState() => _EditTagsPopupWidgetState();
}

class _EditTagsPopupWidgetState extends State<EditTagsPopupWidget> {
  late EditTagsPopupModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditTagsPopupModel());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Align(
            alignment: AlignmentDirectional(-1.0, 0.0),
            child: Text(
              'Edit Tags',
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
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(-0.75, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed('create_tag_page');
                  },
                  child: wrapWithModel(
                    model: _model.defaultTextButtonModel1,
                    updateCallback: () => setState(() {}),
                    child: DefaultTextButtonWidget(
                      text: 'Create Tag',
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.75, 0.0),
                child: wrapWithModel(
                  model: _model.defaultTextButtonModel2,
                  updateCallback: () => setState(() {}),
                  child: DefaultTextButtonWidget(
                    text: 'Change\nExisting Tag',
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.75, 0.0),
                child: wrapWithModel(
                  model: _model.defaultTextButtonModel3,
                  updateCallback: () => setState(() {}),
                  child: DefaultTextButtonWidget(
                    text: 'Delete Tag',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
