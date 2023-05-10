import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/project/components/buttons/filter_button/filter_button_widget.dart';
import '/project/components/other/bottom_options_bar_widget/bottom_options_bar_widget_widget.dart';
import '/project/components/other/search_bar_widget/search_bar_widget_widget.dart';
import '/project/components/tag_group_widgets/included_excluded_tag_group/included_excluded_tag_group_widget.dart';
import '/project/components/tag_group_widgets/select_required_tag/select_required_tag_widget.dart';
import '/project/components/text_widgets/dropdown_text_widget/dropdown_text_widget_widget.dart';
import '/project/components/text_widgets/heading_text/heading_text_widget.dart';
import '/project/components/text_widgets/textfield_widget/textfield_widget_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'define_filter_page_model.dart';
export 'define_filter_page_model.dart';

class DefineFilterPageWidget extends StatefulWidget {
  const DefineFilterPageWidget({Key? key}) : super(key: key);

  @override
  _DefineFilterPageWidgetState createState() => _DefineFilterPageWidgetState();
}

class _DefineFilterPageWidgetState extends State<DefineFilterPageWidget> {
  late DefineFilterPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DefineFilterPageModel());
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
              size: 46.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Align(
            alignment: AlignmentDirectional(-0.35, 0.0),
            child: Text(
              'Create Filter',
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
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0x00FFFFFF),
                  ),
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: wrapWithModel(
                              model: _model.headingTextModel1,
                              updateCallback: () => setState(() {}),
                              child: HeadingTextWidget(
                                text: 'Name',
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 5.0, 0.0, 0.0),
                            child: wrapWithModel(
                              model: _model.textfieldWidgetModel1,
                              updateCallback: () => setState(() {}),
                              child: TextfieldWidgetWidget(
                                hintText: 'Enter Filter Name Here',
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: wrapWithModel(
                                model: _model.headingTextModel2,
                                updateCallback: () => setState(() {}),
                                child: HeadingTextWidget(
                                  text: 'Description',
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 5.0, 0.0, 0.0),
                            child: wrapWithModel(
                              model: _model.textfieldWidgetModel2,
                              updateCallback: () => setState(() {}),
                              child: TextfieldWidgetWidget(
                                hintText: 'Enter Description Here',
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: wrapWithModel(
                                model: _model.headingTextModel3,
                                updateCallback: () => setState(() {}),
                                child: HeadingTextWidget(
                                  text: 'Filter Source',
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 5.0, 0.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primary,
                              ),
                              child: wrapWithModel(
                                model: _model.dropdownTextWidgetModel,
                                updateCallback: () => setState(() {}),
                                child: DropdownTextWidgetWidget(),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: wrapWithModel(
                                model: _model.headingTextModel4,
                                updateCallback: () => setState(() {}),
                                child: HeadingTextWidget(
                                  text: 'Search Tags',
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 0.0, 0.0),
                              child: wrapWithModel(
                                model: _model.searchBarWidgetModel,
                                updateCallback: () => setState(() {}),
                                child: SearchBarWidgetWidget(
                                  hintText: 'Enter tag name here',
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: wrapWithModel(
                                    model: _model.headingTextModel5,
                                    updateCallback: () => setState(() {}),
                                    child: HeadingTextWidget(
                                      text: 'Available Tags',
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: wrapWithModel(
                                  model: _model.filterButtonModel,
                                  updateCallback: () => setState(() {}),
                                  child: FilterButtonWidget(),
                                ),
                              ),
                            ],
                          ),
                          wrapWithModel(
                            model: _model.selectRequiredTagModel,
                            updateCallback: () => setState(() {}),
                            child: SelectRequiredTagWidget(),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1.0, -1.0),
                            child: wrapWithModel(
                              model: _model.headingTextModel6,
                              updateCallback: () => setState(() {}),
                              child: HeadingTextWidget(
                                text: 'Selected Tags',
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, -1.0),
                            child: wrapWithModel(
                              model: _model.includedExcludedTagGroupModel,
                              updateCallback: () => setState(() {}),
                              child: IncludedExcludedTagGroupWidget(),
                            ),
                          ),
                          Container(
                            width: 100.0,
                            height: 150.0,
                            decoration: BoxDecoration(
                              color: Color(0x00FFFFFF),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              wrapWithModel(
                model: _model.bottomOptionsBarWidgetModel,
                updateCallback: () => setState(() {}),
                child: BottomOptionsBarWidgetWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
