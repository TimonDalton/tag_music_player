import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/project/components/buttons/default_button/default_button_widget.dart';
import '/project/components/text_widgets/heading_text/heading_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'control_subscription_board_link_model.dart';
export 'control_subscription_board_link_model.dart';

class ControlSubscriptionBoardLinkWidget extends StatefulWidget {
  const ControlSubscriptionBoardLinkWidget({
    Key? key,
    String? signInStatus,
    String? hasPremiumStatusDescription,
  })  : this.signInStatus = signInStatus ?? 'Not Signed In',
        this.hasPremiumStatusDescription =
            hasPremiumStatusDescription ?? 'Premium Active',
        super(key: key);

  final String signInStatus;
  final String hasPremiumStatusDescription;

  @override
  _ControlSubscriptionBoardLinkWidgetState createState() =>
      _ControlSubscriptionBoardLinkWidgetState();
}

class _ControlSubscriptionBoardLinkWidgetState
    extends State<ControlSubscriptionBoardLinkWidget> {
  late ControlSubscriptionBoardLinkModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ControlSubscriptionBoardLinkModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: 150.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primary,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Align(
            alignment: AlignmentDirectional(-0.85, 0.0),
            child: wrapWithModel(
              model: _model.headingTextModel,
              updateCallback: () => setState(() {}),
              child: HeadingTextWidget(
                text: 'Subscription',
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(-1.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(25.0, 1.0, 0.0, 0.0),
              child: Text(
                widget.hasPremiumStatusDescription,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Roboto Condensed',
                      color: FlutterFlowTheme.of(context).accent1,
                      fontSize: 16.0,
                    ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(-0.75, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
              child: wrapWithModel(
                model: _model.defaultButtonModel,
                updateCallback: () => setState(() {}),
                child: DefaultButtonWidget(
                  text: 'Manage\nPremium',
                  icon: Icon(
                    Icons.login,
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                  width: 200.0,
                  height: 60.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
