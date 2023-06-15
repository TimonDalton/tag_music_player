import 'package:flutter/material.dart';
import 'package:tag_music_player/objectbox.g.dart';
import 'package:tag_music_player/timoncode/models/song.dart';
import 'package:tag_music_player/timoncode/widgets/tag_groups/filterTagsSelector.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/project/components/bottom_bars/bottom_options_bar_widget/bottom_options_bar_widget_widget.dart';
import '/project/components/buttons/colour_button/colour_button_widget.dart';
import '/project/components/buttons/filter_button/filter_button_widget.dart';
import '/project/components/song_widgets/defualt_song/defualt_song_widget.dart';
import '/project/components/tag_widgets/default_tag/default_tag_widget.dart';
import '/project/components/text_widgets/heading_text/heading_text_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:tag_music_player/timoncode/widgets/misc/filterOptionPicker.dart';
import 'package:tag_music_player/timoncode/models/songFilter.dart';
import 'package:tag_music_player/timoncode/objectbox.dart';
import 'package:tag_music_player/timoncode/models/tag.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

Future<void> showSelectSingleTagPopup(BuildContext context, SongFilter currentFilter, Function(SongFilter?) callback) async {
  if (!currentFilter.queryIsSet) {
    currentFilter.generateQuery();
  }
  List<Tag> tags = objectBox.getAllUserDefTags();

  return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                callback(currentFilter);
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
          content: ListView(children: [
            ExpansionTile(
              title: Text('User Tags'),
              children: [
                FilterTagSelector(
                  availableTags: tags,
                  includedTagIds: currentFilter.includedTagIds,
                  excludedTagIds: currentFilter.excludedTagIds,
                ),
              ],
            ),
            ExpansionTile(title: Text('Playlists')),
            ExpansionTile(title: Text('Genres')),
            ExpansionTile(title: Text('Date Added')),
            ExpansionTile(title: Text('Date Created')),
          ]),
        );
      });
}
