import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cliente_avaliacao_salao_model.dart';
export 'cliente_avaliacao_salao_model.dart';

class ClienteAvaliacaoSalaoWidget extends StatefulWidget {
  const ClienteAvaliacaoSalaoWidget({
    super.key,
    required this.refSalao,
    this.refProf,
    required this.refServico,
    required this.refAgendamento,
  });

  final String? refSalao;
  final String? refProf;
  final String? refServico;
  final String? refAgendamento;

  @override
  State<ClienteAvaliacaoSalaoWidget> createState() =>
      _ClienteAvaliacaoSalaoWidgetState();
}

class _ClienteAvaliacaoSalaoWidgetState
    extends State<ClienteAvaliacaoSalaoWidget> {
  late ClienteAvaliacaoSalaoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClienteAvaliacaoSalaoModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Cliente-Avaliacao-Salao'});
    _model.textFieldSalaoTextController ??= TextEditingController();
    _model.textFieldSalaoFocusNode ??= FocusNode();

    _model.textFieldProfTextController ??= TextEditingController();
    _model.textFieldProfFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SalaoRow>>(
      future: SalaoTable().querySingleRow(
        queryFn: (q) => q.eqOrNull(
          'id_salao',
          widget!.refSalao,
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
        List<SalaoRow> clienteAvaliacaoSalaoSalaoRowList = snapshot.data!;

        final clienteAvaliacaoSalaoSalaoRow =
            clienteAvaliacaoSalaoSalaoRowList.isNotEmpty
                ? clienteAvaliacaoSalaoSalaoRowList.first
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
                  logFirebaseEvent('CLIENTE_AVALIACAO_SALAO_arrow_back_round');
                  logFirebaseEvent('IconButton_navigate_back');
                  context.pop();
                },
              ),
              title: Text(
                'Avaliar',
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
              child: FutureBuilder<List<ProfissionalRow>>(
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
                  List<ProfissionalRow> columnProfissionalRowList =
                      snapshot.data!;

                  final columnProfissionalRow =
                      columnProfissionalRowList.isNotEmpty
                          ? columnProfissionalRowList.first
                          : null;

                  return SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 170.0,
                          decoration: BoxDecoration(
                            color: Color(0x00E6CCB2),
                          ),
                          child: Stack(
                            children: [
                              Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 120.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).dun,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(0.0),
                                  child: Image.network(
                                    valueOrDefault<String>(
                                      clienteAvaliacaoSalaoSalaoRow?.fotoFundo,
                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/saloes-v0eeqm/assets/x5qq3eogp6d4/sem-foto.jpg',
                                    ),
                                    width: 200.0,
                                    height: 150.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 1.0),
                                child: Container(
                                  width: 130.0,
                                  height: 130.0,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.network(
                                    valueOrDefault<String>(
                                      clienteAvaliacaoSalaoSalaoRow?.fotoPerfil,
                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/saloes-v0eeqm/assets/x5qq3eogp6d4/sem-foto.jpg',
                                    ),
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
                          child: Container(
                            width: double.infinity,
                            height: 70.0,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, -1.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      clienteAvaliacaoSalaoSalaoRow?.nome,
                                      'Indefinido',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          fontSize: 20.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Container(
                                    width: 200.0,
                                    height: 30.0,
                                    decoration: BoxDecoration(),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          valueOrDefault<String>(
                                            formatNumber(
                                              clienteAvaliacaoSalaoSalaoRow
                                                  ?.estrelas,
                                              formatType: FormatType.decimal,
                                              decimalType:
                                                  DecimalType.periodDecimal,
                                            ),
                                            '0',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        RatingBarIndicator(
                                          itemBuilder: (context, index) => Icon(
                                            Icons.star_rounded,
                                            color: Color(0xFFF6E56B),
                                          ),
                                          direction: Axis.horizontal,
                                          rating: valueOrDefault<double>(
                                            clienteAvaliacaoSalaoSalaoRow
                                                ?.estrelas,
                                            0.0,
                                          ),
                                          unratedColor:
                                              FlutterFlowTheme.of(context)
                                                  .frenchGray2,
                                          itemCount: 5,
                                          itemSize: 20.0,
                                        ),
                                        Text(
                                          '(${valueOrDefault<String>(
                                            clienteAvaliacaoSalaoSalaoRow
                                                ?.qntAvaliacoes
                                                ?.toString(),
                                            '0',
                                          )})',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 2.0,
                          color: Color(0x45000000),
                        ),
                        Text(
                          'Avalie o Salão!',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 24.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              30.0, 5.0, 30.0, 0.0),
                          child: Text(
                            'Leva apenas um minuto. Gostaríamos muito de saber sua opinião.',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            height: 650.0,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 180.0,
                                  height: 70.0,
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      RatingBar.builder(
                                        onRatingUpdate: (newValue) =>
                                            safeSetState(() => _model
                                                .ratingSalaoValue = newValue),
                                        itemBuilder: (context, index) => Icon(
                                          Icons.star_rounded,
                                          color: Color(0xFFF6E56B),
                                        ),
                                        direction: Axis.horizontal,
                                        initialRating:
                                            _model.ratingSalaoValue ??= 0.0,
                                        unratedColor:
                                            FlutterFlowTheme.of(context)
                                                .frenchGray2,
                                        itemCount: 5,
                                        itemSize: 36.0,
                                        glowColor: Color(0xFFF6E56B),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Ruim',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Text(
                                            'Ótimo',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 5.0, 0.0, 20.0),
                                  child: Container(
                                    width: 300.0,
                                    child: TextFormField(
                                      controller:
                                          _model.textFieldSalaoTextController,
                                      focusNode: _model.textFieldSalaoFocusNode,
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                            ),
                                        hintText: 'Escreva sua avaliação',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0.0,
                                          ),
                                      maxLines: 3,
                                      cursorColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      validator: _model
                                          .textFieldSalaoTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                                Divider(
                                  thickness: 2.0,
                                  color: Color(0x45000000),
                                ),
                                Text(
                                  'Avalie o Profissinal!',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 24.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Container(
                                    width: 180.0,
                                    height: 70.0,
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        RatingBar.builder(
                                          onRatingUpdate: (newValue) =>
                                              safeSetState(() => _model
                                                  .ratingProfValue = newValue),
                                          itemBuilder: (context, index) => Icon(
                                            Icons.star_rounded,
                                            color: Color(0xFFF6E56B),
                                          ),
                                          direction: Axis.horizontal,
                                          initialRating:
                                              _model.ratingProfValue ??= 0.0,
                                          unratedColor:
                                              FlutterFlowTheme.of(context)
                                                  .frenchGray2,
                                          itemCount: 5,
                                          itemSize: 36.0,
                                          glowColor: Color(0xFFF6E56B),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Ruim',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            Text(
                                              'Ótimo',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 20.0),
                                  child: Container(
                                    width: 300.0,
                                    child: TextFormField(
                                      controller:
                                          _model.textFieldProfTextController,
                                      focusNode: _model.textFieldProfFocusNode,
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                            ),
                                        hintText: 'Escreva sua avaliação',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0.0,
                                          ),
                                      maxLines: 3,
                                      cursorColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      validator: _model
                                          .textFieldProfTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 25.0, 0.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'CLIENTE_AVALIACAO_SALAO_ENVIAR_BTN_ON_TA');
                                      // salao
                                      logFirebaseEvent('Button_salao');
                                      await AvaliacaoTable().insert({
                                        'id_cliente': currentUserUid,
                                        'id_salao': widget!.refSalao,
                                        'descricao': _model
                                            .textFieldSalaoTextController.text,
                                        'estrelas': _model.ratingSalaoValue,
                                        'id_servico': widget!.refServico,
                                      });
                                      logFirebaseEvent('Button_backend_call');
                                      await SalaoTable().update(
                                        data: {
                                          'qnt_avaliacoes': functions
                                              .atualizarQuantAvaliacoes(
                                                  clienteAvaliacaoSalaoSalaoRow
                                                      ?.qntAvaliacoes),
                                          'estrelas':
                                              functions.atualizarEstrelas(
                                                  _model.ratingSalaoValue!,
                                                  clienteAvaliacaoSalaoSalaoRow
                                                      ?.estrelas,
                                                  clienteAvaliacaoSalaoSalaoRow
                                                      ?.qntAvaliacoes),
                                        },
                                        matchingRows: (rows) => rows.eqOrNull(
                                          'id_salao',
                                          widget!.refSalao,
                                        ),
                                      );
                                      // Prof
                                      logFirebaseEvent('Button_Prof');
                                      await AvaliacaoTable().insert({
                                        'id_cliente': currentUserUid,
                                        'id_prof': widget!.refProf,
                                        'descricao': _model
                                            .textFieldProfTextController.text,
                                        'estrelas': _model.ratingProfValue,
                                        'id_servico': widget!.refServico,
                                      });
                                      logFirebaseEvent('Button_backend_call');
                                      await ProfissionalTable().update(
                                        data: {
                                          'qnt_avaliacoes': functions
                                              .atualizarQuantAvaliacoes(
                                                  columnProfissionalRow
                                                      ?.qntAvaliacoes),
                                          'estrelas':
                                              functions.atualizarEstrelas(
                                                  _model.ratingProfValue!,
                                                  columnProfissionalRow
                                                      ?.estrelas,
                                                  columnProfissionalRow
                                                      ?.qntAvaliacoes),
                                        },
                                        matchingRows: (rows) => rows.eqOrNull(
                                          'id_prof',
                                          widget!.refProf,
                                        ),
                                      );
                                      // Agendamento
                                      logFirebaseEvent('Button_Agendamento');
                                      await AgendamentosTable().update(
                                        data: {
                                          'status': 'Avaliado',
                                        },
                                        matchingRows: (rows) => rows.eqOrNull(
                                          'id',
                                          widget!.refAgendamento,
                                        ),
                                      );
                                      logFirebaseEvent('Button_navigate_back');
                                      context.safePop();
                                    },
                                    text: 'Enviar',
                                    options: FFButtonOptions(
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 0.0,
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
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
