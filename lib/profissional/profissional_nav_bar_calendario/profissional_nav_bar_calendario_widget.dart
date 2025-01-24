import '/auth/supabase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'profissional_nav_bar_calendario_model.dart';
export 'profissional_nav_bar_calendario_model.dart';

class ProfissionalNavBarCalendarioWidget extends StatefulWidget {
  const ProfissionalNavBarCalendarioWidget({super.key});

  @override
  State<ProfissionalNavBarCalendarioWidget> createState() =>
      _ProfissionalNavBarCalendarioWidgetState();
}

class _ProfissionalNavBarCalendarioWidgetState
    extends State<ProfissionalNavBarCalendarioWidget> {
  late ProfissionalNavBarCalendarioModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfissionalNavBarCalendarioModel());

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
      height: 100.0,
      child: Stack(
        alignment: AlignmentDirectional(0.0, 1.0),
        children: [
          Container(
            width: double.infinity,
            height: 70.0,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 24.0, 16.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'PROFISSIONAL_NAV_BAR_CALENDARIO_Icon_6cb');
                      logFirebaseEvent('Icon_navigate_to');

                      context.pushNamed('Prof-DashBoard');
                    },
                    child: Icon(
                      Icons.insert_chart_outlined,
                      color: Color(0xFFC3C3C3),
                      size: 24.0,
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'PROFISSIONAL_NAV_BAR_CALENDARIO_Icon_ayw');
                      logFirebaseEvent('Icon_navigate_to');

                      context.pushNamed(
                        'Prof-servicosParaAgendar',
                        queryParameters: {
                          'refProf': serializeParam(
                            currentUserUid,
                            ParamType.String,
                          ),
                        }.withoutNulls,
                      );
                    },
                    child: Icon(
                      Icons.access_time_rounded,
                      color: Color(0xFFC3C3C3),
                      size: 26.0,
                    ),
                  ),
                  Container(
                    width: 60.0,
                    height: double.infinity,
                    decoration: BoxDecoration(),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'PROFISSIONAL_NAV_BAR_CALENDARIO_Icon_9kk');
                      logFirebaseEvent('Icon_navigate_to');

                      context.pushNamed('notificacoesProfissional');
                    },
                    child: Icon(
                      Icons.notifications_rounded,
                      color: Color(0xFFC3C3C3),
                      size: 27.0,
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'PROFISSIONAL_NAV_BAR_CALENDARIO_Icon_oug');
                      logFirebaseEvent('Icon_navigate_to');

                      context.pushNamed('Profissional-perfil');
                    },
                    child: Icon(
                      Icons.person_rounded,
                      color: Color(0xFFC3C3C3),
                      size: 27.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
                child: FlutterFlowIconButton(
                  borderRadius: 100.0,
                  buttonSize: 60.0,
                  fillColor: FlutterFlowTheme.of(context).buff3,
                  icon: Icon(
                    Icons.calendar_today,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 40.0,
                  ),
                  onPressed: () {
                    print('IconButton pressed ...');
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
