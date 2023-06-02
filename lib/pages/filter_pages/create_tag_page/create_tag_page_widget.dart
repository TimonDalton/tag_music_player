import 'package:tag_music_player/timoncode/functions/nav/navBase.dart';

import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/project/components/text_widgets/dropdown_text_widget/dropdown_text_widget_widget.dart';
import '/project/components/text_widgets/heading_text/heading_text_widget.dart';
import '/project/components/text_widgets/textfield_widget/textfield_widget_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tag_music_player/timoncode/widgets/bottom_bars/bottom_options_bar.dart';
import 'package:tag_music_player/timoncode/widgets/misc/colourPickerDropdown.dart';
import 'package:tag_music_player/timoncode/showSnackbar/showMessageSnackbar.dart';
import 'package:tag_music_player/timoncode/objectbox.dart';
import 'package:tag_music_player/timoncode/models/tag.dart';
import 'create_tag_page_model.dart';
export 'create_tag_page_model.dart';

class CreateTagPageWidget extends StatefulWidget {
  CreateTagPageWidget({Key? key}) : super(key: key);

  @override
  _CreateTagPageWidgetState createState() => _CreateTagPageWidgetState();
}

class _CreateTagPageWidgetState extends State<CreateTagPageWidget> {
  TextEditingController nameTEC = TextEditingController();
  int colourId = 0;
  void setColourId(int newId) {
    if (newId >= Tag.colours.length) {
      throw '${newId} is not a valid colour id';
    }
    setState(() {
      colourId = newId;
    });
  }

  late CreateTagPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateTagPageModel());
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
              size: 46.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Align(
            alignment: AlignmentDirectional(-0.35, 0.0),
            child: Text(
              'Tag Details',
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
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width * 1.0,
                  height: MediaQuery.of(context).size.height * 0.9,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primary,
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      height: MediaQuery.of(context).size.height * 1.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primary,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
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
                                  0.0, 10.0, 0.0, 0.0),
                              child: wrapWithModel(
                                model: _model.textfieldWidgetModel,
                                updateCallback: () => setState(() {}),
                                child: TextField(
                                  controller: nameTEC,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: wrapWithModel(
                                model: _model.headingTextModel2,
                                updateCallback: () => setState(() {}),
                                child: HeadingTextWidget(
                                  text: 'Colour',
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  ColourPickerDropDown(
                                      selectIndex: setColourId,
                                      selectedId: colourId),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 0.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: 50.0,
                                        child: Center(
                                          child: Text(
                                            nameTEC.text,
                                            style: TextStyle(
                                              fontSize: 25,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                          color: Tag.colours[colourId],
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                      ),
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
              ),
              BottomOptionsBar(
                  confirmTap: () {
                    if (nameTEC.text != '') {
                      if (objectBox.isTagNameUnique(nameTEC.text)) {
                        Tag tag = Tag(
                            name: nameTEC.text,
                            colourId: colourId,
                            userDefined: true);
                        objectBox.saveTag(tag);
                        navBase(context);
                        showMessageSnackbar('Tag Saved', context);
                      } else {
                        showMessageSnackbar(
                            'Tag named ${nameTEC.text} already exists.',
                            context);
                      }
                    } else {
                      showSnackbar(
                          context, '${nameTEC.text} is not a valid tag name');
                    }
                  },
                  confirmColour: Colors.lightBlue,
                  confirmText: 'Save Tag'),
            ],
          ),
        ),
      ),
    );
  }
}
