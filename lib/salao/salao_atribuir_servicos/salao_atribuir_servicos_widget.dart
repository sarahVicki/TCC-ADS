import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'salao_atribuir_servicos_model.dart';
export 'salao_atribuir_servicos_model.dart';

class SalaoAtribuirServicosWidget extends StatefulWidget {
  const SalaoAtribuirServicosWidget({
    super.key,
    required this.refProf,
    required this.refSalao,
  });

  final String? refProf;
  final String? refSalao;

  @override
  State<SalaoAtribuirServicosWidget> createState() =>
      _SalaoAtribuirServicosWidgetState();
}

class _SalaoAtribuirServicosWidgetState
    extends State<SalaoAtribuirServicosWidget> {
  late SalaoAtribuirServicosModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SalaoAtribuirServicosModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('SALAO_ATRIBUIR_SERVICOS_Salao-AtribuirSe');
      logFirebaseEvent('Salao-AtribuirServicos_backend_call');
      _model.servicosOutPut = await ServicosTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'id_salao',
          widget!.refSalao,
        ),
      );
      logFirebaseEvent('Salao-AtribuirServicos_update_component_');
      _model.servicosSelecionados = _model.servicosOutPut!
          .where((e) => e.idProf.contains(widget!.refProf) == true)
          .toList()
          .map((e) => e.idServico)
          .toList()
          .toList()
          .cast<String>();
      _model.servicosTotais = _model.servicosOutPut!
          .map((e) => e.idServico)
          .toList()
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
    return FutureBuilder<List<ProfissionalRow>>(
      future: ProfissionalTable().querySingleRow(
        queryFn: (q) => q.eqOrNull(
          'id_prof',
          widget!.refProf,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  FlutterFlowTheme.of(context).chamoisee,
                ),
              ),
            ),
          );
        }
        List<ProfissionalRow> columnProfissionalRowList = snapshot.data!;

        final columnProfissionalRow = columnProfissionalRowList.isNotEmpty
            ? columnProfissionalRowList.first
            : null;

        return Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 337.0,
              height: 570.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: Container(
                                constraints: BoxConstraints(
                                  maxWidth: 1270.0,
                                ),
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 12.0, 16.0, 0.0),
                                  child: Wrap(
                                    spacing: 16.0,
                                    runSpacing: 16.0,
                                    alignment: WrapAlignment.start,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.start,
                                    direction: Axis.horizontal,
                                    runAlignment: WrapAlignment.center,
                                    verticalDirection: VerticalDirection.down,
                                    clipBehavior: Clip.none,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height: 200.0,
                                        constraints: BoxConstraints(
                                          maxWidth: 570.0,
                                        ),
                                        decoration: BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: 100.0,
                                              height: 100.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .customColor2,
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .buff,
                                                  width: 2.0,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(2.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100.0),
                                                  child: Image.network(
                                                    valueOrDefault<String>(
                                                      columnProfissionalRow
                                                          ?.foto,
                                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/saloes-v0eeqm/assets/x5qq3eogp6d4/sem-foto.jpg',
                                                    ),
                                                    width: 100.0,
                                                    height: 100.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            if (responsiveVisibility(
                                              context: context,
                                              tablet: false,
                                              tabletLandscape: false,
                                              desktop: false,
                                            ))
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 5.0, 0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      valueOrDefault<String>(
                                                        columnProfissionalRow
                                                            ?.nome,
                                                        'Sem Nome',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .headlineLarge
                                                          .override(
                                                            fontFamily:
                                                                'Outfit',
                                                            fontSize: 22.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  12.0,
                                                                  0.0,
                                                                  12.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              formatNumber(
                                                                columnProfissionalRow
                                                                    ?.estrelas,
                                                                formatType:
                                                                    FormatType
                                                                        .decimal,
                                                                decimalType:
                                                                    DecimalType
                                                                        .periodDecimal,
                                                              ),
                                                              '0.0',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                          RatingBarIndicator(
                                                            itemBuilder:
                                                                (context,
                                                                        index) =>
                                                                    Icon(
                                                              Icons
                                                                  .star_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .warning,
                                                            ),
                                                            direction:
                                                                Axis.horizontal,
                                                            rating:
                                                                valueOrDefault<
                                                                    double>(
                                                              columnProfissionalRow
                                                                  ?.estrelas,
                                                              0.0,
                                                            ),
                                                            unratedColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .frenchGray2,
                                                            itemCount: 5,
                                                            itemSize: 24.0,
                                                          ),
                                                          Text(
                                                            '(${valueOrDefault<String>(
                                                              columnProfissionalRow
                                                                  ?.qntAvaliacoes
                                                                  ?.toString(),
                                                              '0',
                                                            )})',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        constraints: BoxConstraints(
                                          maxWidth: 570.0,
                                        ),
                                        decoration: BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Serviços',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    letterSpacing: 0.0,
                                                  ),
                                            ),
                                            FutureBuilder<List<ServicosRow>>(
                                              future: ServicosTable().queryRows(
                                                queryFn: (q) => q.eqOrNull(
                                                  'id_salao',
                                                  widget!.refSalao,
                                                ),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .chamoisee,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<ServicosRow>
                                                    containerServicosRowList =
                                                    snapshot.data!;

                                                return Container(
                                                  width: double.infinity,
                                                  height: 170.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: SingleChildScrollView(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        FlutterFlowCheckboxGroup(
                                                          options:
                                                              containerServicosRowList
                                                                  .map((e) =>
                                                                      valueOrDefault<
                                                                          String>(
                                                                        e.nome,
                                                                        'Sem nome',
                                                                      ))
                                                                  .toList(),
                                                          onChanged:
                                                              (val) async {
                                                            safeSetState(() =>
                                                                _model.checkboxGroupValues =
                                                                    val);
                                                            logFirebaseEvent(
                                                                'SALAO_ATRIBUIR_SERVICOS_CheckboxGroup_td');
                                                            logFirebaseEvent(
                                                                'CheckboxGroup_update_component_state');
                                                            _model.servicosSelecionados =
                                                                [];
                                                            safeSetState(() {});
                                                            logFirebaseEvent(
                                                                'CheckboxGroup_update_component_state');
                                                            _model.servicosSelecionados = containerServicosRowList
                                                                .where((e) => _model
                                                                    .checkboxGroupValues!
                                                                    .contains(
                                                                        e.nome))
                                                                .toList()
                                                                .map((e) =>
                                                                    e.idServico)
                                                                .toList()
                                                                .cast<String>();
                                                            safeSetState(() {});
                                                          },
                                                          controller: _model
                                                                  .checkboxGroupValueController ??=
                                                              FormFieldController<
                                                                  List<String>>(
                                                            List.from(containerServicosRowList
                                                                    .where((e) =>
                                                                        e.idProf.contains(widget!
                                                                            .refProf) ==
                                                                        true)
                                                                    .toList()
                                                                    .map((e) =>
                                                                        e.nome)
                                                                    .toList() ??
                                                                []),
                                                          ),
                                                          activeColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryText,
                                                          checkColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .info,
                                                          checkboxBorderColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondaryText,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          checkboxBorderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      4.0),
                                                          initialized: _model
                                                                  .checkboxGroupValues !=
                                                              null,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ].divide(SizedBox(height: 12.0)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 12.0, 16.0, 12.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'SALAO_ATRIBUIR_SERVICOS_SALVAR_BTN_ON_TA');
                                while (_model.servicosTotais.length >
                                    _model.quant!) {
                                  logFirebaseEvent('Button_backend_call');
                                  _model.todosServicos =
                                      await ServicosTable().queryRows(
                                    queryFn: (q) => q.eqOrNull(
                                      'id_servico',
                                      _model.servicosTotais
                                          .elementAtOrNull(_model.quant!),
                                    ),
                                  );
                                  logFirebaseEvent(
                                      'Button_update_component_state');
                                  _model.profsServicos = _model
                                      .todosServicos!.firstOrNull!.idProf
                                      .toList()
                                      .cast<String>();
                                  safeSetState(() {});
                                  if (_model.servicosSelecionados.contains(
                                          _model.servicosTotais.elementAtOrNull(
                                              _model.quant!)) ==
                                      true) {
                                    if (!_model.profsServicos
                                        .contains(widget!.refProf)) {
                                      logFirebaseEvent(
                                          'Button_update_component_state');
                                      _model
                                          .addToProfsServicos(widget!.refProf!);
                                      safeSetState(() {});
                                    }
                                  } else {
                                    logFirebaseEvent(
                                        'Button_update_component_state');
                                    _model.removeFromProfsServicos(
                                        widget!.refProf!);
                                    safeSetState(() {});
                                  }

                                  logFirebaseEvent('Button_backend_call');
                                  await ServicosTable().update(
                                    data: {
                                      'id_prof': _model.profsServicos,
                                    },
                                    matchingRows: (rows) => rows.eqOrNull(
                                      'id_servico',
                                      _model.servicosTotais
                                          .elementAtOrNull(_model.quant!),
                                    ),
                                  );
                                  logFirebaseEvent(
                                      'Button_update_component_state');
                                  _model.quant = _model.quant! + 1;
                                  safeSetState(() {});
                                }
                                logFirebaseEvent(
                                    'Button_close_dialog_drawer_etc');
                                Navigator.pop(context);

                                safeSetState(() {});
                              },
                              text: 'salvar',
                              options: FFButtonOptions(
                                width: MediaQuery.sizeOf(context).width * 0.9,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).buff2,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 3.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 10.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'SALAO_ATRIBUIR_SERVICOS_CANCELAR_BTN_ON_');
                                logFirebaseEvent('Button_navigate_back');
                                context.safePop();
                              },
                              text: 'Cancelar',
                              options: FFButtonOptions(
                                width: MediaQuery.sizeOf(context).width * 0.9,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color:
                                    FlutterFlowTheme.of(context).customColor2,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 3.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
