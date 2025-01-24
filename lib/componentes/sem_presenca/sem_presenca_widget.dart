import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sem_presenca_model.dart';
export 'sem_presenca_model.dart';

class SemPresencaWidget extends StatefulWidget {
  const SemPresencaWidget({super.key});

  @override
  State<SemPresencaWidget> createState() => _SemPresencaWidgetState();
}

class _SemPresencaWidgetState extends State<SemPresencaWidget> {
  late SemPresencaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SemPresencaModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 270.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Você não tem presenças\na confirmar',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    fontSize: 18.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w300,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
