import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/project/components/control_page_components/control_spotify_account_display_and_link/control_spotify_account_display_and_link_widget.dart';
import '/project/components/control_page_components/control_subscription_board_link/control_subscription_board_link_widget.dart';
import '/project/components/control_page_components/control_suggestion_control/control_suggestion_control_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ControlMainPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for control_spotify_account_display_and_link component.
  late ControlSpotifyAccountDisplayAndLinkModel
      controlSpotifyAccountDisplayAndLinkModel;
  // Model for control_subscription_board_link component.
  late ControlSubscriptionBoardLinkModel controlSubscriptionBoardLinkModel;
  // Model for control_suggestion_control component.
  late ControlSuggestionControlModel controlSuggestionControlModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    controlSpotifyAccountDisplayAndLinkModel =
        createModel(context, () => ControlSpotifyAccountDisplayAndLinkModel());
    controlSubscriptionBoardLinkModel =
        createModel(context, () => ControlSubscriptionBoardLinkModel());
    controlSuggestionControlModel =
        createModel(context, () => ControlSuggestionControlModel());
  }

  void dispose() {
    controlSpotifyAccountDisplayAndLinkModel.dispose();
    controlSubscriptionBoardLinkModel.dispose();
    controlSuggestionControlModel.dispose();
  }

  /// Additional helper methods are added here.

}
