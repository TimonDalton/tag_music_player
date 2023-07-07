import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/project/components/buttons/default_text_button/default_text_button_widget.dart';
import 'package:tag_music_player/timoncode/models/tag.dart';
import 'package:tag_music_player/timoncode/widgets/popups/selectSingleTagPopup.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditTagsPopupPage extends StatefulWidget {
  const EditTagsPopupPage({Key? key}) : super(key: key);

  @override
  _EditTagsPopupPageState createState() => _EditTagsPopupPageState();
}

class _EditTagsPopupPageState extends State<EditTagsPopupPage> {
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
                child: DefaultTextButtonWidget(
                  text: 'Create Tag',
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-0.75, 0.0),
              child: InkWell(
                onTap: () async {
                  Tag? tag;
                  await showSelectSingleTagPopup(context, 'Select a tag to change', (newTag) => tag = newTag);
                  if (tag != null) {
                    context.pushNamed('create_tag_page', extra: {'tag': tag!});
                  }
                },
                child: DefaultTextButtonWidget(
                  text: 'Change\nExisting Tag',
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-0.75, 0.0),
              child: InkWell(
                onTap: () async {
                  Tag? tag;
                  await showSelectSingleTagPopup(context, 'Select a tag to delete', (newTag) => tag = newTag);
                  if (tag != null) {
                    context.pushNamed('confirm_tag_deletion_popup', extra: {'tag': tag!});
                  }
                },
                child: DefaultTextButtonWidget(
                  text: 'Delete Tag',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
