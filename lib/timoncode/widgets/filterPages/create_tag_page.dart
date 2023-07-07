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

class CreateTagPage extends StatefulWidget {
  CreateTagPage({this.tag});
  Tag? tag;
  @override
  _CreateTagPageState createState() => _CreateTagPageState();
}

class _CreateTagPageState extends State<CreateTagPage> {
  TextEditingController nameTEC = TextEditingController();
  int colourIndex = 0;
  void setcolourIndex(int newId) {
    if (newId >= Tag.colours.length) {
      throw '${newId} is not a valid colour id';
    }
    setState(() {
      colourIndex = newId;
    });
  }

  @override
  void initState() {
    if (widget.tag != null) {
      colourIndex = widget.tag!.colourIndex;
      nameTEC.text = widget.tag!.name;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            child: HeadingTextWidget(
                              text: 'Name',
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                            child: TextField(
                              controller: nameTEC,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: HeadingTextWidget(
                              text: 'Colour',
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                ColourPickerDropDown(selectIndex: setcolourIndex, selectedId: colourIndex),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
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
                                        color: Tag.colours[colourIndex],
                                        borderRadius: BorderRadius.circular(20.0),
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
                    if (objectBox.isTagNameUnique(nameTEC.text) || widget.tag != null) {
                      Tag tag = (widget.tag == null)
                      ?Tag(name: nameTEC.text, colourIndex: colourIndex, userDefined: true)
                      :Tag(name: nameTEC.text, colourIndex: colourIndex, userDefined: true,id: widget.tag!.id);
                      objectBox.saveTag(tag);
                      navBase(context);
                      showMessageSnackbar('Tag Saved', context);
                    } else {
                      showMessageSnackbar('Tag named ${nameTEC.text} already exists.', context);
                    }
                  } else {
                    showSnackbar(context, '${nameTEC.text} is not a valid tag name');
                  }
                },
                confirmColour: Colors.lightBlue,
                confirmText: 'Save Tag'),
          ],
        ),
      ),
    );
  }
}
