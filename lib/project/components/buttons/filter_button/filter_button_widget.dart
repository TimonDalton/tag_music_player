import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'filter_button_model.dart';
export 'filter_button_model.dart';

class FilterButtonWidget extends StatefulWidget {
  const FilterButtonWidget({Key? key}) : super(key: key);

  @override
  _FilterButtonWidgetState createState() => _FilterButtonWidgetState();
}

class _FilterButtonWidgetState extends State<FilterButtonWidget> {
  late FilterButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FilterButtonModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.0,
      height: 60.0,
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
            child: Text(
              'Filter',
              style: FlutterFlowTheme.of(context).headlineLarge,
            ),
          ),
          Expanded(
            flex: 1,
            child: Icon(
              Icons.arrow_drop_down,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 60.0,
            ),
          ),
        ],
      ),
    );
  }
}
