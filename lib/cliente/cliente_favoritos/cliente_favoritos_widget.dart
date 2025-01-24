import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/componentes/sem_favoritos/sem_favoritos_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cliente_favoritos_model.dart';
export 'cliente_favoritos_model.dart';

class ClienteFavoritosWidget extends StatefulWidget {
  const ClienteFavoritosWidget({super.key});

  @override
  State<ClienteFavoritosWidget> createState() => _ClienteFavoritosWidgetState();
}

class _ClienteFavoritosWidgetState extends State<ClienteFavoritosWidget> {
  late ClienteFavoritosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClienteFavoritosModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Cliente-Favoritos'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CLIENTE_FAVORITOS_Cliente-Favoritos_ON_I');
      logFirebaseEvent('Cliente-Favoritos_backend_call');
      _model.buscaFavoritos = await FavoritosTable().queryRows(
        queryFn: (q) => q,
      );
      logFirebaseEvent('Cliente-Favoritos_update_page_state');
      _model.listaFavoritos =
          _model.buscaFavoritos!.toList().cast<FavoritosRow>();
      safeSetState(() {});
    });

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
        List<ClienteRow> clienteFavoritosClienteRowList = snapshot.data!;

        final clienteFavoritosClienteRow =
            clienteFavoritosClienteRowList.isNotEmpty
                ? clienteFavoritosClienteRowList.first
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
                  logFirebaseEvent('CLIENTE_FAVORITOS_arrow_back_rounded_ICN');
                  logFirebaseEvent('IconButton_navigate_back');
                  context.pop();
                },
              ),
              title: Text(
                'Favoritos',
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
                                clienteFavoritosClienteRow?.foto,
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
                        clienteFavoritosClienteRow?.nome,
                        'Sem nome',
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
                    'Favoritos',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          fontSize: 20.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 15.0, 12.0, 0.0),
                    child: FutureBuilder<List<FavoritosRow>>(
                      future: FavoritosTable().queryRows(
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
                        List<FavoritosRow> listViewSalaoFavoritosRowList =
                            snapshot.data!;

                        if (listViewSalaoFavoritosRowList.isEmpty) {
                          return Container(
                            width: MediaQuery.sizeOf(context).width * 0.8,
                            height: 90.0,
                            child: SemFavoritosWidget(),
                          );
                        }

                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewSalaoFavoritosRowList.length,
                          itemBuilder: (context, listViewSalaoIndex) {
                            final listViewSalaoFavoritosRow =
                                listViewSalaoFavoritosRowList[
                                    listViewSalaoIndex];
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 10.0),
                              child: FutureBuilder<List<ProfissionalRow>>(
                                future: ProfissionalTable().querySingleRow(
                                  queryFn: (q) => q.eqOrNull(
                                    'id_prof',
                                    listViewSalaoFavoritosRow.idProf,
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
                                  List<ProfissionalRow>
                                      containerProfissionalRowList =
                                      snapshot.data!;

                                  final containerProfissionalRow =
                                      containerProfissionalRowList.isNotEmpty
                                          ? containerProfissionalRowList.first
                                          : null;

                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'CLIENTE_FAVORITOS_Container_h0yxh6oc_ON_');
                                      if (listViewSalaoFavoritosRow.idSalao !=
                                              null &&
                                          listViewSalaoFavoritosRow.idSalao !=
                                              '') {
                                        logFirebaseEvent(
                                            'Container_navigate_to');

                                        context.pushNamed(
                                          'Cliente-PerfilSalao',
                                          queryParameters: {
                                            'refSalao': serializeParam(
                                              listViewSalaoFavoritosRow.idSalao,
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );
                                      } else {
                                        logFirebaseEvent(
                                            'Container_navigate_to');

                                        context.pushNamed(
                                          'Cliente-PerfilProfissional',
                                          queryParameters: {
                                            'refProfissional': serializeParam(
                                              listViewSalaoFavoritosRow.idProf,
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );
                                      }
                                    },
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.939,
                                      height: 136.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context).dun,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 4.0,
                                            color: Color(0x33000000),
                                            offset: Offset(
                                              0.0,
                                              2.0,
                                            ),
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 10.0, 10.0, 10.0),
                                        child: FutureBuilder<List<SalaoRow>>(
                                          future: SalaoTable().querySingleRow(
                                            queryFn: (q) => q.eqOrNull(
                                              'id_salao',
                                              listViewSalaoFavoritosRow.idSalao,
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
                                            List<SalaoRow> rowSalaoRowList =
                                                snapshot.data!;

                                            final rowSalaoRow =
                                                rowSalaoRowList.isNotEmpty
                                                    ? rowSalaoRowList.first
                                                    : null;

                                            return Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 94.0,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .dun,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bole,
                                                    ),
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(1.0),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.network(
                                                          valueOrDefault<
                                                              String>(
                                                            listViewSalaoFavoritosRow
                                                                            .idSalao !=
                                                                        null &&
                                                                    listViewSalaoFavoritosRow
                                                                            .idSalao !=
                                                                        ''
                                                                ? rowSalaoRow
                                                                    ?.fotoPerfil
                                                                : containerProfissionalRow
                                                                    ?.foto,
                                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/saloes-v0eeqm/assets/x5qq3eogp6d4/sem-foto.jpg',
                                                          ),
                                                          width: 94.0,
                                                          height: 100.0,
                                                          fit: BoxFit.fitWidth,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 0.0, 0.0),
                                                  child: Container(
                                                    width: 200.0,
                                                    height: 150.0,
                                                    decoration: BoxDecoration(),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            listViewSalaoFavoritosRow
                                                                            .idSalao !=
                                                                        null &&
                                                                    listViewSalaoFavoritosRow
                                                                            .idSalao !=
                                                                        ''
                                                                ? rowSalaoRow
                                                                    ?.nome
                                                                : containerProfissionalRow
                                                                    ?.nome,
                                                            'Indefinido',
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
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
                                                            children: [
                                                              Text(
                                                                listViewSalaoFavoritosRow.idSalao !=
                                                                            null &&
                                                                        listViewSalaoFavoritosRow.idSalao !=
                                                                            ''
                                                                    ? valueOrDefault<
                                                                        String>(
                                                                        formatNumber(
                                                                          rowSalaoRow
                                                                              ?.estrelas,
                                                                          formatType:
                                                                              FormatType.decimal,
                                                                          decimalType:
                                                                              DecimalType.periodDecimal,
                                                                        ),
                                                                        '0.0',
                                                                      )
                                                                    : valueOrDefault<
                                                                        String>(
                                                                        formatNumber(
                                                                          containerProfissionalRow
                                                                              ?.estrelas,
                                                                          formatType:
                                                                              FormatType.decimal,
                                                                          decimalType:
                                                                              DecimalType.periodDecimal,
                                                                        ),
                                                                        '0.0',
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
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                child:
                                                                    RatingBarIndicator(
                                                                  itemBuilder:
                                                                      (context,
                                                                              index) =>
                                                                          Icon(
                                                                    Icons
                                                                        .star_rounded,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .rawUmber,
                                                                  ),
                                                                  direction: Axis
                                                                      .horizontal,
                                                                  rating: listViewSalaoFavoritosRow.idSalao !=
                                                                              null &&
                                                                          listViewSalaoFavoritosRow.idSalao !=
                                                                              ''
                                                                      ? valueOrDefault<
                                                                          double>(
                                                                          rowSalaoRow
                                                                              ?.estrelas,
                                                                          0.0,
                                                                        )
                                                                      : valueOrDefault<
                                                                          double>(
                                                                          containerProfissionalRow
                                                                              ?.estrelas,
                                                                          0.0,
                                                                        ),
                                                                  unratedColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .frenchGray2,
                                                                  itemCount: 5,
                                                                  itemSize:
                                                                      24.0,
                                                                ),
                                                              ),
                                                              Text(
                                                                '(${listViewSalaoFavoritosRow.idSalao != null && listViewSalaoFavoritosRow.idSalao != '' ? valueOrDefault<String>(
                                                                    rowSalaoRow
                                                                        ?.qntAvaliacoes
                                                                        ?.toString(),
                                                                    '0',
                                                                  ) : valueOrDefault<String>(
                                                                    containerProfissionalRow
                                                                        ?.qntAvaliacoes
                                                                        ?.toString(),
                                                                    '0',
                                                                  )})',
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
                                                            ],
                                                          ),
                                                        ),
                                                        FutureBuilder<
                                                            List<EnderecoRow>>(
                                                          future: EnderecoTable()
                                                              .querySingleRow(
                                                            queryFn: (q) =>
                                                                q.eqOrNull(
                                                              'id_endereco',
                                                              rowSalaoRow
                                                                  ?.idSalao,
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
                                                            List<EnderecoRow>
                                                                textEnderecoRowList =
                                                                snapshot.data!;

                                                            final textEnderecoRow =
                                                                textEnderecoRowList
                                                                        .isNotEmpty
                                                                    ? textEnderecoRowList
                                                                        .first
                                                                    : null;

                                                            return Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                textEnderecoRow
                                                                    ?.endereco,
                                                                'Endereço não cadastrado',
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
                                                            );
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 5.0, 0.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'CLIENTE_FAVORITOS_PAGE_favorito_ON_TAP');
                                                      logFirebaseEvent(
                                                          'favorito_backend_call');
                                                      _model.favoritos =
                                                          await FavoritosTable()
                                                              .queryRows(
                                                        queryFn: (q) => q,
                                                      );
                                                      if (functions.verificarFavorito(
                                                              currentUserUid,
                                                              listViewSalaoFavoritosRow
                                                                              .idSalao !=
                                                                          null &&
                                                                      listViewSalaoFavoritosRow
                                                                              .idSalao !=
                                                                          ''
                                                                  ? rowSalaoRow!
                                                                      .idSalao
                                                                  : containerProfissionalRow!
                                                                      .idProf,
                                                              listViewSalaoFavoritosRow
                                                                              .idSalao !=
                                                                          null &&
                                                                      listViewSalaoFavoritosRow
                                                                              .idSalao !=
                                                                          ''
                                                                  ? 'Salão'
                                                                  : 'Profissional',
                                                              _model.favoritos
                                                                  ?.toList()) ==
                                                          false) {
                                                        if (listViewSalaoFavoritosRow
                                                                    .idSalao !=
                                                                null &&
                                                            listViewSalaoFavoritosRow
                                                                    .idSalao !=
                                                                '') {
                                                          // salao
                                                          logFirebaseEvent(
                                                              'favorito_salao');
                                                          await FavoritosTable()
                                                              .insert({
                                                            'id_cliente':
                                                                currentUserUid,
                                                            'id_salao':
                                                                rowSalaoRow
                                                                    ?.idSalao,
                                                          });
                                                        } else {
                                                          // Prof
                                                          logFirebaseEvent(
                                                              'favorito_Prof');
                                                          await FavoritosTable()
                                                              .insert({
                                                            'id_cliente':
                                                                currentUserUid,
                                                            'id_prof':
                                                                containerProfissionalRow
                                                                    ?.idProf,
                                                          });
                                                        }
                                                      } else {
                                                        if (listViewSalaoFavoritosRow
                                                                    .idSalao !=
                                                                null &&
                                                            listViewSalaoFavoritosRow
                                                                    .idSalao !=
                                                                '') {
                                                          // salão
                                                          logFirebaseEvent(
                                                              'favorito_salo');
                                                          await FavoritosTable()
                                                              .delete(
                                                            matchingRows:
                                                                (rows) => rows
                                                                    .eqOrNull(
                                                                      'id_cliente',
                                                                      currentUserUid,
                                                                    )
                                                                    .eqOrNull(
                                                                      'id_salao',
                                                                      rowSalaoRow
                                                                          ?.idSalao,
                                                                    ),
                                                          );
                                                        } else {
                                                          // Prof
                                                          logFirebaseEvent(
                                                              'favorito_Prof');
                                                          await FavoritosTable()
                                                              .delete(
                                                            matchingRows:
                                                                (rows) => rows
                                                                    .eqOrNull(
                                                                      'id_cliente',
                                                                      currentUserUid,
                                                                    )
                                                                    .eqOrNull(
                                                                      'id_prof',
                                                                      containerProfissionalRow
                                                                          ?.idProf,
                                                                    ),
                                                          );
                                                        }
                                                      }

                                                      logFirebaseEvent(
                                                          'favorito_backend_call');
                                                      _model.posFavoritos =
                                                          await FavoritosTable()
                                                              .queryRows(
                                                        queryFn: (q) => q,
                                                      );
                                                      logFirebaseEvent(
                                                          'favorito_update_page_state');
                                                      _model.listaFavoritos =
                                                          _model
                                                              .posFavoritos!
                                                              .toList()
                                                              .cast<
                                                                  FavoritosRow>();
                                                      safeSetState(() {});

                                                      safeSetState(() {});
                                                    },
                                                    child: Container(
                                                      width: 30.0,
                                                      height: 30.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          if (functions.verificarFavorito(
                                                                  currentUserUid,
                                                                  listViewSalaoFavoritosRow.idSalao !=
                                                                              null &&
                                                                          listViewSalaoFavoritosRow.idSalao !=
                                                                              ''
                                                                      ? rowSalaoRow!
                                                                          .idSalao
                                                                      : containerProfissionalRow!
                                                                          .idProf,
                                                                  listViewSalaoFavoritosRow.idSalao !=
                                                                              null &&
                                                                          listViewSalaoFavoritosRow.idSalao !=
                                                                              ''
                                                                      ? 'Salão'
                                                                      : 'Profissional',
                                                                  _model
                                                                      .listaFavoritos
                                                                      .toList()) ==
                                                              false)
                                                            Icon(
                                                              Icons
                                                                  .favorite_border,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              size: 28.0,
                                                            ),
                                                          if (functions.verificarFavorito(
                                                                  currentUserUid,
                                                                  listViewSalaoFavoritosRow.idSalao !=
                                                                              null &&
                                                                          listViewSalaoFavoritosRow.idSalao !=
                                                                              ''
                                                                      ? rowSalaoRow!
                                                                          .idSalao
                                                                      : containerProfissionalRow!
                                                                          .idProf,
                                                                  listViewSalaoFavoritosRow.idSalao !=
                                                                              null &&
                                                                          listViewSalaoFavoritosRow.idSalao !=
                                                                              ''
                                                                      ? 'Salão'
                                                                      : 'Profissional',
                                                                  _model
                                                                      .listaFavoritos
                                                                      .toList()) ==
                                                              true)
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            13.0,
                                                                            0.0),
                                                                child: Icon(
                                                                  Icons
                                                                      .favorite_sharp,
                                                                  color: Color(
                                                                      0xFFEB4444),
                                                                  size: 28.0,
                                                                ),
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        ),
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
        );
      },
    );
  }
}
