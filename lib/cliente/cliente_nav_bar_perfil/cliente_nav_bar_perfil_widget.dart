import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cliente_nav_bar_perfil_model.dart';
export 'cliente_nav_bar_perfil_model.dart';

class ClienteNavBarPerfilWidget extends StatefulWidget {
  const ClienteNavBarPerfilWidget({super.key});

  @override
  State<ClienteNavBarPerfilWidget> createState() =>
      _ClienteNavBarPerfilWidgetState();
}

class _ClienteNavBarPerfilWidgetState extends State<ClienteNavBarPerfilWidget> {
  late ClienteNavBarPerfilModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClienteNavBarPerfilModel());

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
      height: 90.0,
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
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'CLIENTE_NAV_BAR_PERFIL_Icon_a0vxstvg_ON_');
                      logFirebaseEvent('Icon_navigate_to');

                      context.pushNamed('EncontrarSalaoCopy');
                    },
                    child: Icon(
                      Icons.location_on_sharp,
                      color: Color(0xFFC3C3C3),
                      size: 26.0,
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'CLIENTE_NAV_BAR_PERFIL_Icon_a11sz8ds_ON_');
                      logFirebaseEvent('Icon_navigate_to');

                      context.pushNamed('Cliente-ServicosAgendados');
                    },
                    child: Icon(
                      Icons.calendar_today,
                      color: Color(0xFFC3C3C3),
                      size: 24.0,
                    ),
                  ),
                  Container(
                    width: 60.0,
                    height: double.infinity,
                    decoration: BoxDecoration(),
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
                padding: EdgeInsetsDirectional.fromSTEB(200.0, 0.0, 0.0, 30.0),
                child: FlutterFlowIconButton(
                  borderRadius: 100.0,
                  buttonSize: 60.0,
                  fillColor: FlutterFlowTheme.of(context).buff3,
                  icon: Icon(
                    Icons.person,
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
