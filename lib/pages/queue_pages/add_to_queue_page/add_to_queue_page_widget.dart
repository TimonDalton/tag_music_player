import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/project/components/bottom_bars/bottom_options_bar_widget/bottom_options_bar_widget_widget.dart';
import '/project/components/buttons/filter_button/filter_button_widget.dart';
import '/project/components/song_widgets/defualt_song/defualt_song_widget.dart';
import '/project/components/text_widgets/heading_text/heading_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_to_queue_page_model.dart';
export 'add_to_queue_page_model.dart';

class AddToQueuePageWidget extends StatefulWidget {
  const AddToQueuePageWidget({Key? key}) : super(key: key);

  @override
  _AddToQueuePageWidgetState createState() => _AddToQueuePageWidgetState();
}

class _AddToQueuePageWidgetState extends State<AddToQueuePageWidget> {
  late AddToQueuePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddToQueuePageModel());
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
            alignment: AlignmentDirectional(-0.85, 0.0),
            child: Text(
              'Add Songs to Queue',
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
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0x00FFFFFF),
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        wrapWithModel(
                          model: _model.headingTextModel1,
                          updateCallback: () => setState(() {}),
                          child: HeadingTextWidget(
                            text: 'Select Songs to Add',
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: wrapWithModel(
                                  model: _model.headingTextModel2,
                                  updateCallback: () => setState(() {}),
                                  child: HeadingTextWidget(
                                    text: '[x] Selected',
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
                        ),
                        ListView(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          children: [
                            wrapWithModel(
                              model: _model.defualtSongModel,
                              updateCallback: () => setState(() {}),
                              child: DefualtSongWidget(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: wrapWithModel(
                  model: _model.bottomOptionsBarWidgetModel,
                  updateCallback: () => setState(() {}),
                  child: BottomOptionsBarWidgetWidget(
                    confirmText: 'Confirm',
                    confirmColour: Color(0xFF57CF32),
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
