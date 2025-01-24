import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cliente_nav_bar_encontrar_salao_model.dart';
export 'cliente_nav_bar_encontrar_salao_model.dart';

class ClienteNavBarEncontrarSalaoWidget extends StatefulWidget {
  const ClienteNavBarEncontrarSalaoWidget({super.key});

  @override
  State<ClienteNavBarEncontrarSalaoWidget> createState() =>
      _ClienteNavBarEncontrarSalaoWidgetState();
}

class _ClienteNavBarEncontrarSalaoWidgetState
    extends State<ClienteNavBarEncontrarSalaoWidget> {
  late ClienteNavBarEncontrarSalaoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClienteNavBarEncontrarSalaoModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 1.0),
      child: Container(
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                            'CLIENTE_NAV_BAR_ENCONTRAR_SALAO_Icon_3lz');
                        logFirebaseEvent('Icon_navigate_to');

                        context.pushNamed('Cliente-ServicosAgendados');
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
                            'CLIENTE_NAV_BAR_ENCONTRAR_SALAO_Icon_wof');
                        logFirebaseEvent('Icon_navigate_to');

                        context.pushNamed('Cliente-PerfilCliente');
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
                  padding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 210.0, 30.0),
                  child: FlutterFlowIconButton(
                    borderRadius: 100.0,
                    buttonSize: 60.0,
                    fillColor: FlutterFlowTheme.of(context).buff3,
                    icon: Icon(
                      Icons.place,
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
      ),
    );
  }
}
