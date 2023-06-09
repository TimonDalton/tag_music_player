import 'package:flutter/material.dart';
import 'package:tag_music_player/objectbox.g.dart';
import 'package:tag_music_player/timoncode/models/song.dart';
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


// List<Widget> buildDropDowns(BuildContext context,SongFilter sfPtr){
//   List<Tag> tags = objectBox.getAllTags();
//   List<String> names = List<String>.generate(tags.length,(index)=>tags[index].name);
//   List<String> prefixes = [];
//   for (int i =0;i<names.length;i++){
//     int index = names[i].indexOf(':');
//     if(index != -1){
//       String pref = names[i].substring(0,index);
//       if(!prefixes.contains(pref)){
//         prefixes.add(pref);
//       }
//     }
//   }
  
//   return List<Widget>.generate(prefixes.length, (index) => FilterPickerDropDown(selectedFilterType: prefixes[index],setTagName: (s) => ,));
// }


// Widget defineFilterPopup(BuildContext context,SongFilter songFilterPtr) {
//   return Scaffold(
//     backgroundColor: FlutterFlowTheme.of(context).primary,
//     appBar: AppBar(
//       backgroundColor: FlutterFlowTheme.of(context).primary,
//       automaticallyImplyLeading: false,
//       leading: FlutterFlowIconButton(
//         borderColor: Colors.transparent,
//         borderRadius: 30,
//         borderWidth: 1,
//         buttonSize: 60,
//         icon: Icon(
//           Icons.arrow_back_rounded,
//           color: Colors.white,
//           size: 30,
//         ),
//         onPressed: () async {
//           context.pop();
//         },
//       ),
//       title: Align(
//         alignment: AlignmentDirectional(-0.35, 0),
//         child: Text(
//           'Define Filter',
//           style: FlutterFlowTheme.of(context).displaySmall.override(
//                 fontFamily: 'Roboto Condensed',
//                 fontSize: 30,
//                 fontWeight: FontWeight.bold,
//               ),
//         ),
//       ),
//       actions: [],
//       centerTitle: false,
//       elevation: 2,
//     ),
//     body: SafeArea(
//       top: true,
//       child: Align(
//         alignment: AlignmentDirectional(0, 0),
//         child: Container(
//           width: MediaQuery.of(context).size.width * 0.85,
//           height: double.infinity,
//           decoration: BoxDecoration(
//             color: Color(0x00FFFFFF),
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.max,
//             children: [
//               Align(
//                 alignment: AlignmentDirectional(-0.95, 0),
//                 child: HeadingTextWidget(
//                   text: 'Artist',
//                 ),
//               ),
//               ...buildDropDowns(context,fc),              // FilterPickerDropDown(setTagName: (String a){}, selectedFilterType: 'playlist: '),
//               // Align(
//               //   alignment: AlignmentDirectional(-0.95, 0),
//               //   child: HeadingTextWidget(
//               //     text: 'Playlist',
//               //   ),
//               // ),
//               // FilterPickerDropDown(setTagName: (String a){}, selectedFilterType: ': '),
//               // Align(
//               //   alignment: AlignmentDirectional(-0.95, 0),
//               //   child: HeadingTextWidget(
//               //     text: 'Genre',
//               //   ),
//               // ),
//               // TextfieldWidgetWidget(),
//               TextButton(child: Text('Save'),onPressed: (){
//                 Navigator.of(context).pop(compileConditions(fc));
//               },),
//             ],
//           ),
//         ),
//       ),
//     ),
//   );
// }
