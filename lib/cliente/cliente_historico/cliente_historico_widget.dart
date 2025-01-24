import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/componentes/sem_historico/sem_historico_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cliente_historico_model.dart';
export 'cliente_historico_model.dart';

class ClienteHistoricoWidget extends StatefulWidget {
  const ClienteHistoricoWidget({super.key});

  @override
  State<ClienteHistoricoWidget> createState() => _ClienteHistoricoWidgetState();
}

class _ClienteHistoricoWidgetState extends State<ClienteHistoricoWidget> {
  late ClienteHistoricoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClienteHistoricoModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Cliente-Historico'});
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
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
        List<ClienteRow> clienteHistoricoClienteRowList = snapshot.data!;

        final clienteHistoricoClienteRow =
            clienteHistoricoClienteRowList.isNotEmpty
                ? clienteHistoricoClienteRowList.first
                : null;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
                  logFirebaseEvent('CLIENTE_HISTORICO_arrow_back_rounded_ICN');
                  logFirebaseEvent('IconButton_navigate_back');
                  context.pop();
                },
              ),
              title: Text(
                'Histórico',
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
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                child: SingleChildScrollView(
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
                              alignment: AlignmentDirectional(-0.01, 0.68),
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
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100.0),
                                    child: Image.network(
                                      valueOrDefault<String>(
                                        clienteHistoricoClienteRow?.foto,
                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/saloes-v0eeqm/assets/x5qq3eogp6d4/sem-foto.jpg',
                                      ),
                                      width: 130.0,
                                      height: 130.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: Text(
                          valueOrDefault<String>(
                            clienteHistoricoClienteRow?.nome,
                            'Sem nome',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
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
                        'Histórico',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              fontSize: 20.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 15.0, 15.0, 0.0),
                        child: FutureBuilder<List<AgendamentosRow>>(
                          future: AgendamentosTable().queryRows(
                            queryFn: (q) => q
                                .eqOrNull(
                                  'id_cliente',
                                  currentUserUid,
                                )
                                .neqOrNull(
                                  'status',
                                  'Confirmado',
                                )
                                .order('data_agendada', ascending: true),
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
                            List<AgendamentosRow> listViewAgendamentosRowList =
                                snapshot.data!;

                            if (listViewAgendamentosRowList.isEmpty) {
                              return Container(
                                width: MediaQuery.sizeOf(context).width * 0.9,
                                height: 80.0,
                                child: SemHistoricoWidget(),
                              );
                            }

                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: listViewAgendamentosRowList.length,
                              itemBuilder: (context, listViewIndex) {
                                final listViewAgendamentosRow =
                                    listViewAgendamentosRowList[listViewIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 10.0),
                                  child: FutureBuilder<List<ServicosRow>>(
                                    future: ServicosTable().querySingleRow(
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
                                      List<ServicosRow>
                                          containerServicosRowList =
                                          snapshot.data!;

                                      final containerServicosRow =
                                          containerServicosRowList.isNotEmpty
                                              ? containerServicosRowList.first
                                              : null;

                                      return Container(
                                        width: 100.0,
                                        height: 180.0,
                                        decoration: BoxDecoration(
                                          color:
                                              FlutterFlowTheme.of(context).dun,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 10.0, 10.0, 10.0),
                                          child: FutureBuilder<
                                              List<ProfissionalRow>>(
                                            future: ProfissionalTable()
                                                .querySingleRow(
                                              queryFn: (q) => q.eqOrNull(
                                                'id_prof',
                                                listViewAgendamentosRow.idProf,
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
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  FutureBuilder<List<SalaoRow>>(
                                                    future: SalaoTable()
                                                        .querySingleRow(
                                                      queryFn: (q) =>
                                                          q.eqOrNull(
                                                        'id_salao',
                                                        listViewAgendamentosRow
                                                            .idSalao,
                                                      ),
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
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
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Container(
                                                            width: 200.0,
                                                            height: 50.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0x00FFFFFF),
                                                            ),
                                                            child: Row(
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
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
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
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    1.0, 0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                listViewAgendamentosRow
                                                                    .status,
                                                                'Indefinido',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: () {
                                                                      if (listViewAgendamentosRow
                                                                              .status ==
                                                                          'Finalizado') {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .primaryText;
                                                                      } else if (listViewAgendamentosRow
                                                                              .status ==
                                                                          'Avaliado') {
                                                                        return Color(
                                                                            0xFF4EAE4A);
                                                                      } else {
                                                                        return Color(
                                                                            0xFFE44E4E);
                                                                      }
                                                                    }(),
                                                                    fontSize:
                                                                        18.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  ),
                                                  Divider(
                                                    thickness: 1.0,
                                                    color: Color(0xCC000000),
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
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: Text(
                                                        'Data: ${functions.formatarDataParaBR(listViewAgendamentosRow.dataAgendada!)}',
                                                        textAlign:
                                                            TextAlign.start,
                                                        style:
                                                            FlutterFlowTheme.of(
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
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, -1.0),
                                                        child: Text(
                                                          'Profissional: ',
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
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
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
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                fontSize: 20.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                        Container(
                                                          width: 100.0,
                                                          height: 30.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0x00FFFFFF),
                                                          ),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              if ((listViewAgendamentosRow
                                                                          .status ==
                                                                      'Finalizado') &&
                                                                  (listViewAgendamentosRow
                                                                              .idSalao !=
                                                                          null &&
                                                                      listViewAgendamentosRow
                                                                              .idSalao !=
                                                                          ''))
                                                                FFButtonWidget(
                                                                  onPressed:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'CLIENTE_HISTORICO_avaliarSalao_ON_TAP');
                                                                    logFirebaseEvent(
                                                                        'avaliarSalao_navigate_to');

                                                                    context
                                                                        .pushNamed(
                                                                      'Cliente-Avaliacao-Salao',
                                                                      queryParameters:
                                                                          {
                                                                        'refSalao':
                                                                            serializeParam(
                                                                          listViewAgendamentosRow
                                                                              .idSalao,
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'refProf':
                                                                            serializeParam(
                                                                          listViewAgendamentosRow
                                                                              .idProf,
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'refServico':
                                                                            serializeParam(
                                                                          listViewAgendamentosRow
                                                                              .idServico,
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'refAgendamento':
                                                                            serializeParam(
                                                                          listViewAgendamentosRow
                                                                              .id,
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                      }.withoutNulls,
                                                                    );
                                                                  },
                                                                  text:
                                                                      'Avaliar',
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
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
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
                                                                  ),
                                                                ),
                                                              if ((listViewAgendamentosRow
                                                                          .status ==
                                                                      'Finalizado') &&
                                                                  (listViewAgendamentosRow
                                                                              .idSalao ==
                                                                          null ||
                                                                      listViewAgendamentosRow
                                                                              .idSalao ==
                                                                          ''))
                                                                FFButtonWidget(
                                                                  onPressed:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'CLIENTE_HISTORICO_avaliarProf_ON_TAP');
                                                                    logFirebaseEvent(
                                                                        'avaliarProf_navigate_to');

                                                                    context
                                                                        .pushNamed(
                                                                      'Cliente-Avaliacao-Prof',
                                                                      queryParameters:
                                                                          {
                                                                        'refProf':
                                                                            serializeParam(
                                                                          listViewAgendamentosRow
                                                                              .idProf,
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'refServico':
                                                                            serializeParam(
                                                                          listViewAgendamentosRow
                                                                              .idServico,
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'refAgendamento':
                                                                            serializeParam(
                                                                          listViewAgendamentosRow
                                                                              .id,
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                      }.withoutNulls,
                                                                    );
                                                                  },
                                                                  text:
                                                                      'Avaliar',
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
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
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
                                                                  ),
                                                                ),
                                                            ],
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
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
