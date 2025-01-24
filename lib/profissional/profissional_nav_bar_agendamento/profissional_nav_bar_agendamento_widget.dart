import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'profissional_nav_bar_agendamento_model.dart';
export 'profissional_nav_bar_agendamento_model.dart';

class ProfissionalNavBarAgendamentoWidget extends StatefulWidget {
  const ProfissionalNavBarAgendamentoWidget({super.key});

  @override
  State<ProfissionalNavBarAgendamentoWidget> createState() =>
      _ProfissionalNavBarAgendamentoWidgetState();
}

class _ProfissionalNavBarAgendamentoWidgetState
    extends State<ProfissionalNavBarAgendamentoWidget> {
  late ProfissionalNavBarAgendamentoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfissionalNavBarAgendamentoModel());

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
                          'PROFISSIONAL_NAV_BAR_AGENDAMENTO_Icon_p4');
                      logFirebaseEvent('Icon_navigate_to');

                      context.pushNamed('Prof-DashBoard');
                    },
                    child: Icon(
                      Icons.insert_chart_outlined,
                      color: Color(0xFFC3C3C3),
                      size: 24.0,
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
                          'PROFISSIONAL_NAV_BAR_AGENDAMENTO_Icon_aa');
                      logFirebaseEvent('Icon_navigate_to');

                      context.pushNamed('Profissional-Calendario');
                    },
                    child: Icon(
                      Icons.calendar_today,
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
                          'PROFISSIONAL_NAV_BAR_AGENDAMENTO_Icon_xb');
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
                          'PROFISSIONAL_NAV_BAR_AGENDAMENTO_Icon_vm');
                      logFirebaseEvent('Icon_navigate_to');

                      context.pushNamed('Profissional-perfil');
                    },
                    child: Icon(
                      Icons.person_rounded,
                      color: Color(0xFFC3C3C3),
                      size: 26.0,
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
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 140.0, 30.0),
                child: FlutterFlowIconButton(
                  borderRadius: 100.0,
                  buttonSize: 60.0,
                  fillColor: FlutterFlowTheme.of(context).buff3,
                  icon: Icon(
                    Icons.access_time_rounded,
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
