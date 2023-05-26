import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/project/components/buttons/colour_button/colour_button_widget.dart';
import '/project/components/other/search_bar_widget/search_bar_widget_widget.dart';
import '/project/components/tag_group_widgets/select_tag_widget/select_tag_widget_widget.dart';
import '/project/components/text_widgets/heading_text/heading_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'choose_tag_to_delete_popup_model.dart';
export 'choose_tag_to_delete_popup_model.dart';

class ChooseTagToDeletePopupWidget extends StatefulWidget {
  const ChooseTagToDeletePopupWidget({Key? key}) : super(key: key);

  @override
  _ChooseTagToDeletePopupWidgetState createState() =>
      _ChooseTagToDeletePopupWidgetState();
}

class _ChooseTagToDeletePopupWidgetState
    extends State<ChooseTagToDeletePopupWidget> {
  late ChooseTagToDeletePopupModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChooseTagToDeletePopupModel());
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
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.0, -1.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Color(0x00FFFFFF),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: wrapWithModel(
                      model: _model.headingTextModel,
                      updateCallback: () => setState(() {}),
                      child: HeadingTextWidget(
                        text: 'Search For Tag',
                      ),
                    ),
                  ),
                  wrapWithModel(
                    model: _model.searchBarWidgetModel,
                    updateCallback: () => setState(() {}),
                    child: SearchBarWidgetWidget(
                      hintText: 'Enter Tag Name Here',
                    ),
                  ),
                  wrapWithModel(
                    model: _model.selectTagWidgetModel,
                    updateCallback: () => setState(() {}),
                    child: SelectTagWidgetWidget(),
                  ),
                  Align(
                    alignment: AlignmentDirectional(1.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed('confirm_tag_deletion_popup');
                      },
                      child: wrapWithModel(
                        model: _model.colourButtonModel,
                        updateCallback: () => setState(() {}),
                        child: ColourButtonWidget(
                          buttonColour: Color(0xFF0095FF),
                          text: 'Next',
                        ),
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
