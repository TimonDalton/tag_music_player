import 'package:tag_music_player/timoncode/objectbox.dart';

import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/project/components/buttons/colour_button/colour_button_widget.dart';
import '/project/components/tag_group_widgets/select_tag_widget/select_tag_widget_widget.dart';
import '/project/components/text_widgets/heading_text/heading_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tag_music_player/timoncode/models/tag.dart';
import 'package:tag_music_player/timoncode/widgets/tag_groups/tagSelector.dart';

class SelectEditableSongTagsPage extends StatefulWidget {
  const SelectEditableSongTagsPage({Key? key}) : super(key: key);

  @override
  _SelectEditableSongTagsPopupWidgetState createState() => _SelectEditableSongTagsPopupWidgetState();
}

class _SelectEditableSongTagsPopupWidgetState extends State<SelectEditableSongTagsPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    List<Tag> tags = objectBox.getAllUserDefTags();
    TagSelector tagSelector = TagSelector(
      tags: tags,
      maxSelectable: 3,
      overflowMax: false,
    );
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
            alignment: AlignmentDirectional(-0.3, 0.0),
            child: Text(
              'Your Tags',
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
                color: FlutterFlowTheme.of(context).primary,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(0.0, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 25.0),
                              child: HeadingTextWidget(
                                text: '${tagSelector.selectedIndicies.length} Selected',
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () => setState(() {
                              tagSelector.selectedIndicies = [];
                            }),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                              child: ColourButtonWidget(
                                buttonColour: FlutterFlowTheme.of(context).secondary,
                                text: 'Deselect\nAll',
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed('change_song_tags_individually_page');
                              },
                              child: InkWell(
                                onTap: (){
                                  List<int> tagIds = tagSelector.getSelectedTagIds();
                                  if (tagIds.length > 0){
                                    context.pushNamed('change_song_tags_individually_page',extra: {'tagIds':tagIds});
                                  }
                                },
                                child: ColourButtonWidget(
                                  buttonColour: Color(0xFF2BB13F),
                                  text: 'Confirm',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: HeadingTextWidget(
                      text: 'Select tags you want to add or remove',
                    ),
                  ),
                  Container(child: tagSelector,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
