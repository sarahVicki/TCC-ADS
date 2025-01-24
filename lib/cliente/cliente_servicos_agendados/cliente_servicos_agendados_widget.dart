import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/cliente/cliente_nav_bar_calendario/cliente_nav_bar_calendario_widget.dart';
import '/componentes/confirmacao_cancelamento/confirmacao_cancelamento_widget.dart';
import '/componentes/sem_servico_agendado/sem_servico_agendado_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cliente_servicos_agendados_model.dart';
export 'cliente_servicos_agendados_model.dart';

class ClienteServicosAgendadosWidget extends StatefulWidget {
  const ClienteServicosAgendadosWidget({super.key});

  @override
  State<ClienteServicosAgendadosWidget> createState() =>
      _ClienteServicosAgendadosWidgetState();
}

class _ClienteServicosAgendadosWidgetState
    extends State<ClienteServicosAgendadosWidget> {
  late ClienteServicosAgendadosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClienteServicosAgendadosModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Cliente-ServicosAgendados'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ClienteRow>>(
      future: ClienteTable().querySingleRow(
        queryFn: (q) => q.eqOrNull(
          'id_cliente',
          currentUserUid,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).chamoisee,
                  ),
                ),
              ),
            ),
          );
        }
        List<ClienteRow> clienteServicosAgendadosClienteRowList =
            snapshot.data!;

        final clienteServicosAgendadosClienteRow =
            clienteServicosAgendadosClienteRowList.isNotEmpty
                ? clienteServicosAgendadosClienteRowList.first
                : null;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryText,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                  size: 30.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('CLIENTE_SERVICOS_AGENDADOS_arrow_back_ro');
                  logFirebaseEvent('IconButton_navigate_back');
                  context.pop();
                },
              ),
              title: Text(
                'Serviços agendados',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontSize: 22.0,
                      letterSpacing: 0.0,
                    ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SingleChildScrollView(
                    primary: false,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 150.0,
                          child: Stack(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).dun,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20.0),
                                    bottomRight: Radius.circular(20.0),
                                    topLeft: Radius.circular(0.0),
                                    topRight: Radius.circular(0.0),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  width: 138.0,
                                  height: 138.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).dun,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context).bole,
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100.0),
                                  child: Image.network(
                                    valueOrDefault<String>(
                                      clienteServicosAgendadosClienteRow?.foto,
                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/saloes-v0eeqm/assets/x5qq3eogp6d4/sem-foto.jpg',
                                    ),
                                    width: 130.0,
                                    height: 130.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: Text(
                            valueOrDefault<String>(
                              clienteServicosAgendadosClienteRow?.nome,
                              'Sem nome',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                        Opacity(
                          opacity: 0.5,
                          child: Divider(
                            thickness: 1.0,
                            color: Color(0xCC000000),
                          ),
                        ),
                        Text(
                          'Serviços Agendados',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 10.0, 5.0, 0.0),
                          child: Text(
                            'Os serviços agendados só poderão ser cancelados em até um dia anterior da data agendada',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                        Container(
                          width: 412.0,
                          height: 312.0,
                          decoration: BoxDecoration(),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 15.0, 15.0, 0.0),
                              child: FutureBuilder<List<AgendamentosRow>>(
                                future: (_model.requestCompleter ??= Completer<
                                        List<AgendamentosRow>>()
                                      ..complete(AgendamentosTable().queryRows(
                                        queryFn: (q) => q
                                            .eqOrNull(
                                              'id_cliente',
                                              currentUserUid,
                                            )
                                            .eqOrNull(
                                              'status',
                                              'Confirmado',
                                            )
                                            .gteOrNull(
                                              'data_agendada',
                                              supaSerialize<DateTime>(
                                                  getCurrentTimestamp),
                                            )
                                            .order('data_agendada',
                                                ascending: true),
                                      )))
                                    .future,
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .chamoisee,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<AgendamentosRow>
                                      listViewAgendamentosRowList =
                                      snapshot.data!;

                                  if (listViewAgendamentosRowList.isEmpty) {
                                    return Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.9,
                                      height: 70.0,
                                      child: SemServicoAgendadoWidget(),
                                    );
                                  }

                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount:
                                        listViewAgendamentosRowList.length,
                                    itemBuilder: (context, listViewIndex) {
                                      final listViewAgendamentosRow =
                                          listViewAgendamentosRowList[
                                              listViewIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 10.0),
                                        child: FutureBuilder<List<ServicosRow>>(
                                          future:
                                              ServicosTable().querySingleRow(
                                            queryFn: (q) => q.eqOrNull(
                                              'id_servico',
                                              listViewAgendamentosRow.idServico,
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

                                            final containerServicosRow =
                                                containerServicosRowList
                                                        .isNotEmpty
                                                    ? containerServicosRowList
                                                        .first
                                                    : null;

                                            return Container(
                                              width: 100.0,
                                              height: 174.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .dun,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 4.0,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .frenchGray,
                                                    offset: Offset(
                                                      2.0,
                                                      1.0,
                                                    ),
                                                    spreadRadius: 3.0,
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 10.0, 10.0, 10.0),
                                                child: FutureBuilder<
                                                    List<ProfissionalRow>>(
                                                  future: ProfissionalTable()
                                                      .querySingleRow(
                                                    queryFn: (q) => q.eqOrNull(
                                                      'id_prof',
                                                      listViewAgendamentosRow
                                                          .idProf,
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
                                                    List<ProfissionalRow>
                                                        columnProfissionalRowList =
                                                        snapshot.data!;

                                                    final columnProfissionalRow =
                                                        columnProfissionalRowList
                                                                .isNotEmpty
                                                            ? columnProfissionalRowList
                                                                .first
                                                            : null;

                                                    return Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        FutureBuilder<
                                                            List<SalaoRow>>(
                                                          future: SalaoTable()
                                                              .querySingleRow(
                                                            queryFn: (q) =>
                                                                q.eqOrNull(
                                                              'id_salao',
                                                              listViewAgendamentosRow
                                                                  .idSalao,
                                                            ),
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
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
                                                            List<SalaoRow>
                                                                rowSalaoRowList =
                                                                snapshot.data!;

                                                            final rowSalaoRow =
                                                                rowSalaoRowList
                                                                        .isNotEmpty
                                                                    ? rowSalaoRowList
                                                                        .first
                                                                    : null;

                                                            return Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              100.0),
                                                                  child: Image
                                                                      .network(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      listViewAgendamentosRow.idSalao != null &&
                                                                              listViewAgendamentosRow.idSalao !=
                                                                                  ''
                                                                          ? rowSalaoRow
                                                                              ?.fotoPerfil
                                                                          : columnProfissionalRow
                                                                              ?.foto,
                                                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/saloes-v0eeqm/assets/x5qq3eogp6d4/sem-foto.jpg',
                                                                    ),
                                                                    width: 40.0,
                                                                    height:
                                                                        40.0,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      listViewAgendamentosRow.idSalao != null &&
                                                                              listViewAgendamentosRow.idSalao !=
                                                                                  ''
                                                                          ? rowSalaoRow
                                                                              ?.nome
                                                                          : columnProfissionalRow
                                                                              ?.nome,
                                                                      'Indefinido',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Readex Pro',
                                                                          fontSize:
                                                                              18.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        ),
                                                        Divider(
                                                          thickness: 1.0,
                                                          color:
                                                              Color(0xCC000000),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                              child: Text(
                                                                'Serviço: ${containerServicosRow?.nome}',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        5.0,
                                                                        10.0,
                                                                        0.0),
                                                            child: Text(
                                                              'Data: ${functions.formatarDataParaBR(listViewAgendamentosRow.dataAgendada!)}',
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
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  'Profissional: ',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 1.0),
                                                              child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  columnProfissionalRow
                                                                      ?.nome,
                                                                  'Indefinido',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      5.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                'Total: R\$${formatNumber(
                                                                  containerServicosRow
                                                                      ?.valor,
                                                                  formatType:
                                                                      FormatType
                                                                          .decimal,
                                                                  decimalType:
                                                                      DecimalType
                                                                          .commaDecimal,
                                                                )}',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      fontSize:
                                                                          20.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                              ),
                                                              Builder(
                                                                builder:
                                                                    (context) =>
                                                                        FFButtonWidget(
                                                                  onPressed: (getCurrentTimestamp >
                                                                          functions
                                                                              .cancelamentoUmDiaAnterior(listViewAgendamentosRow.dataAgendada!))
                                                                      ? null
                                                                      : () async {
                                                                          logFirebaseEvent(
                                                                              'CLIENTE_SERVICOS_AGENDADOS_CANCELAR_BTN_');
                                                                          logFirebaseEvent(
                                                                              'Button_alert_dialog');
                                                                          await showDialog(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (dialogContext) {
                                                                              return Dialog(
                                                                                elevation: 0,
                                                                                insetPadding: EdgeInsets.zero,
                                                                                backgroundColor: Colors.transparent,
                                                                                alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                child: GestureDetector(
                                                                                  onTap: () {
                                                                                    FocusScope.of(dialogContext).unfocus();
                                                                                    FocusManager.instance.primaryFocus?.unfocus();
                                                                                  },
                                                                                  child: ConfirmacaoCancelamentoWidget(
                                                                                    refAgendamento: listViewAgendamentosRow.id,
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          );

                                                                          logFirebaseEvent(
                                                                              'Button_refresh_database_request');
                                                                          safeSetState(() =>
                                                                              _model.requestCompleter = null);
                                                                          await _model
                                                                              .waitForRequestCompleted();
                                                                        },
                                                                  text:
                                                                      'Cancelar',
                                                                  options:
                                                                      FFButtonOptions(
                                                                    height:
                                                                        25.0,
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            24.0,
                                                                            0.0,
                                                                            24.0,
                                                                            0.0),
                                                                    iconPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    color: Color(
                                                                        0xFFFF000F),
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Readex Pro',
                                                                          color:
                                                                              Colors.white,
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                    elevation:
                                                                        3.0,
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Colors
                                                                          .transparent,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    disabledColor:
                                                                        Color(
                                                                            0x74000000),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: wrapWithModel(
                        model: _model.clienteNavBarCalendarioModel,
                        updateCallback: () => safeSetState(() {}),
                        child: ClienteNavBarCalendarioWidget(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
