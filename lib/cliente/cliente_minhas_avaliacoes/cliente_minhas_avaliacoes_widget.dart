import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/cliente/editar_avaliacao/editar_avaliacao_widget.dart';
import '/componentes/sem_avaliacao/sem_avaliacao_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cliente_minhas_avaliacoes_model.dart';
export 'cliente_minhas_avaliacoes_model.dart';

class ClienteMinhasAvaliacoesWidget extends StatefulWidget {
  const ClienteMinhasAvaliacoesWidget({super.key});

  @override
  State<ClienteMinhasAvaliacoesWidget> createState() =>
      _ClienteMinhasAvaliacoesWidgetState();
}

class _ClienteMinhasAvaliacoesWidgetState
    extends State<ClienteMinhasAvaliacoesWidget> {
  late ClienteMinhasAvaliacoesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClienteMinhasAvaliacoesModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Cliente-MinhasAvaliacoes'});
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
        List<ClienteRow> clienteMinhasAvaliacoesClienteRowList = snapshot.data!;

        final clienteMinhasAvaliacoesClienteRow =
            clienteMinhasAvaliacoesClienteRowList.isNotEmpty
                ? clienteMinhasAvaliacoesClienteRowList.first
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
                  logFirebaseEvent('CLIENTE_MINHAS_AVALIACOES_arrow_back_rou');
                  logFirebaseEvent('IconButton_navigate_back');
                  context.pop();
                },
              ),
              title: Text(
                'Minhas avaliações',
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
                                  clienteMinhasAvaliacoesClienteRow?.foto,
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: Text(
                        valueOrDefault<String>(
                          clienteMinhasAvaliacoesClienteRow?.nome,
                          'Indefinido',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                      'Minhas Avaliações',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            fontSize: 20.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(15.0, 5.0, 15.0, 10.0),
                      child: FutureBuilder<List<AvaliacaoRow>>(
                        future: AvaliacaoTable().queryRows(
                          queryFn: (q) => q.eqOrNull(
                            'id_cliente',
                            currentUserUid,
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
                          List<AvaliacaoRow> listViewAvaliacaoRowList =
                              snapshot.data!;

                          if (listViewAvaliacaoRowList.isEmpty) {
                            return Container(
                              width: MediaQuery.sizeOf(context).width * 0.9,
                              height: 80.0,
                              child: SemAvaliacaoWidget(),
                            );
                          }

                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewAvaliacaoRowList.length,
                            itemBuilder: (context, listViewIndex) {
                              final listViewAvaliacaoRow =
                                  listViewAvaliacaoRowList[listViewIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: FutureBuilder<List<ServicosRow>>(
                                  future: ServicosTable().querySingleRow(
                                    queryFn: (q) => q.eqOrNull(
                                      'id_servico',
                                      listViewAvaliacaoRow.idServico,
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
                                    List<ServicosRow> conteinerServicosRowList =
                                        snapshot.data!;

                                    final conteinerServicosRow =
                                        conteinerServicosRowList.isNotEmpty
                                            ? conteinerServicosRowList.first
                                            : null;

                                    return Container(
                                      width: double.infinity,
                                      height: 176.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context).dun,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 2.0,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(4.0),
                                        child: FutureBuilder<
                                            List<ProfissionalRow>>(
                                          future: ProfissionalTable()
                                              .querySingleRow(
                                            queryFn: (q) => q.eqOrNull(
                                              'id_prof',
                                              listViewAvaliacaoRow.idProf,
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
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 8.0, 12.0, 8.0),
                                                  child: FutureBuilder<
                                                      List<SalaoRow>>(
                                                    future: SalaoTable()
                                                        .querySingleRow(
                                                      queryFn: (q) =>
                                                          q.eqOrNull(
                                                        'id_salao',
                                                        listViewAvaliacaoRow
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
                                                          nameRatingSalaoRowList =
                                                          snapshot.data!;

                                                      final nameRatingSalaoRow =
                                                          nameRatingSalaoRowList
                                                                  .isNotEmpty
                                                              ? nameRatingSalaoRowList
                                                                  .first
                                                              : null;

                                                      return Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            2.0),
                                                                child:
                                                                    Container(
                                                                  width: 46.0,
                                                                  height: 46.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .customColor2,
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .buff2,
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            2.0),
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              100.0),
                                                                      child: Image
                                                                          .network(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          listViewAvaliacaoRow.idSalao != null && listViewAvaliacaoRow.idSalao != ''
                                                                              ? nameRatingSalaoRow?.fotoPerfil
                                                                              : columnProfissionalRow?.foto,
                                                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/saloes-v0eeqm/assets/x5qq3eogp6d4/sem-foto.jpg',
                                                                        ),
                                                                        width:
                                                                            70.0,
                                                                        height:
                                                                            70.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        listViewAvaliacaoRow.idSalao != null &&
                                                                                listViewAvaliacaoRow.idSalao != ''
                                                                            ? conteinerServicosRow?.nome
                                                                            : columnProfissionalRow?.nome,
                                                                        'Indefinido',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                'Readex Pro',
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        functions
                                                                            .formatarDataParaBR(listViewAvaliacaoRow.createdAt),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              fontFamily: 'Readex Pro',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
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
                                                              listViewAvaliacaoRow
                                                                              .idSalao !=
                                                                          null &&
                                                                      listViewAvaliacaoRow
                                                                              .idSalao !=
                                                                          ''
                                                                  ? nameRatingSalaoRow
                                                                      ?.estrelas
                                                                  : columnProfissionalRow
                                                                      ?.estrelas,
                                                              0.0,
                                                            ),
                                                            unratedColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .frenchGray2,
                                                            itemCount: 5,
                                                            itemSize: 20.0,
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      'Serviço: ${conteinerServicosRow?.nome}',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                                if (columnProfissionalRow
                                                            ?.idProf !=
                                                        null &&
                                                    columnProfissionalRow
                                                            ?.idProf !=
                                                        '')
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        'Profissional: ${columnProfissionalRow?.nome}',
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
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 12.0, 8.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: AutoSizeText(
                                                          valueOrDefault<
                                                              String>(
                                                            listViewAvaliacaoRow
                                                                .descricao,
                                                            'Sem descrição',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
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
                                                ),
                                                if (listViewAvaliacaoRow
                                                            .status ==
                                                        null ||
                                                    listViewAvaliacaoRow
                                                            .status ==
                                                        '')
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, 1.0),
                                                    child: Builder(
                                                      builder: (context) =>
                                                          Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    12.0,
                                                                    0.0),
                                                        child: FFButtonWidget(
                                                          onPressed: () async {
                                                            logFirebaseEvent(
                                                                'CLIENTE_MINHAS_AVALIACOES_EDITAR_BTN_ON_');
                                                            logFirebaseEvent(
                                                                'Button_alert_dialog');
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (dialogContext) {
                                                                return Dialog(
                                                                  elevation: 0,
                                                                  insetPadding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  alignment: AlignmentDirectional(
                                                                          0.0,
                                                                          0.0)
                                                                      .resolve(
                                                                          Directionality.of(
                                                                              context)),
                                                                  child:
                                                                      GestureDetector(
                                                                    onTap: () {
                                                                      FocusScope.of(
                                                                              dialogContext)
                                                                          .unfocus();
                                                                      FocusManager
                                                                          .instance
                                                                          .primaryFocus
                                                                          ?.unfocus();
                                                                    },
                                                                    child:
                                                                        EditarAvaliacaoWidget(
                                                                      refAvaliacao:
                                                                          listViewAvaliacaoRow
                                                                              .id,
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                          text: 'Editar',
                                                          options:
                                                              FFButtonOptions(
                                                            height: 30.0,
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        24.0,
                                                                        0.0,
                                                                        24.0,
                                                                        0.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      color: Colors
                                                                          .white,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            elevation: 3.0,
                                                            borderSide:
                                                                BorderSide(
                                                              color: Colors
                                                                  .transparent,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                        ),
                                                      ),
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
        );
      },
    );
  }
}
