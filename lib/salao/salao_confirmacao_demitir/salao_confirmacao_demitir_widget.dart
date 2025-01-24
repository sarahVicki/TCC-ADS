import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'salao_confirmacao_demitir_model.dart';
export 'salao_confirmacao_demitir_model.dart';

class SalaoConfirmacaoDemitirWidget extends StatefulWidget {
  const SalaoConfirmacaoDemitirWidget({
    super.key,
    required this.refProf,
    required this.refSalao,
  });

  final String? refProf;
  final String? refSalao;

  @override
  State<SalaoConfirmacaoDemitirWidget> createState() =>
      _SalaoConfirmacaoDemitirWidgetState();
}

class _SalaoConfirmacaoDemitirWidgetState
    extends State<SalaoConfirmacaoDemitirWidget> {
  late SalaoConfirmacaoDemitirModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SalaoConfirmacaoDemitirModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('SALAO_CONFIRMACAO_DEMITIR_Salao-Confirma');
      logFirebaseEvent('Salao-ConfirmacaoDemitir_backend_call');
      _model.todosServicos = await ServicosTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'id_salao',
          widget!.refSalao,
        ),
      );
      logFirebaseEvent('Salao-ConfirmacaoDemitir_backend_call');
      _model.profissional = await ProfissionalTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'id_prof',
          widget!.refProf,
        ),
      );
      logFirebaseEvent('Salao-ConfirmacaoDemitir_update_componen');
      _model.servicosTotais = _model.todosServicos!
          .map((e) => e.idServico)
          .toList()
          .toList()
          .cast<String>();
      _model.saloesFiliados = _model.profissional!.firstOrNull!.filiadoSalao
          .toList()
          .cast<String>();
      safeSetState(() {});
    });

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
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
            color: Color(0x3B1D2429),
            offset: Offset(
              0.0,
              -3.0,
            ),
          )
        ],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              'Tem certeza que deseja desvincular?',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    fontSize: 17.0,
                    letterSpacing: 0.0,
                  ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('SALAO_CONFIRMACAO_DEMITIR_DESVINCULAR_BT');
                  while (_model.servicosTotais.length > _model.quant!) {
                    logFirebaseEvent('Button_backend_call');
                    _model.verificaServico = await ServicosTable().queryRows(
                      queryFn: (q) => q.eqOrNull(
                        'id_servico',
                        _model.servicosTotais.elementAtOrNull(_model.quant!),
                      ),
                    );
                    logFirebaseEvent('Button_update_component_state');
                    _model.profTotais = _model
                        .verificaServico!.firstOrNull!.idProf
                        .toList()
                        .cast<String>();
                    safeSetState(() {});
                    logFirebaseEvent('Button_update_component_state');
                    _model.removeFromProfTotais(widget!.refProf!);
                    safeSetState(() {});
                    logFirebaseEvent('Button_backend_call');
                    await ServicosTable().update(
                      data: {
                        'id_prof': _model.profTotais,
                      },
                      matchingRows: (rows) => rows.eqOrNull(
                        'id_servico',
                        _model.servicosTotais.elementAtOrNull(_model.quant!),
                      ),
                    );
                    logFirebaseEvent('Button_update_component_state');
                    _model.quant = _model.quant! + 1;
                    safeSetState(() {});
                  }
                  logFirebaseEvent('Button_update_component_state');
                  _model.removeFromSaloesFiliados(widget!.refSalao!);
                  safeSetState(() {});
                  logFirebaseEvent('Button_backend_call');
                  await ProfissionalTable().update(
                    data: {
                      'filiado_salao': _model.saloesFiliados,
                    },
                    matchingRows: (rows) => rows.eqOrNull(
                      'id_prof',
                      widget!.refProf,
                    ),
                  );
                  logFirebaseEvent('Button_navigate_back');
                  context.safePop();

                  safeSetState(() {});
                },
                text: 'Desvincular',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 50.0,
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).error,
                  textStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                        fontFamily: 'Readex Pro',
                        letterSpacing: 0.0,
                      ),
                  elevation: 2.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('SALAO_CONFIRMACAO_DEMITIR_CANCELAR_BTN_O');
                  logFirebaseEvent('Button_navigate_back');
                  context.pop();
                },
                text: 'Cancelar',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 50.0,
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).tan,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Lexend Deca',
                        color: Colors.black,
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.normal,
                      ),
                  elevation: 0.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 0.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
