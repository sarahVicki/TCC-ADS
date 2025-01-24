import '/auth/supabase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'salao_nav_bar_dashboard_model.dart';
export 'salao_nav_bar_dashboard_model.dart';

class SalaoNavBarDashboardWidget extends StatefulWidget {
  const SalaoNavBarDashboardWidget({super.key});

  @override
  State<SalaoNavBarDashboardWidget> createState() =>
      _SalaoNavBarDashboardWidgetState();
}

class _SalaoNavBarDashboardWidgetState
    extends State<SalaoNavBarDashboardWidget> {
  late SalaoNavBarDashboardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SalaoNavBarDashboardModel());

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
                          'SALAO_NAV_BAR_DASHBOARD_Icon_08lzfdym_ON');
                      logFirebaseEvent('Icon_navigate_to');

                      context.pushNamed(
                        'Salao-servicosParaAgendar',
                        queryParameters: {
                          'refSalao': serializeParam(
                            currentUserUid,
                            ParamType.String,
                          ),
                        }.withoutNulls,
                      );
                    },
                    child: Icon(
                      Icons.access_time_sharp,
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
                          'SALAO_NAV_BAR_DASHBOARD_Icon_01exe5n0_ON');
                      logFirebaseEvent('Icon_navigate_to');

                      context.pushNamed('Salao-Calendario');
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
                          'SALAO_NAV_BAR_DASHBOARD_Icon_fbtldo4i_ON');
                      logFirebaseEvent('Icon_navigate_to');

                      context.pushNamed('Salao-ConfirmarPresenca');
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
                          'SALAO_NAV_BAR_DASHBOARD_Icon_b1olvmdv_ON');
                      logFirebaseEvent('Icon_navigate_to');

                      context.pushNamed('Salao-PerfilSalao');
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
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 260.0, 30.0),
                child: FlutterFlowIconButton(
                  borderRadius: 100.0,
                  buttonSize: 60.0,
                  fillColor: FlutterFlowTheme.of(context).buff3,
                  icon: Icon(
                    Icons.insert_chart_outlined,
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
