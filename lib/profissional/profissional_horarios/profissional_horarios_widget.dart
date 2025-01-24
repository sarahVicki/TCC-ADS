import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'profissional_horarios_model.dart';
export 'profissional_horarios_model.dart';

class ProfissionalHorariosWidget extends StatefulWidget {
  const ProfissionalHorariosWidget({super.key});

  @override
  State<ProfissionalHorariosWidget> createState() =>
      _ProfissionalHorariosWidgetState();
}

class _ProfissionalHorariosWidgetState
    extends State<ProfissionalHorariosWidget> {
  late ProfissionalHorariosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfissionalHorariosModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Profissional-Horarios'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('PROFISSIONAL_HORARIOS_Profissional-Horar');
      logFirebaseEvent('Profissional-Horarios_backend_call');
      _model.horasProf = await HorariosTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'id_horario',
          currentUserUid,
        ),
      );
      // Domingo
      logFirebaseEvent('Profissional-Horarios_Domingo');
      _model.updateListaHoraInicialAtIndex(
        0,
        (_) => _model.horasProf!
            .elementAtOrNull(0)!
            .horaAbertura
            .elementAtOrNull(0)!,
      );
      _model.updateListaHoraFinalAtIndex(
        0,
        (_) => _model.horasProf!
            .elementAtOrNull(0)!
            .horaFechamento
            .elementAtOrNull(0)!,
      );
      _model.updateListaStatusAtIndex(
        0,
        (_) => _model.horasProf!.elementAtOrNull(0)!.status.elementAtOrNull(0)!,
      );
      _model.updateIntervaloInicioAtIndex(
        0,
        (_) => _model.horasProf!
            .elementAtOrNull(0)!
            .intervaloInicio
            .elementAtOrNull(0)!,
      );
      _model.updateIntervaloFinalAtIndex(
        0,
        (_) => _model.horasProf!
            .elementAtOrNull(0)!
            .intervaloFinal
            .elementAtOrNull(0)!,
      );
      _model.updateLocalTrabalhoAtIndex(
        0,
        (_) => _model.horasProf!
            .elementAtOrNull(0)!
            .localTrabalho
            .elementAtOrNull(0)!,
      );
      safeSetState(() {});
      // Segunda
      logFirebaseEvent('Profissional-Horarios_Segunda');
      _model.updateListaHoraInicialAtIndex(
        1,
        (_) => _model.horasProf!
            .elementAtOrNull(0)!
            .horaAbertura
            .elementAtOrNull(1)!,
      );
      _model.updateListaHoraFinalAtIndex(
        1,
        (_) => _model.horasProf!
            .elementAtOrNull(0)!
            .horaFechamento
            .elementAtOrNull(1)!,
      );
      _model.updateListaStatusAtIndex(
        1,
        (_) => _model.horasProf!.elementAtOrNull(0)!.status.elementAtOrNull(1)!,
      );
      _model.updateIntervaloInicioAtIndex(
        1,
        (_) => _model.horasProf!
            .elementAtOrNull(0)!
            .intervaloInicio
            .elementAtOrNull(1)!,
      );
      _model.updateIntervaloFinalAtIndex(
        1,
        (_) => _model.horasProf!
            .elementAtOrNull(0)!
            .intervaloFinal
            .elementAtOrNull(1)!,
      );
      _model.updateLocalTrabalhoAtIndex(
        1,
        (_) => _model.horasProf!
            .elementAtOrNull(0)!
            .localTrabalho
            .elementAtOrNull(1)!,
      );
      safeSetState(() {});
      // Terca
      logFirebaseEvent('Profissional-Horarios_Terca');
      _model.updateListaHoraInicialAtIndex(
        2,
        (_) => _model.horasProf!
            .elementAtOrNull(0)!
            .horaAbertura
            .elementAtOrNull(2)!,
      );
      _model.updateListaHoraFinalAtIndex(
        2,
        (_) => _model.horasProf!
            .elementAtOrNull(0)!
            .horaFechamento
            .elementAtOrNull(2)!,
      );
      _model.updateListaStatusAtIndex(
        2,
        (_) => _model.horasProf!.elementAtOrNull(0)!.status.elementAtOrNull(2)!,
      );
      _model.updateIntervaloInicioAtIndex(
        2,
        (_) => _model.horasProf!
            .elementAtOrNull(0)!
            .intervaloInicio
            .elementAtOrNull(2)!,
      );
      _model.updateIntervaloFinalAtIndex(
        2,
        (_) => _model.horasProf!
            .elementAtOrNull(0)!
            .intervaloFinal
            .elementAtOrNull(2)!,
      );
      _model.updateLocalTrabalhoAtIndex(
        2,
        (_) => _model.horasProf!
            .elementAtOrNull(0)!
            .localTrabalho
            .elementAtOrNull(2)!,
      );
      safeSetState(() {});
      // Quarta
      logFirebaseEvent('Profissional-Horarios_Quarta');
      _model.updateListaHoraInicialAtIndex(
        3,
        (_) => _model.horasProf!
            .elementAtOrNull(0)!
            .horaAbertura
            .elementAtOrNull(3)!,
      );
      _model.updateListaHoraFinalAtIndex(
        3,
        (_) => _model.horasProf!
            .elementAtOrNull(0)!
            .horaFechamento
            .elementAtOrNull(3)!,
      );
      _model.updateListaStatusAtIndex(
        3,
        (_) => _model.horasProf!.elementAtOrNull(0)!.status.elementAtOrNull(3)!,
      );
      _model.updateIntervaloInicioAtIndex(
        3,
        (_) => _model.horasProf!
            .elementAtOrNull(0)!
            .intervaloInicio
            .elementAtOrNull(3)!,
      );
      _model.updateIntervaloFinalAtIndex(
        3,
        (_) => _model.horasProf!
            .elementAtOrNull(0)!
            .intervaloFinal
            .elementAtOrNull(3)!,
      );
      _model.updateLocalTrabalhoAtIndex(
        3,
        (_) => _model.horasProf!
            .elementAtOrNull(0)!
            .localTrabalho
            .elementAtOrNull(3)!,
      );
      safeSetState(() {});
      // Quinta
      logFirebaseEvent('Profissional-Horarios_Quinta');
      _model.updateListaHoraInicialAtIndex(
        4,
        (_) => _model.horasProf!
            .elementAtOrNull(0)!
            .horaAbertura
            .elementAtOrNull(4)!,
      );
      _model.updateListaHoraFinalAtIndex(
        4,
        (_) => _model.horasProf!
            .elementAtOrNull(0)!
            .horaFechamento
            .elementAtOrNull(4)!,
      );
      _model.updateListaStatusAtIndex(
        4,
        (_) => _model.horasProf!.elementAtOrNull(0)!.status.elementAtOrNull(4)!,
      );
      _model.updateIntervaloInicioAtIndex(
        4,
        (_) => _model.horasProf!
            .elementAtOrNull(0)!
            .intervaloInicio
            .elementAtOrNull(4)!,
      );
      _model.updateIntervaloFinalAtIndex(
        4,
        (_) => _model.horasProf!
            .elementAtOrNull(0)!
            .intervaloFinal
            .elementAtOrNull(4)!,
      );
      _model.updateLocalTrabalhoAtIndex(
        4,
        (_) => _model.horasProf!
            .elementAtOrNull(0)!
            .localTrabalho
            .elementAtOrNull(4)!,
      );
      safeSetState(() {});
      // Sexta
      logFirebaseEvent('Profissional-Horarios_Sexta');
      _model.updateListaHoraInicialAtIndex(
        5,
        (_) => _model.horasProf!
            .elementAtOrNull(0)!
            .horaAbertura
            .elementAtOrNull(5)!,
      );
      _model.updateListaHoraFinalAtIndex(
        5,
        (_) => _model.horasProf!
            .elementAtOrNull(0)!
            .horaFechamento
            .elementAtOrNull(5)!,
      );
      _model.updateListaStatusAtIndex(
        5,
        (_) => _model.horasProf!.elementAtOrNull(0)!.status.elementAtOrNull(5)!,
      );
      _model.updateIntervaloInicioAtIndex(
        5,
        (_) => _model.horasProf!
            .elementAtOrNull(0)!
            .intervaloInicio
            .elementAtOrNull(5)!,
      );
      _model.updateIntervaloFinalAtIndex(
        5,
        (_) => _model.horasProf!
            .elementAtOrNull(0)!
            .intervaloFinal
            .elementAtOrNull(5)!,
      );
      _model.updateLocalTrabalhoAtIndex(
        5,
        (_) => _model.horasProf!
            .elementAtOrNull(0)!
            .localTrabalho
            .elementAtOrNull(5)!,
      );
      safeSetState(() {});
      // Sabado
      logFirebaseEvent('Profissional-Horarios_Sabado');
      _model.updateListaHoraInicialAtIndex(
        6,
        (_) => _model.horasProf!
            .elementAtOrNull(0)!
            .horaAbertura
            .elementAtOrNull(6)!,
      );
      _model.updateListaHoraFinalAtIndex(
        6,
        (_) => _model.horasProf!
            .elementAtOrNull(0)!
            .horaFechamento
            .elementAtOrNull(6)!,
      );
      _model.updateListaStatusAtIndex(
        6,
        (_) => _model.horasProf!.elementAtOrNull(0)!.status.elementAtOrNull(6)!,
      );
      _model.updateIntervaloInicioAtIndex(
        6,
        (_) => _model.horasProf!
            .elementAtOrNull(0)!
            .intervaloInicio
            .elementAtOrNull(6)!,
      );
      _model.updateIntervaloFinalAtIndex(
        6,
        (_) => _model.horasProf!
            .elementAtOrNull(0)!
            .intervaloFinal
            .elementAtOrNull(6)!,
      );
      _model.updateLocalTrabalhoAtIndex(
        6,
        (_) => _model.horasProf!
            .elementAtOrNull(0)!
            .localTrabalho
            .elementAtOrNull(6)!,
      );
      safeSetState(() {});
    });

    _model.domInicialFocusNode ??= FocusNode();

    _model.domFinalFocusNode ??= FocusNode();

    _model.domInterInicialFocusNode ??= FocusNode();

    _model.domInterFinalFocusNode ??= FocusNode();

    _model.segInicialFocusNode ??= FocusNode();

    _model.segFinalFocusNode ??= FocusNode();

    _model.segInterInicialFocusNode ??= FocusNode();

    _model.segInterFinalFocusNode ??= FocusNode();

    _model.terInicialFocusNode ??= FocusNode();

    _model.terFinalFocusNode ??= FocusNode();

    _model.terInterInicialFocusNode ??= FocusNode();

    _model.terInterFinalFocusNode ??= FocusNode();

    _model.quaInicialFocusNode ??= FocusNode();

    _model.quaFinalFocusNode ??= FocusNode();

    _model.quaInterInicialFocusNode ??= FocusNode();

    _model.quaInterFinalFocusNode ??= FocusNode();

    _model.quiInicialFocusNode ??= FocusNode();

    _model.quiFinalFocusNode ??= FocusNode();

    _model.quiInterInicialFocusNode ??= FocusNode();

    _model.quiInterFinalFocusNode ??= FocusNode();

    _model.sexInicialFocusNode ??= FocusNode();

    _model.sexFinalFocusNode ??= FocusNode();

    _model.sexInterInicialFocusNode ??= FocusNode();

    _model.sexInterFinalFocusNode ??= FocusNode();

    _model.sabInicialFocusNode ??= FocusNode();

    _model.sabFinalFocusNode ??= FocusNode();

    _model.sabInterInicialFocusNode ??= FocusNode();

    _model.sabInterFinalFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryText,
            automaticallyImplyLeading: false,
            actions: [],
            flexibleSpace: FlexibleSpaceBar(
              title: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 14.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30.0,
                        borderWidth: 1.0,
                        buttonSize: 50.0,
                        icon: Icon(
                          Icons.arrow_back_rounded,
                          color: Colors.white,
                          size: 30.0,
                        ),
                        onPressed: () async {
                          logFirebaseEvent(
                              'PROFISSIONAL_HORARIOS_arrow_back_rounded');
                          logFirebaseEvent('IconButton_navigate_back');
                          context.pop();
                        },
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'Meus Horários\n',
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: 'Outfit',
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              centerTitle: true,
              expandedTitleScale: 1.0,
            ),
            elevation: 2.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: FutureBuilder<List<ProfissionalRow>>(
            future: ProfissionalTable().querySingleRow(
              queryFn: (q) => q.eqOrNull(
                'id_prof',
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
              List<ProfissionalRow> columnProfissionalRowList = snapshot.data!;

              final columnProfissionalRow = columnProfissionalRowList.isNotEmpty
                  ? columnProfissionalRowList.first
                  : null;

              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    StickyHeader(
                      overlapHeaders: false,
                      header: Container(
                        width: double.infinity,
                        height: 50.0,
                        constraints: BoxConstraints(
                          maxWidth: 430.0,
                        ),
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Meus Horários',
                              style: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    fontFamily: 'Outfit',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ),
                      ),
                      content: Container(
                        width: double.infinity,
                        constraints: BoxConstraints(
                          maxWidth: 430.0,
                        ),
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                        child: FutureBuilder<List<HorariosRow>>(
                          future: (_model.requestCompleter ??=
                                  Completer<List<HorariosRow>>()
                                    ..complete(HorariosTable().querySingleRow(
                                      queryFn: (q) => q.eqOrNull(
                                        'id_horario',
                                        currentUserUid,
                                      ),
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
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).chamoisee,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<HorariosRow> listViewHorariosRowList =
                                snapshot.data!;

                            final listViewHorariosRow =
                                listViewHorariosRowList.isNotEmpty
                                    ? listViewHorariosRowList.first
                                    : null;

                            return ListView(
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 1.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'PROFISSIONAL_HORARIOS_Domingo_ON_TAP');
                                        if (_model.statusDom == false) {
                                          logFirebaseEvent(
                                              'Domingo_update_page_state');
                                          _model.statusDom = true;
                                          safeSetState(() {});
                                        } else {
                                          logFirebaseEvent(
                                              'Domingo_update_page_state');
                                          _model.statusDom = false;
                                          safeSetState(() {});
                                        }
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 0.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              offset: Offset(
                                                0.0,
                                                1.0,
                                              ),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 12.0, 16.0, 12.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Domingo',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.47,
                                                  height: 40.0,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.rectangle,
                                                  ),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    15.0,
                                                                    0.0),
                                                        child: Container(
                                                          width: 70.0,
                                                          height: 30.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: (listViewHorariosRow
                                                                        ?.status
                                                                        ?.elementAtOrNull(
                                                                            0)) ==
                                                                    'Fechado'
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .error
                                                                : Color(
                                                                    0xFF80E34D),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Text(
                                                              (listViewHorariosRow
                                                                          ?.status
                                                                          ?.elementAtOrNull(
                                                                              0)) ==
                                                                      'Fechado'
                                                                  ? 'Fechado'
                                                                  : 'Aberto',
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
                                                      ),
                                                      if (((listViewHorariosRow
                                                                  ?.horaAbertura
                                                                  ?.elementAtOrNull(
                                                                      0)) !=
                                                              '0') &&
                                                          ((listViewHorariosRow
                                                                  ?.horaFechamento
                                                                  ?.elementAtOrNull(
                                                                      0)) !=
                                                              '0'))
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                listViewHorariosRow
                                                                    ?.horaAbertura
                                                                    ?.elementAtOrNull(
                                                                        0),
                                                                '00:00',
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
                                                            Text(
                                                              '-',
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
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                listViewHorariosRow
                                                                    ?.horaFechamento
                                                                    ?.elementAtOrNull(
                                                                        0),
                                                                '00:00',
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
                                                          ],
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              if (_model.statusDom == true)
                                                Icon(
                                                  Icons.keyboard_arrow_right,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 24.0,
                                                ),
                                              if (_model.statusDom == false)
                                                Icon(
                                                  Icons.keyboard_arrow_up,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 24.0,
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                if (_model.statusDom == false)
                                  Container(
                                    width: 100.0,
                                    height: 470.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 12.0, 16.0, 0.0),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Alterar Horário',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMedium
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 20.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: 290.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              'Domingo',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    fontSize:
                                                                        18.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                            FlutterFlowDropDown<
                                                                String>(
                                                              controller: _model
                                                                      .dropDownDomValueController ??=
                                                                  FormFieldController<
                                                                      String>(
                                                                _model.dropDownDomValue ??=
                                                                    listViewHorariosRow
                                                                        ?.status
                                                                        ?.elementAtOrNull(
                                                                            0),
                                                              ),
                                                              options: [
                                                                'Aberto',
                                                                'Fechado'
                                                              ],
                                                              onChanged: (val) =>
                                                                  safeSetState(() =>
                                                                      _model.dropDownDomValue =
                                                                          val),
                                                              width: 120.0,
                                                              height: 40.0,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              icon: Icon(
                                                                Icons
                                                                    .keyboard_arrow_down_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 24.0,
                                                              ),
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              elevation: 2.0,
                                                              borderColor:
                                                                  Colors.black,
                                                              borderWidth: 2.0,
                                                              borderRadius: 8.0,
                                                              margin:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                              hidesUnderline:
                                                                  true,
                                                              isOverButton:
                                                                  true,
                                                              isSearchable:
                                                                  false,
                                                              isMultiSelect:
                                                                  false,
                                                            ),
                                                          ],
                                                        ),
                                                        if (_model
                                                                .dropDownDomValue ==
                                                            'Aberto')
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: FutureBuilder<
                                                                List<SalaoRow>>(
                                                              future:
                                                                  SalaoTable()
                                                                      .queryRows(
                                                                queryFn: (q) =>
                                                                    q.inFilterOrNull(
                                                                  'id_salao',
                                                                  columnProfissionalRow
                                                                      ?.filiadoSalao,
                                                                ),
                                                              ),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          50.0,
                                                                      height:
                                                                          50.0,
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        valueColor:
                                                                            AlwaysStoppedAnimation<Color>(
                                                                          FlutterFlowTheme.of(context)
                                                                              .chamoisee,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                List<SalaoRow>
                                                                    radioButtonSalaoRowList =
                                                                    snapshot
                                                                        .data!;

                                                                return FlutterFlowRadioButton(
                                                                  options: radioButtonSalaoRowList
                                                                      .map((e) =>
                                                                          e.nome)
                                                                      .toList(),
                                                                  onChanged:
                                                                      (val) async {
                                                                    safeSetState(
                                                                        () {});
                                                                    logFirebaseEvent(
                                                                        'PROFISSIONAL_HORARIOS_RadioButton_3rx4t0');
                                                                    logFirebaseEvent(
                                                                        'RadioButton_update_page_state');
                                                                    _model
                                                                        .updateLocalTrabalhoAtIndex(
                                                                      0,
                                                                      (_) => valueOrDefault<
                                                                          String>(
                                                                        _model
                                                                            .radioButtonValue1,
                                                                        '0',
                                                                      ),
                                                                    );
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  controller: _model
                                                                      .radioButtonValueController1 ??= FormFieldController<
                                                                          String>(
                                                                      listViewHorariosRow!
                                                                          .localTrabalho
                                                                          .elementAtOrNull(
                                                                              0)!),
                                                                  optionHeight:
                                                                      32.0,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  selectedTextStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  buttonPosition:
                                                                      RadioButtonPosition
                                                                          .left,
                                                                  direction: Axis
                                                                      .horizontal,
                                                                  radioButtonColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                  inactiveRadioButtonColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                  toggleable:
                                                                      true,
                                                                  horizontalAlignment:
                                                                      WrapAlignment
                                                                          .start,
                                                                  verticalAlignment:
                                                                      WrapCrossAlignment
                                                                          .start,
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        if (_model
                                                                .dropDownDomValue ==
                                                            'Aberto')
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        20.0,
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
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'Horário Abertura',
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
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            150.0,
                                                                        child:
                                                                            TextFormField(
                                                                          controller: _model.domInicialTextController ??=
                                                                              TextEditingController(
                                                                            text: (listViewHorariosRow?.horaAbertura?.elementAtOrNull(0)) == '0'
                                                                                ? null
                                                                                : (listViewHorariosRow?.horaAbertura?.elementAtOrNull(0)),
                                                                          ),
                                                                          focusNode:
                                                                              _model.domInicialFocusNode,
                                                                          autofocus:
                                                                              true,
                                                                          obscureText:
                                                                              false,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            labelText:
                                                                                'EX: 09:00',
                                                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x80000000),
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Readex Pro',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          validator: _model
                                                                              .domInicialTextControllerValidator
                                                                              .asValidator(context),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'Horário Encerramento',
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
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            150.0,
                                                                        child:
                                                                            TextFormField(
                                                                          controller: _model.domFinalTextController ??=
                                                                              TextEditingController(
                                                                            text: (listViewHorariosRow?.horaFechamento?.elementAtOrNull(0)) == '0'
                                                                                ? null
                                                                                : (listViewHorariosRow?.horaFechamento?.elementAtOrNull(0)),
                                                                          ),
                                                                          focusNode:
                                                                              _model.domFinalFocusNode,
                                                                          autofocus:
                                                                              true,
                                                                          obscureText:
                                                                              false,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            labelText:
                                                                                'EX: 19:00',
                                                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x80000000),
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Readex Pro',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          validator: _model
                                                                              .domFinalTextControllerValidator
                                                                              .asValidator(context),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        if (_model
                                                                .dropDownDomValue ==
                                                            'Aberto')
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        20.0,
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
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'Início do Intervalo',
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
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            150.0,
                                                                        child:
                                                                            TextFormField(
                                                                          controller: _model.domInterInicialTextController ??=
                                                                              TextEditingController(
                                                                            text: (listViewHorariosRow?.intervaloInicio?.elementAtOrNull(0)) == '0'
                                                                                ? null
                                                                                : (listViewHorariosRow?.intervaloInicio?.elementAtOrNull(0)),
                                                                          ),
                                                                          focusNode:
                                                                              _model.domInterInicialFocusNode,
                                                                          autofocus:
                                                                              true,
                                                                          obscureText:
                                                                              false,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            labelText:
                                                                                'EX: 09:00',
                                                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x80000000),
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Readex Pro',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          validator: _model
                                                                              .domInterInicialTextControllerValidator
                                                                              .asValidator(context),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'Fim do Intervalo',
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
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            150.0,
                                                                        child:
                                                                            TextFormField(
                                                                          controller: _model.domInterFinalTextController ??=
                                                                              TextEditingController(
                                                                            text: (listViewHorariosRow?.intervaloFinal?.elementAtOrNull(0)) == '0'
                                                                                ? null
                                                                                : (listViewHorariosRow?.intervaloFinal?.elementAtOrNull(0)),
                                                                          ),
                                                                          focusNode:
                                                                              _model.domInterFinalFocusNode,
                                                                          autofocus:
                                                                              true,
                                                                          obscureText:
                                                                              false,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            labelText:
                                                                                'EX: 19:00',
                                                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x80000000),
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Readex Pro',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          validator: _model
                                                                              .domInterFinalTextControllerValidator
                                                                              .asValidator(context),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
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
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 15.0, 0.0, 0.0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'PROFISSIONAL_HORARIOS_SALVAR_BTN_ON_TAP');
                                                    if (_model
                                                            .dropDownDomValue ==
                                                        'Aberto') {
                                                      if (functions.horarioFormatoProf(
                                                          _model
                                                              .domInicialTextController
                                                              .text,
                                                          _model
                                                              .domFinalTextController
                                                              .text,
                                                          _model
                                                              .domInterInicialTextController
                                                              .text,
                                                          _model
                                                              .domInterFinalTextController
                                                              .text)) {
                                                        logFirebaseEvent(
                                                            'Button_update_page_state');
                                                        _model
                                                            .updateListaHoraInicialAtIndex(
                                                          0,
                                                          (_) => _model
                                                              .domInicialTextController
                                                              .text,
                                                        );
                                                        _model
                                                            .updateListaHoraFinalAtIndex(
                                                          0,
                                                          (_) => _model
                                                              .domFinalTextController
                                                              .text,
                                                        );
                                                        _model
                                                            .updateListaStatusAtIndex(
                                                          0,
                                                          (_) => _model
                                                              .dropDownDomValue!,
                                                        );
                                                        _model
                                                            .updateIntervaloInicioAtIndex(
                                                          0,
                                                          (_) => _model
                                                              .domInterInicialTextController
                                                              .text,
                                                        );
                                                        _model
                                                            .updateIntervaloFinalAtIndex(
                                                          0,
                                                          (_) => _model
                                                              .domInterFinalTextController
                                                              .text,
                                                        );
                                                        _model
                                                            .updateLocalTrabalhoAtIndex(
                                                          0,
                                                          (_) => valueOrDefault<
                                                              String>(
                                                            _model
                                                                .radioButtonValue1,
                                                            '0',
                                                          ),
                                                        );
                                                        safeSetState(() {});
                                                        logFirebaseEvent(
                                                            'Button_backend_call');
                                                        await HorariosTable()
                                                            .update(
                                                          data: {
                                                            'status': _model
                                                                .listaStatus,
                                                            'hora_abertura': _model
                                                                .listaHoraInicial,
                                                            'hora_fechamento':
                                                                _model
                                                                    .listaHoraFinal,
                                                            'intervalo_inicio':
                                                                _model
                                                                    .intervaloInicio,
                                                            'intervalo_final':
                                                                _model
                                                                    .intervaloFinal,
                                                            'local_trabalho':
                                                                _model
                                                                    .localTrabalho,
                                                          },
                                                          matchingRows:
                                                              (rows) =>
                                                                  rows.eqOrNull(
                                                            'id_horario',
                                                            currentUserUid,
                                                          ),
                                                        );
                                                        logFirebaseEvent(
                                                            'Button_update_page_state');
                                                        _model.statusDom = true;
                                                        safeSetState(() {});
                                                        logFirebaseEvent(
                                                            'Button_refresh_database_request');
                                                        safeSetState(() => _model
                                                                .requestCompleter =
                                                            null);
                                                        await _model
                                                            .waitForRequestCompleted();
                                                      } else {
                                                        logFirebaseEvent(
                                                            'Button_show_snack_bar');
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'Horário em formato Inválido',
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    2000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                          ),
                                                        );
                                                      }
                                                    } else {
                                                      logFirebaseEvent(
                                                          'Button_update_page_state');
                                                      _model
                                                          .updateListaHoraInicialAtIndex(
                                                        0,
                                                        (_) => '0',
                                                      );
                                                      _model
                                                          .updateListaHoraFinalAtIndex(
                                                        0,
                                                        (_) => '0',
                                                      );
                                                      _model
                                                          .updateListaStatusAtIndex(
                                                        0,
                                                        (_) => _model
                                                            .dropDownDomValue!,
                                                      );
                                                      _model
                                                          .updateIntervaloInicioAtIndex(
                                                        0,
                                                        (_) => '0',
                                                      );
                                                      _model
                                                          .updateIntervaloFinalAtIndex(
                                                        0,
                                                        (_) => '0',
                                                      );
                                                      _model
                                                          .updateLocalTrabalhoAtIndex(
                                                        0,
                                                        (_) => '0',
                                                      );
                                                      safeSetState(() {});
                                                      logFirebaseEvent(
                                                          'Button_backend_call');
                                                      await HorariosTable()
                                                          .update(
                                                        data: {
                                                          'status': _model
                                                              .listaStatus,
                                                          'hora_abertura': _model
                                                              .listaHoraInicial,
                                                          'hora_fechamento':
                                                              _model
                                                                  .listaHoraFinal,
                                                          'intervalo_inicio':
                                                              _model
                                                                  .intervaloInicio,
                                                          'intervalo_final':
                                                              _model
                                                                  .intervaloFinal,
                                                          'local_trabalho':
                                                              _model
                                                                  .localTrabalho,
                                                        },
                                                        matchingRows: (rows) =>
                                                            rows.eqOrNull(
                                                          'id_horario',
                                                          currentUserUid,
                                                        ),
                                                      );
                                                      logFirebaseEvent(
                                                          'Button_update_page_state');
                                                      _model.statusDom = true;
                                                      safeSetState(() {});
                                                      logFirebaseEvent(
                                                          'Button_refresh_database_request');
                                                      safeSetState(() => _model
                                                              .requestCompleter =
                                                          null);
                                                      await _model
                                                          .waitForRequestCompleted();
                                                    }
                                                  },
                                                  text: 'Salvar',
                                                  options: FFButtonOptions(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.9,
                                                    height: 40.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    elevation: 3.0,
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 0.0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'PROFISSIONAL_HORARIOS_CANCELAR_BTN_ON_TA');
                                                    logFirebaseEvent(
                                                        'Button_refresh_database_request');
                                                    safeSetState(() => _model
                                                            .requestCompleter =
                                                        null);
                                                    await _model
                                                        .waitForRequestCompleted();
                                                    logFirebaseEvent(
                                                        'Button_update_page_state');
                                                    _model.statusDom = true;
                                                    safeSetState(() {});
                                                  },
                                                  text: 'Cancelar',
                                                  options: FFButtonOptions(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.9,
                                                    height: 40.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    elevation: 3.0,
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 1.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'PROFISSIONAL_HORARIOS_Segunda_ON_TAP');
                                        if (_model.statusSeg == false) {
                                          logFirebaseEvent(
                                              'Segunda_update_page_state');
                                          _model.statusSeg = true;
                                          safeSetState(() {});
                                        } else {
                                          logFirebaseEvent(
                                              'Segunda_update_page_state');
                                          _model.statusSeg = false;
                                          safeSetState(() {});
                                        }
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 0.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              offset: Offset(
                                                0.0,
                                                1.0,
                                              ),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 12.0, 16.0, 12.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 12.0, 0.0),
                                                  child: Text(
                                                    'Segunda-feira',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.47,
                                                  height: 40.0,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.rectangle,
                                                  ),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    15.0,
                                                                    0.0),
                                                        child: Container(
                                                          width: 70.0,
                                                          height: 30.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: (listViewHorariosRow
                                                                        ?.status
                                                                        ?.elementAtOrNull(
                                                                            1)) ==
                                                                    'Fechado'
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .error
                                                                : Color(
                                                                    0xFF80E34D),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Text(
                                                              (listViewHorariosRow
                                                                          ?.status
                                                                          ?.elementAtOrNull(
                                                                              1)) ==
                                                                      'Fechado'
                                                                  ? 'Fechado'
                                                                  : 'Aberto',
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
                                                      ),
                                                      if (((listViewHorariosRow
                                                                  ?.horaAbertura
                                                                  ?.elementAtOrNull(
                                                                      1)) !=
                                                              '0') &&
                                                          ((listViewHorariosRow
                                                                  ?.horaFechamento
                                                                  ?.elementAtOrNull(
                                                                      1)) !=
                                                              '0'))
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                listViewHorariosRow
                                                                    ?.horaAbertura
                                                                    ?.elementAtOrNull(
                                                                        1),
                                                                '00:00',
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
                                                            Text(
                                                              '-',
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
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                listViewHorariosRow
                                                                    ?.horaFechamento
                                                                    ?.elementAtOrNull(
                                                                        1),
                                                                '00:00',
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
                                                          ],
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              if (_model.statusSeg == true)
                                                Icon(
                                                  Icons.keyboard_arrow_right,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 24.0,
                                                ),
                                              if (_model.statusSeg == false)
                                                Icon(
                                                  Icons.keyboard_arrow_up,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 24.0,
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                if (_model.statusSeg == false)
                                  Container(
                                    width: 100.0,
                                    height: 470.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 12.0, 16.0, 0.0),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Alterar Horário',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMedium
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 20.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: 290.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              'Segunda-Feira',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    fontSize:
                                                                        18.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                            FlutterFlowDropDown<
                                                                String>(
                                                              controller: _model
                                                                      .dropDownSegValueController ??=
                                                                  FormFieldController<
                                                                      String>(
                                                                _model.dropDownSegValue ??=
                                                                    listViewHorariosRow
                                                                        ?.status
                                                                        ?.elementAtOrNull(
                                                                            1),
                                                              ),
                                                              options: [
                                                                'Aberto',
                                                                'Fechado'
                                                              ],
                                                              onChanged: (val) =>
                                                                  safeSetState(() =>
                                                                      _model.dropDownSegValue =
                                                                          val),
                                                              width: 120.0,
                                                              height: 40.0,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              icon: Icon(
                                                                Icons
                                                                    .keyboard_arrow_down_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 24.0,
                                                              ),
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              elevation: 2.0,
                                                              borderColor:
                                                                  Colors.black,
                                                              borderWidth: 2.0,
                                                              borderRadius: 8.0,
                                                              margin:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                              hidesUnderline:
                                                                  true,
                                                              isOverButton:
                                                                  true,
                                                              isSearchable:
                                                                  false,
                                                              isMultiSelect:
                                                                  false,
                                                            ),
                                                          ],
                                                        ),
                                                        if (_model
                                                                .dropDownSegValue ==
                                                            'Aberto')
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: FutureBuilder<
                                                                List<SalaoRow>>(
                                                              future:
                                                                  SalaoTable()
                                                                      .queryRows(
                                                                queryFn: (q) =>
                                                                    q.inFilterOrNull(
                                                                  'id_salao',
                                                                  columnProfissionalRow
                                                                      ?.filiadoSalao,
                                                                ),
                                                              ),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          50.0,
                                                                      height:
                                                                          50.0,
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        valueColor:
                                                                            AlwaysStoppedAnimation<Color>(
                                                                          FlutterFlowTheme.of(context)
                                                                              .chamoisee,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                List<SalaoRow>
                                                                    radioButtonSalaoRowList =
                                                                    snapshot
                                                                        .data!;

                                                                return FlutterFlowRadioButton(
                                                                  options: radioButtonSalaoRowList
                                                                      .map((e) =>
                                                                          e.nome)
                                                                      .toList(),
                                                                  onChanged:
                                                                      (val) async {
                                                                    safeSetState(
                                                                        () {});
                                                                    logFirebaseEvent(
                                                                        'PROFISSIONAL_HORARIOS_RadioButton_t6yn5t');
                                                                    logFirebaseEvent(
                                                                        'RadioButton_update_page_state');
                                                                    _model
                                                                        .updateLocalTrabalhoAtIndex(
                                                                      1,
                                                                      (_) => valueOrDefault<
                                                                          String>(
                                                                        _model
                                                                            .radioButtonValue2,
                                                                        '0',
                                                                      ),
                                                                    );
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  controller: _model
                                                                      .radioButtonValueController2 ??= FormFieldController<
                                                                          String>(
                                                                      listViewHorariosRow!
                                                                          .localTrabalho
                                                                          .elementAtOrNull(
                                                                              1)!),
                                                                  optionHeight:
                                                                      32.0,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  selectedTextStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  buttonPosition:
                                                                      RadioButtonPosition
                                                                          .left,
                                                                  direction: Axis
                                                                      .horizontal,
                                                                  radioButtonColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                  inactiveRadioButtonColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                  toggleable:
                                                                      true,
                                                                  horizontalAlignment:
                                                                      WrapAlignment
                                                                          .start,
                                                                  verticalAlignment:
                                                                      WrapCrossAlignment
                                                                          .start,
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        if (_model
                                                                .dropDownSegValue ==
                                                            'Aberto')
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        20.0,
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
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'Horário Abertura',
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
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            150.0,
                                                                        child:
                                                                            TextFormField(
                                                                          controller: _model.segInicialTextController ??=
                                                                              TextEditingController(
                                                                            text: (listViewHorariosRow?.horaAbertura?.elementAtOrNull(1)) == '0'
                                                                                ? null
                                                                                : (listViewHorariosRow?.horaAbertura?.elementAtOrNull(1)),
                                                                          ),
                                                                          focusNode:
                                                                              _model.segInicialFocusNode,
                                                                          autofocus:
                                                                              true,
                                                                          obscureText:
                                                                              false,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            labelText:
                                                                                'EX: 09:00',
                                                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x80000000),
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Readex Pro',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          validator: _model
                                                                              .segInicialTextControllerValidator
                                                                              .asValidator(context),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'Horário Encerramento',
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
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            150.0,
                                                                        child:
                                                                            TextFormField(
                                                                          controller: _model.segFinalTextController ??=
                                                                              TextEditingController(
                                                                            text: (listViewHorariosRow?.horaFechamento?.elementAtOrNull(1)) == '0'
                                                                                ? null
                                                                                : (listViewHorariosRow?.horaFechamento?.elementAtOrNull(1)),
                                                                          ),
                                                                          focusNode:
                                                                              _model.segFinalFocusNode,
                                                                          autofocus:
                                                                              true,
                                                                          obscureText:
                                                                              false,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            labelText:
                                                                                'EX: 19:00',
                                                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x80000000),
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Readex Pro',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          validator: _model
                                                                              .segFinalTextControllerValidator
                                                                              .asValidator(context),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        if (_model
                                                                .dropDownSegValue ==
                                                            'Aberto')
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        20.0,
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
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'Início do Intervalo',
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
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            150.0,
                                                                        child:
                                                                            TextFormField(
                                                                          controller: _model.segInterInicialTextController ??=
                                                                              TextEditingController(
                                                                            text: (listViewHorariosRow?.intervaloInicio?.elementAtOrNull(1)) == '0'
                                                                                ? null
                                                                                : (listViewHorariosRow?.intervaloInicio?.elementAtOrNull(1)),
                                                                          ),
                                                                          focusNode:
                                                                              _model.segInterInicialFocusNode,
                                                                          autofocus:
                                                                              true,
                                                                          obscureText:
                                                                              false,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            labelText:
                                                                                'EX: 09:00',
                                                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x80000000),
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Readex Pro',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          validator: _model
                                                                              .segInterInicialTextControllerValidator
                                                                              .asValidator(context),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'Fim do Intervalo',
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
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            150.0,
                                                                        child:
                                                                            TextFormField(
                                                                          controller: _model.segInterFinalTextController ??=
                                                                              TextEditingController(
                                                                            text: (listViewHorariosRow?.intervaloFinal?.elementAtOrNull(1)) == '0'
                                                                                ? null
                                                                                : (listViewHorariosRow?.intervaloFinal?.elementAtOrNull(1)),
                                                                          ),
                                                                          focusNode:
                                                                              _model.segInterFinalFocusNode,
                                                                          autofocus:
                                                                              true,
                                                                          obscureText:
                                                                              false,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            labelText:
                                                                                'EX: 19:00',
                                                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x80000000),
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Readex Pro',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          validator: _model
                                                                              .segInterFinalTextControllerValidator
                                                                              .asValidator(context),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
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
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 15.0, 0.0, 0.0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'PROFISSIONAL_HORARIOS_SALVAR_BTN_ON_TAP');
                                                    if (_model
                                                            .dropDownSegValue ==
                                                        'Aberto') {
                                                      if (functions.horarioFormatoProf(
                                                          _model
                                                              .segInicialTextController
                                                              .text,
                                                          _model
                                                              .segFinalTextController
                                                              .text,
                                                          _model
                                                              .segInterInicialTextController
                                                              .text,
                                                          _model
                                                              .segInterFinalTextController
                                                              .text)) {
                                                        logFirebaseEvent(
                                                            'Button_update_page_state');
                                                        _model
                                                            .updateListaHoraInicialAtIndex(
                                                          1,
                                                          (_) => _model
                                                              .segInicialTextController
                                                              .text,
                                                        );
                                                        _model
                                                            .updateListaHoraFinalAtIndex(
                                                          1,
                                                          (_) => _model
                                                              .segFinalTextController
                                                              .text,
                                                        );
                                                        _model
                                                            .updateListaStatusAtIndex(
                                                          1,
                                                          (_) => _model
                                                              .dropDownSegValue!,
                                                        );
                                                        _model
                                                            .updateIntervaloInicioAtIndex(
                                                          1,
                                                          (_) => _model
                                                              .segInterInicialTextController
                                                              .text,
                                                        );
                                                        _model
                                                            .updateIntervaloFinalAtIndex(
                                                          1,
                                                          (_) => _model
                                                              .segInterFinalTextController
                                                              .text,
                                                        );
                                                        _model
                                                            .updateLocalTrabalhoAtIndex(
                                                          1,
                                                          (_) => valueOrDefault<
                                                              String>(
                                                            _model
                                                                .radioButtonValue2,
                                                            '0',
                                                          ),
                                                        );
                                                        safeSetState(() {});
                                                        logFirebaseEvent(
                                                            'Button_backend_call');
                                                        await HorariosTable()
                                                            .update(
                                                          data: {
                                                            'status': _model
                                                                .listaStatus,
                                                            'hora_abertura': _model
                                                                .listaHoraInicial,
                                                            'hora_fechamento':
                                                                _model
                                                                    .listaHoraFinal,
                                                            'intervalo_inicio':
                                                                _model
                                                                    .intervaloInicio,
                                                            'intervalo_final':
                                                                _model
                                                                    .intervaloFinal,
                                                            'local_trabalho':
                                                                _model
                                                                    .localTrabalho,
                                                          },
                                                          matchingRows:
                                                              (rows) =>
                                                                  rows.eqOrNull(
                                                            'id_horario',
                                                            currentUserUid,
                                                          ),
                                                        );
                                                        logFirebaseEvent(
                                                            'Button_update_page_state');
                                                        _model.statusSeg = true;
                                                        safeSetState(() {});
                                                        logFirebaseEvent(
                                                            'Button_refresh_database_request');
                                                        safeSetState(() => _model
                                                                .requestCompleter =
                                                            null);
                                                        await _model
                                                            .waitForRequestCompleted();
                                                      } else {
                                                        logFirebaseEvent(
                                                            'Button_show_snack_bar');
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'Horário em formato Inválido',
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    2000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                          ),
                                                        );
                                                      }
                                                    } else {
                                                      logFirebaseEvent(
                                                          'Button_update_page_state');
                                                      _model
                                                          .updateListaHoraInicialAtIndex(
                                                        1,
                                                        (_) => '0',
                                                      );
                                                      _model
                                                          .updateListaHoraFinalAtIndex(
                                                        1,
                                                        (_) => '0',
                                                      );
                                                      _model
                                                          .updateListaStatusAtIndex(
                                                        1,
                                                        (_) => _model
                                                            .dropDownSegValue!,
                                                      );
                                                      _model
                                                          .updateIntervaloInicioAtIndex(
                                                        1,
                                                        (_) => '0',
                                                      );
                                                      _model
                                                          .updateIntervaloFinalAtIndex(
                                                        1,
                                                        (_) => '0',
                                                      );
                                                      _model
                                                          .updateLocalTrabalhoAtIndex(
                                                        1,
                                                        (_) => '0',
                                                      );
                                                      safeSetState(() {});
                                                      logFirebaseEvent(
                                                          'Button_backend_call');
                                                      await HorariosTable()
                                                          .update(
                                                        data: {
                                                          'status': _model
                                                              .listaStatus,
                                                          'hora_abertura': _model
                                                              .listaHoraInicial,
                                                          'hora_fechamento':
                                                              _model
                                                                  .listaHoraFinal,
                                                          'intervalo_inicio':
                                                              _model
                                                                  .intervaloInicio,
                                                          'intervalo_final':
                                                              _model
                                                                  .intervaloFinal,
                                                          'local_trabalho':
                                                              _model
                                                                  .localTrabalho,
                                                        },
                                                        matchingRows: (rows) =>
                                                            rows.eqOrNull(
                                                          'id_horario',
                                                          currentUserUid,
                                                        ),
                                                      );
                                                      logFirebaseEvent(
                                                          'Button_update_page_state');
                                                      _model.statusSeg = true;
                                                      safeSetState(() {});
                                                      logFirebaseEvent(
                                                          'Button_refresh_database_request');
                                                      safeSetState(() => _model
                                                              .requestCompleter =
                                                          null);
                                                      await _model
                                                          .waitForRequestCompleted();
                                                    }
                                                  },
                                                  text: 'Salvar',
                                                  options: FFButtonOptions(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.9,
                                                    height: 40.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    elevation: 3.0,
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 0.0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'PROFISSIONAL_HORARIOS_CANCELAR_BTN_ON_TA');
                                                    logFirebaseEvent(
                                                        'Button_refresh_database_request');
                                                    safeSetState(() => _model
                                                            .requestCompleter =
                                                        null);
                                                    await _model
                                                        .waitForRequestCompleted();
                                                    logFirebaseEvent(
                                                        'Button_update_page_state');
                                                    _model.statusSeg = true;
                                                    safeSetState(() {});
                                                  },
                                                  text: 'Cancelar',
                                                  options: FFButtonOptions(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.9,
                                                    height: 40.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    elevation: 3.0,
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 1.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'PROFISSIONAL_HORARIOS_PAGE_Terca_ON_TAP');
                                        if (_model.statusTer == false) {
                                          logFirebaseEvent(
                                              'Terca_update_page_state');
                                          _model.statusTer = true;
                                          safeSetState(() {});
                                        } else {
                                          logFirebaseEvent(
                                              'Terca_update_page_state');
                                          _model.statusTer = false;
                                          safeSetState(() {});
                                        }
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 0.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              offset: Offset(
                                                0.0,
                                                1.0,
                                              ),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 12.0, 16.0, 12.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 12.0, 0.0),
                                                  child: Text(
                                                    'Terça-feira',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.47,
                                                  height: 40.0,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.rectangle,
                                                  ),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    15.0,
                                                                    0.0),
                                                        child: Container(
                                                          width: 70.0,
                                                          height: 30.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: (listViewHorariosRow
                                                                        ?.status
                                                                        ?.elementAtOrNull(
                                                                            2)) ==
                                                                    'Fechado'
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .error
                                                                : Color(
                                                                    0xFF80E34D),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Text(
                                                              (listViewHorariosRow
                                                                          ?.status
                                                                          ?.elementAtOrNull(
                                                                              2)) ==
                                                                      'Fechado'
                                                                  ? 'Fechado'
                                                                  : 'Aberto',
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
                                                      ),
                                                      if (((listViewHorariosRow
                                                                  ?.horaAbertura
                                                                  ?.elementAtOrNull(
                                                                      2)) !=
                                                              '0') &&
                                                          ((listViewHorariosRow
                                                                  ?.horaFechamento
                                                                  ?.elementAtOrNull(
                                                                      2)) !=
                                                              '0'))
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                listViewHorariosRow
                                                                    ?.horaAbertura
                                                                    ?.elementAtOrNull(
                                                                        2),
                                                                '00:00',
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
                                                            Text(
                                                              '-',
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
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                listViewHorariosRow
                                                                    ?.horaFechamento
                                                                    ?.elementAtOrNull(
                                                                        2),
                                                                '00:00',
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
                                                          ],
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              if (_model.statusTer == true)
                                                Icon(
                                                  Icons.keyboard_arrow_right,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 24.0,
                                                ),
                                              if (_model.statusTer == false)
                                                Icon(
                                                  Icons.keyboard_arrow_up,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 24.0,
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                if (_model.statusTer == false)
                                  Container(
                                    width: 100.0,
                                    height: 470.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 12.0, 16.0, 0.0),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Alterar Horário',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMedium
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 20.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: 290.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              'Terca-Feira',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    fontSize:
                                                                        18.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                            FlutterFlowDropDown<
                                                                String>(
                                                              controller: _model
                                                                      .dropDownTerValueController ??=
                                                                  FormFieldController<
                                                                      String>(
                                                                _model.dropDownTerValue ??=
                                                                    listViewHorariosRow
                                                                        ?.status
                                                                        ?.elementAtOrNull(
                                                                            2),
                                                              ),
                                                              options: [
                                                                'Aberto',
                                                                'Fechado'
                                                              ],
                                                              onChanged: (val) =>
                                                                  safeSetState(() =>
                                                                      _model.dropDownTerValue =
                                                                          val),
                                                              width: 120.0,
                                                              height: 40.0,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              icon: Icon(
                                                                Icons
                                                                    .keyboard_arrow_down_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 24.0,
                                                              ),
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              elevation: 2.0,
                                                              borderColor:
                                                                  Colors.black,
                                                              borderWidth: 2.0,
                                                              borderRadius: 8.0,
                                                              margin:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                              hidesUnderline:
                                                                  true,
                                                              isOverButton:
                                                                  true,
                                                              isSearchable:
                                                                  false,
                                                              isMultiSelect:
                                                                  false,
                                                            ),
                                                          ],
                                                        ),
                                                        if (_model
                                                                .dropDownTerValue ==
                                                            'Aberto')
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: FutureBuilder<
                                                                List<SalaoRow>>(
                                                              future:
                                                                  SalaoTable()
                                                                      .queryRows(
                                                                queryFn: (q) =>
                                                                    q.inFilterOrNull(
                                                                  'id_salao',
                                                                  columnProfissionalRow
                                                                      ?.filiadoSalao,
                                                                ),
                                                              ),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          50.0,
                                                                      height:
                                                                          50.0,
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        valueColor:
                                                                            AlwaysStoppedAnimation<Color>(
                                                                          FlutterFlowTheme.of(context)
                                                                              .chamoisee,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                List<SalaoRow>
                                                                    radioButtonSalaoRowList =
                                                                    snapshot
                                                                        .data!;

                                                                return FlutterFlowRadioButton(
                                                                  options: radioButtonSalaoRowList
                                                                      .map((e) =>
                                                                          e.nome)
                                                                      .toList(),
                                                                  onChanged:
                                                                      (val) async {
                                                                    safeSetState(
                                                                        () {});
                                                                    logFirebaseEvent(
                                                                        'PROFISSIONAL_HORARIOS_RadioButton_o1l8d5');
                                                                    logFirebaseEvent(
                                                                        'RadioButton_update_page_state');
                                                                    _model
                                                                        .updateLocalTrabalhoAtIndex(
                                                                      2,
                                                                      (_) => valueOrDefault<
                                                                          String>(
                                                                        _model
                                                                            .radioButtonValue3,
                                                                        '0',
                                                                      ),
                                                                    );
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  controller: _model
                                                                      .radioButtonValueController3 ??= FormFieldController<
                                                                          String>(
                                                                      listViewHorariosRow!
                                                                          .localTrabalho
                                                                          .elementAtOrNull(
                                                                              2)!),
                                                                  optionHeight:
                                                                      32.0,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  selectedTextStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  buttonPosition:
                                                                      RadioButtonPosition
                                                                          .left,
                                                                  direction: Axis
                                                                      .horizontal,
                                                                  radioButtonColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                  inactiveRadioButtonColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                  toggleable:
                                                                      true,
                                                                  horizontalAlignment:
                                                                      WrapAlignment
                                                                          .start,
                                                                  verticalAlignment:
                                                                      WrapCrossAlignment
                                                                          .start,
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        if (_model
                                                                .dropDownTerValue ==
                                                            'Aberto')
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        20.0,
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
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'Horário Abertura',
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
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            150.0,
                                                                        child:
                                                                            TextFormField(
                                                                          controller: _model.terInicialTextController ??=
                                                                              TextEditingController(
                                                                            text: (listViewHorariosRow?.horaAbertura?.elementAtOrNull(2)) == '0'
                                                                                ? null
                                                                                : (listViewHorariosRow?.horaAbertura?.elementAtOrNull(2)),
                                                                          ),
                                                                          focusNode:
                                                                              _model.terInicialFocusNode,
                                                                          autofocus:
                                                                              true,
                                                                          obscureText:
                                                                              false,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            labelText:
                                                                                'EX: 09:00',
                                                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x80000000),
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Readex Pro',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          validator: _model
                                                                              .terInicialTextControllerValidator
                                                                              .asValidator(context),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'Horário Encerramento',
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
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            150.0,
                                                                        child:
                                                                            TextFormField(
                                                                          controller: _model.terFinalTextController ??=
                                                                              TextEditingController(
                                                                            text: (listViewHorariosRow?.horaFechamento?.elementAtOrNull(2)) == '0'
                                                                                ? null
                                                                                : (listViewHorariosRow?.horaFechamento?.elementAtOrNull(2)),
                                                                          ),
                                                                          focusNode:
                                                                              _model.terFinalFocusNode,
                                                                          autofocus:
                                                                              true,
                                                                          obscureText:
                                                                              false,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            labelText:
                                                                                'EX: 19:00',
                                                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x80000000),
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Readex Pro',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          validator: _model
                                                                              .terFinalTextControllerValidator
                                                                              .asValidator(context),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        if (_model
                                                                .dropDownTerValue ==
                                                            'Aberto')
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        20.0,
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
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'Início do Intervalo',
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
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            150.0,
                                                                        child:
                                                                            TextFormField(
                                                                          controller: _model.terInterInicialTextController ??=
                                                                              TextEditingController(
                                                                            text: (listViewHorariosRow?.intervaloInicio?.elementAtOrNull(2)) == '0'
                                                                                ? null
                                                                                : (listViewHorariosRow?.intervaloInicio?.elementAtOrNull(2)),
                                                                          ),
                                                                          focusNode:
                                                                              _model.terInterInicialFocusNode,
                                                                          autofocus:
                                                                              true,
                                                                          obscureText:
                                                                              false,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            labelText:
                                                                                'EX: 9:00',
                                                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x80000000),
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Readex Pro',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          validator: _model
                                                                              .terInterInicialTextControllerValidator
                                                                              .asValidator(context),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'Fim do Intervalo',
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
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            150.0,
                                                                        child:
                                                                            TextFormField(
                                                                          controller: _model.terInterFinalTextController ??=
                                                                              TextEditingController(
                                                                            text: (listViewHorariosRow?.intervaloFinal?.elementAtOrNull(2)) == '0'
                                                                                ? null
                                                                                : (listViewHorariosRow?.intervaloFinal?.elementAtOrNull(2)),
                                                                          ),
                                                                          focusNode:
                                                                              _model.terInterFinalFocusNode,
                                                                          autofocus:
                                                                              true,
                                                                          obscureText:
                                                                              false,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            labelText:
                                                                                'EX: 19:00',
                                                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x80000000),
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Readex Pro',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          validator: _model
                                                                              .terInterFinalTextControllerValidator
                                                                              .asValidator(context),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
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
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 15.0, 0.0, 0.0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'PROFISSIONAL_HORARIOS_SALVAR_BTN_ON_TAP');
                                                    if (_model
                                                            .dropDownTerValue ==
                                                        'Aberto') {
                                                      if (functions.horarioFormatoProf(
                                                          _model
                                                              .terInicialTextController
                                                              .text,
                                                          _model
                                                              .terFinalTextController
                                                              .text,
                                                          _model
                                                              .terInterInicialTextController
                                                              .text,
                                                          _model
                                                              .terInterFinalTextController
                                                              .text)) {
                                                        logFirebaseEvent(
                                                            'Button_update_page_state');
                                                        _model
                                                            .updateListaHoraInicialAtIndex(
                                                          2,
                                                          (_) => _model
                                                              .terInicialTextController
                                                              .text,
                                                        );
                                                        _model
                                                            .updateListaHoraFinalAtIndex(
                                                          2,
                                                          (_) => _model
                                                              .terFinalTextController
                                                              .text,
                                                        );
                                                        _model
                                                            .updateListaStatusAtIndex(
                                                          2,
                                                          (_) => _model
                                                              .dropDownTerValue!,
                                                        );
                                                        _model
                                                            .updateIntervaloInicioAtIndex(
                                                          2,
                                                          (_) => _model
                                                              .terInterInicialTextController
                                                              .text,
                                                        );
                                                        _model
                                                            .updateIntervaloFinalAtIndex(
                                                          2,
                                                          (_) => _model
                                                              .terInterFinalTextController
                                                              .text,
                                                        );
                                                        _model
                                                            .updateLocalTrabalhoAtIndex(
                                                          2,
                                                          (_) => valueOrDefault<
                                                              String>(
                                                            _model
                                                                .radioButtonValue3,
                                                            '0',
                                                          ),
                                                        );
                                                        safeSetState(() {});
                                                        logFirebaseEvent(
                                                            'Button_backend_call');
                                                        await HorariosTable()
                                                            .update(
                                                          data: {
                                                            'status': _model
                                                                .listaStatus,
                                                            'hora_abertura': _model
                                                                .listaHoraInicial,
                                                            'hora_fechamento':
                                                                _model
                                                                    .listaHoraFinal,
                                                            'intervalo_inicio':
                                                                _model
                                                                    .intervaloInicio,
                                                            'intervalo_final':
                                                                _model
                                                                    .intervaloFinal,
                                                            'local_trabalho':
                                                                _model
                                                                    .localTrabalho,
                                                          },
                                                          matchingRows:
                                                              (rows) =>
                                                                  rows.eqOrNull(
                                                            'id_horario',
                                                            currentUserUid,
                                                          ),
                                                        );
                                                        logFirebaseEvent(
                                                            'Button_update_page_state');
                                                        _model.statusTer = true;
                                                        safeSetState(() {});
                                                        logFirebaseEvent(
                                                            'Button_refresh_database_request');
                                                        safeSetState(() => _model
                                                                .requestCompleter =
                                                            null);
                                                        await _model
                                                            .waitForRequestCompleted();
                                                      } else {
                                                        logFirebaseEvent(
                                                            'Button_show_snack_bar');
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'Horário em formato Inválido',
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    2000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                          ),
                                                        );
                                                      }
                                                    } else {
                                                      logFirebaseEvent(
                                                          'Button_update_page_state');
                                                      _model
                                                          .updateListaHoraInicialAtIndex(
                                                        2,
                                                        (_) => '0',
                                                      );
                                                      _model
                                                          .updateListaHoraFinalAtIndex(
                                                        2,
                                                        (_) => '0',
                                                      );
                                                      _model
                                                          .updateListaStatusAtIndex(
                                                        2,
                                                        (_) => _model
                                                            .dropDownTerValue!,
                                                      );
                                                      _model
                                                          .updateIntervaloInicioAtIndex(
                                                        2,
                                                        (_) => '0',
                                                      );
                                                      _model
                                                          .updateIntervaloFinalAtIndex(
                                                        2,
                                                        (_) => '0',
                                                      );
                                                      _model
                                                          .updateLocalTrabalhoAtIndex(
                                                        2,
                                                        (_) => '0',
                                                      );
                                                      safeSetState(() {});
                                                      logFirebaseEvent(
                                                          'Button_backend_call');
                                                      await HorariosTable()
                                                          .update(
                                                        data: {
                                                          'status': _model
                                                              .listaStatus,
                                                          'hora_abertura': _model
                                                              .listaHoraInicial,
                                                          'hora_fechamento':
                                                              _model
                                                                  .listaHoraFinal,
                                                          'intervalo_inicio':
                                                              _model
                                                                  .intervaloInicio,
                                                          'intervalo_final':
                                                              _model
                                                                  .intervaloFinal,
                                                          'local_trabalho':
                                                              _model
                                                                  .localTrabalho,
                                                        },
                                                        matchingRows: (rows) =>
                                                            rows.eqOrNull(
                                                          'id_horario',
                                                          currentUserUid,
                                                        ),
                                                      );
                                                      logFirebaseEvent(
                                                          'Button_update_page_state');
                                                      _model.statusTer = true;
                                                      safeSetState(() {});
                                                      logFirebaseEvent(
                                                          'Button_refresh_database_request');
                                                      safeSetState(() => _model
                                                              .requestCompleter =
                                                          null);
                                                      await _model
                                                          .waitForRequestCompleted();
                                                    }
                                                  },
                                                  text: 'Salvar',
                                                  options: FFButtonOptions(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.9,
                                                    height: 40.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    elevation: 3.0,
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 0.0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'PROFISSIONAL_HORARIOS_CANCELAR_BTN_ON_TA');
                                                    logFirebaseEvent(
                                                        'Button_refresh_database_request');
                                                    safeSetState(() => _model
                                                            .requestCompleter =
                                                        null);
                                                    await _model
                                                        .waitForRequestCompleted();
                                                    logFirebaseEvent(
                                                        'Button_update_page_state');
                                                    _model.statusTer = true;
                                                    safeSetState(() {});
                                                  },
                                                  text: 'Cancelar',
                                                  options: FFButtonOptions(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.9,
                                                    height: 40.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    elevation: 3.0,
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 1.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'PROFISSIONAL_HORARIOS_PAGE_Quarta_ON_TAP');
                                        if (_model.statusQua == false) {
                                          logFirebaseEvent(
                                              'Quarta_update_page_state');
                                          _model.statusQua = true;
                                          safeSetState(() {});
                                        } else {
                                          logFirebaseEvent(
                                              'Quarta_update_page_state');
                                          _model.statusQua = false;
                                          safeSetState(() {});
                                        }
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 0.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              offset: Offset(
                                                0.0,
                                                1.0,
                                              ),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 12.0, 16.0, 12.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 12.0, 0.0),
                                                  child: Text(
                                                    'Quarta-feira',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.47,
                                                  height: 40.0,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.rectangle,
                                                  ),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    15.0,
                                                                    0.0),
                                                        child: Container(
                                                          width: 70.0,
                                                          height: 30.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: (listViewHorariosRow
                                                                        ?.status
                                                                        ?.elementAtOrNull(
                                                                            3)) ==
                                                                    'Fechado'
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .error
                                                                : Color(
                                                                    0xFF80E34D),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Text(
                                                              (listViewHorariosRow
                                                                          ?.status
                                                                          ?.elementAtOrNull(
                                                                              3)) ==
                                                                      'Fechado'
                                                                  ? 'Fechado'
                                                                  : 'Aberto',
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
                                                      ),
                                                      if (((listViewHorariosRow
                                                                  ?.horaAbertura
                                                                  ?.elementAtOrNull(
                                                                      3)) !=
                                                              '0') &&
                                                          ((listViewHorariosRow
                                                                  ?.horaFechamento
                                                                  ?.elementAtOrNull(
                                                                      3)) !=
                                                              '0'))
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                listViewHorariosRow
                                                                    ?.horaAbertura
                                                                    ?.elementAtOrNull(
                                                                        3),
                                                                '00:00',
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
                                                            Text(
                                                              '-',
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
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                listViewHorariosRow
                                                                    ?.horaFechamento
                                                                    ?.elementAtOrNull(
                                                                        3),
                                                                '00:00',
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
                                                          ],
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              if (_model.statusQua == true)
                                                Icon(
                                                  Icons.keyboard_arrow_right,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 24.0,
                                                ),
                                              if (_model.statusQua == false)
                                                Icon(
                                                  Icons.keyboard_arrow_up,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 24.0,
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                if (_model.statusQua == false)
                                  Container(
                                    width: 100.0,
                                    height: 470.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 12.0, 16.0, 0.0),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Alterar Horário',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMedium
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 20.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: 290.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              'Quarta-Feira',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    fontSize:
                                                                        18.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                            FlutterFlowDropDown<
                                                                String>(
                                                              controller: _model
                                                                      .dropDownQuaValueController ??=
                                                                  FormFieldController<
                                                                      String>(
                                                                _model.dropDownQuaValue ??=
                                                                    listViewHorariosRow
                                                                        ?.status
                                                                        ?.elementAtOrNull(
                                                                            3),
                                                              ),
                                                              options: [
                                                                'Aberto',
                                                                'Fechado'
                                                              ],
                                                              onChanged: (val) =>
                                                                  safeSetState(() =>
                                                                      _model.dropDownQuaValue =
                                                                          val),
                                                              width: 120.0,
                                                              height: 40.0,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              icon: Icon(
                                                                Icons
                                                                    .keyboard_arrow_down_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 24.0,
                                                              ),
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              elevation: 2.0,
                                                              borderColor:
                                                                  Colors.black,
                                                              borderWidth: 2.0,
                                                              borderRadius: 8.0,
                                                              margin:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                              hidesUnderline:
                                                                  true,
                                                              isOverButton:
                                                                  true,
                                                              isSearchable:
                                                                  false,
                                                              isMultiSelect:
                                                                  false,
                                                            ),
                                                          ],
                                                        ),
                                                        if (_model
                                                                .dropDownQuaValue ==
                                                            'Aberto')
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: FutureBuilder<
                                                                List<SalaoRow>>(
                                                              future:
                                                                  SalaoTable()
                                                                      .queryRows(
                                                                queryFn: (q) =>
                                                                    q.inFilterOrNull(
                                                                  'id_salao',
                                                                  columnProfissionalRow
                                                                      ?.filiadoSalao,
                                                                ),
                                                              ),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          50.0,
                                                                      height:
                                                                          50.0,
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        valueColor:
                                                                            AlwaysStoppedAnimation<Color>(
                                                                          FlutterFlowTheme.of(context)
                                                                              .chamoisee,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                List<SalaoRow>
                                                                    radioButtonSalaoRowList =
                                                                    snapshot
                                                                        .data!;

                                                                return FlutterFlowRadioButton(
                                                                  options: radioButtonSalaoRowList
                                                                      .map((e) =>
                                                                          e.nome)
                                                                      .toList(),
                                                                  onChanged:
                                                                      (val) async {
                                                                    safeSetState(
                                                                        () {});
                                                                    logFirebaseEvent(
                                                                        'PROFISSIONAL_HORARIOS_RadioButton_kv00pb');
                                                                    logFirebaseEvent(
                                                                        'RadioButton_update_page_state');
                                                                    _model
                                                                        .updateLocalTrabalhoAtIndex(
                                                                      3,
                                                                      (_) => valueOrDefault<
                                                                          String>(
                                                                        _model
                                                                            .radioButtonValue4,
                                                                        '0',
                                                                      ),
                                                                    );
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  controller: _model
                                                                      .radioButtonValueController4 ??= FormFieldController<
                                                                          String>(
                                                                      listViewHorariosRow!
                                                                          .localTrabalho
                                                                          .elementAtOrNull(
                                                                              3)!),
                                                                  optionHeight:
                                                                      32.0,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  selectedTextStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  buttonPosition:
                                                                      RadioButtonPosition
                                                                          .left,
                                                                  direction: Axis
                                                                      .horizontal,
                                                                  radioButtonColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                  inactiveRadioButtonColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                  toggleable:
                                                                      true,
                                                                  horizontalAlignment:
                                                                      WrapAlignment
                                                                          .start,
                                                                  verticalAlignment:
                                                                      WrapCrossAlignment
                                                                          .start,
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        if (_model
                                                                .dropDownQuaValue ==
                                                            'Aberto')
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        20.0,
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
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'Horário Abertura',
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
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            150.0,
                                                                        child:
                                                                            TextFormField(
                                                                          controller: _model.quaInicialTextController ??=
                                                                              TextEditingController(
                                                                            text: (listViewHorariosRow?.horaAbertura?.elementAtOrNull(3)) == '0'
                                                                                ? null
                                                                                : (listViewHorariosRow?.horaAbertura?.elementAtOrNull(3)),
                                                                          ),
                                                                          focusNode:
                                                                              _model.quaInicialFocusNode,
                                                                          autofocus:
                                                                              true,
                                                                          obscureText:
                                                                              false,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            labelText:
                                                                                'EX: 09:00',
                                                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x80000000),
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Readex Pro',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          validator: _model
                                                                              .quaInicialTextControllerValidator
                                                                              .asValidator(context),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'Horário Encerramento',
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
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            150.0,
                                                                        child:
                                                                            TextFormField(
                                                                          controller: _model.quaFinalTextController ??=
                                                                              TextEditingController(
                                                                            text: (listViewHorariosRow?.horaFechamento?.elementAtOrNull(3)) == '0'
                                                                                ? null
                                                                                : (listViewHorariosRow?.horaFechamento?.elementAtOrNull(3)),
                                                                          ),
                                                                          focusNode:
                                                                              _model.quaFinalFocusNode,
                                                                          autofocus:
                                                                              true,
                                                                          obscureText:
                                                                              false,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            labelText:
                                                                                'EX: 19:00',
                                                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x80000000),
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Readex Pro',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          validator: _model
                                                                              .quaFinalTextControllerValidator
                                                                              .asValidator(context),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        if (_model
                                                                .dropDownQuaValue ==
                                                            'Aberto')
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        20.0,
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
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'Início do Intervalo',
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
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            150.0,
                                                                        child:
                                                                            TextFormField(
                                                                          controller: _model.quaInterInicialTextController ??=
                                                                              TextEditingController(
                                                                            text: (listViewHorariosRow?.intervaloInicio?.elementAtOrNull(3)) == '0'
                                                                                ? null
                                                                                : (listViewHorariosRow?.intervaloInicio?.elementAtOrNull(3)),
                                                                          ),
                                                                          focusNode:
                                                                              _model.quaInterInicialFocusNode,
                                                                          autofocus:
                                                                              true,
                                                                          obscureText:
                                                                              false,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            labelText:
                                                                                'EX: 09:00',
                                                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x80000000),
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Readex Pro',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          validator: _model
                                                                              .quaInterInicialTextControllerValidator
                                                                              .asValidator(context),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'Fim do Intervalo',
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
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            150.0,
                                                                        child:
                                                                            TextFormField(
                                                                          controller: _model.quaInterFinalTextController ??=
                                                                              TextEditingController(
                                                                            text: (listViewHorariosRow?.intervaloFinal?.elementAtOrNull(3)) == '0'
                                                                                ? null
                                                                                : (listViewHorariosRow?.intervaloFinal?.elementAtOrNull(3)),
                                                                          ),
                                                                          focusNode:
                                                                              _model.quaInterFinalFocusNode,
                                                                          autofocus:
                                                                              true,
                                                                          obscureText:
                                                                              false,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            labelText:
                                                                                'EX: 19:00',
                                                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x80000000),
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Readex Pro',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          validator: _model
                                                                              .quaInterFinalTextControllerValidator
                                                                              .asValidator(context),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
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
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 15.0, 0.0, 0.0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'PROFISSIONAL_HORARIOS_SALVAR_BTN_ON_TAP');
                                                    if (_model
                                                            .dropDownQuaValue ==
                                                        'Aberto') {
                                                      if (functions.horarioFormatoProf(
                                                          _model
                                                              .quaInicialTextController
                                                              .text,
                                                          _model
                                                              .quaFinalTextController
                                                              .text,
                                                          _model
                                                              .quaInterInicialTextController
                                                              .text,
                                                          _model
                                                              .quaInterFinalTextController
                                                              .text)) {
                                                        logFirebaseEvent(
                                                            'Button_update_page_state');
                                                        _model
                                                            .updateListaHoraInicialAtIndex(
                                                          3,
                                                          (_) => _model
                                                              .quaInicialTextController
                                                              .text,
                                                        );
                                                        _model
                                                            .updateListaHoraFinalAtIndex(
                                                          3,
                                                          (_) => _model
                                                              .quaFinalTextController
                                                              .text,
                                                        );
                                                        _model
                                                            .updateListaStatusAtIndex(
                                                          3,
                                                          (_) => _model
                                                              .dropDownQuaValue!,
                                                        );
                                                        _model
                                                            .updateIntervaloInicioAtIndex(
                                                          3,
                                                          (_) => _model
                                                              .quaInterInicialTextController
                                                              .text,
                                                        );
                                                        _model
                                                            .updateIntervaloFinalAtIndex(
                                                          3,
                                                          (_) => _model
                                                              .quaInterFinalTextController
                                                              .text,
                                                        );
                                                        _model
                                                            .updateLocalTrabalhoAtIndex(
                                                          3,
                                                          (_) => valueOrDefault<
                                                              String>(
                                                            _model
                                                                .radioButtonValue4,
                                                            '0',
                                                          ),
                                                        );
                                                        safeSetState(() {});
                                                        logFirebaseEvent(
                                                            'Button_backend_call');
                                                        await HorariosTable()
                                                            .update(
                                                          data: {
                                                            'status': _model
                                                                .listaStatus,
                                                            'hora_abertura': _model
                                                                .listaHoraInicial,
                                                            'hora_fechamento':
                                                                _model
                                                                    .listaHoraFinal,
                                                            'intervalo_inicio':
                                                                _model
                                                                    .intervaloInicio,
                                                            'intervalo_final':
                                                                _model
                                                                    .intervaloFinal,
                                                            'local_trabalho':
                                                                _model
                                                                    .localTrabalho,
                                                          },
                                                          matchingRows:
                                                              (rows) =>
                                                                  rows.eqOrNull(
                                                            'id_horario',
                                                            currentUserUid,
                                                          ),
                                                        );
                                                        logFirebaseEvent(
                                                            'Button_update_page_state');
                                                        _model.statusQua = true;
                                                        safeSetState(() {});
                                                        logFirebaseEvent(
                                                            'Button_refresh_database_request');
                                                        safeSetState(() => _model
                                                                .requestCompleter =
                                                            null);
                                                        await _model
                                                            .waitForRequestCompleted();
                                                      } else {
                                                        logFirebaseEvent(
                                                            'Button_show_snack_bar');
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'Horário em formato Inválido',
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    2000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                          ),
                                                        );
                                                      }
                                                    } else {
                                                      logFirebaseEvent(
                                                          'Button_update_page_state');
                                                      _model
                                                          .updateListaHoraInicialAtIndex(
                                                        3,
                                                        (_) => '0',
                                                      );
                                                      _model
                                                          .updateListaHoraFinalAtIndex(
                                                        3,
                                                        (_) => '0',
                                                      );
                                                      _model
                                                          .updateListaStatusAtIndex(
                                                        3,
                                                        (_) => _model
                                                            .dropDownQuaValue!,
                                                      );
                                                      _model
                                                          .updateIntervaloInicioAtIndex(
                                                        3,
                                                        (_) => '0',
                                                      );
                                                      _model
                                                          .updateIntervaloFinalAtIndex(
                                                        3,
                                                        (_) => '0',
                                                      );
                                                      _model
                                                          .updateLocalTrabalhoAtIndex(
                                                        3,
                                                        (_) => '0',
                                                      );
                                                      safeSetState(() {});
                                                      logFirebaseEvent(
                                                          'Button_backend_call');
                                                      await HorariosTable()
                                                          .update(
                                                        data: {
                                                          'status': _model
                                                              .listaStatus,
                                                          'hora_abertura': _model
                                                              .listaHoraInicial,
                                                          'hora_fechamento':
                                                              _model
                                                                  .listaHoraFinal,
                                                          'intervalo_inicio':
                                                              _model
                                                                  .intervaloInicio,
                                                          'intervalo_final':
                                                              _model
                                                                  .intervaloFinal,
                                                          'local_trabalho':
                                                              _model
                                                                  .localTrabalho,
                                                        },
                                                        matchingRows: (rows) =>
                                                            rows.eqOrNull(
                                                          'id_horario',
                                                          currentUserUid,
                                                        ),
                                                      );
                                                      logFirebaseEvent(
                                                          'Button_update_page_state');
                                                      _model.statusQua = true;
                                                      safeSetState(() {});
                                                      logFirebaseEvent(
                                                          'Button_refresh_database_request');
                                                      safeSetState(() => _model
                                                              .requestCompleter =
                                                          null);
                                                      await _model
                                                          .waitForRequestCompleted();
                                                    }
                                                  },
                                                  text: 'Salvar',
                                                  options: FFButtonOptions(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.9,
                                                    height: 40.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    elevation: 3.0,
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 0.0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'PROFISSIONAL_HORARIOS_CANCELAR_BTN_ON_TA');
                                                    logFirebaseEvent(
                                                        'Button_refresh_database_request');
                                                    safeSetState(() => _model
                                                            .requestCompleter =
                                                        null);
                                                    await _model
                                                        .waitForRequestCompleted();
                                                    logFirebaseEvent(
                                                        'Button_update_page_state');
                                                    _model.statusQua = true;
                                                    safeSetState(() {});
                                                  },
                                                  text: 'Cancelar',
                                                  options: FFButtonOptions(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.9,
                                                    height: 40.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    elevation: 3.0,
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 1.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'PROFISSIONAL_HORARIOS_PAGE_Quinta_ON_TAP');
                                        if (_model.statusQui == false) {
                                          logFirebaseEvent(
                                              'Quinta_update_page_state');
                                          _model.statusQui = true;
                                          safeSetState(() {});
                                        } else {
                                          logFirebaseEvent(
                                              'Quinta_update_page_state');
                                          _model.statusQui = false;
                                          safeSetState(() {});
                                        }
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 0.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              offset: Offset(
                                                0.0,
                                                1.0,
                                              ),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 12.0, 16.0, 12.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 12.0, 0.0),
                                                  child: Text(
                                                    'Quinta-feira',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.47,
                                                  height: 40.0,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.rectangle,
                                                  ),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    15.0,
                                                                    0.0),
                                                        child: Container(
                                                          width: 70.0,
                                                          height: 30.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: (listViewHorariosRow
                                                                        ?.status
                                                                        ?.elementAtOrNull(
                                                                            4)) ==
                                                                    'Fechado'
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .error
                                                                : Color(
                                                                    0xFF80E34D),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Text(
                                                              (listViewHorariosRow
                                                                          ?.status
                                                                          ?.elementAtOrNull(
                                                                              4)) ==
                                                                      'Fechado'
                                                                  ? 'Fechado'
                                                                  : 'Aberto',
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
                                                      ),
                                                      if (((listViewHorariosRow
                                                                  ?.horaAbertura
                                                                  ?.elementAtOrNull(
                                                                      4)) !=
                                                              '0') &&
                                                          ((listViewHorariosRow
                                                                  ?.horaFechamento
                                                                  ?.elementAtOrNull(
                                                                      4)) !=
                                                              '0'))
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                listViewHorariosRow
                                                                    ?.horaAbertura
                                                                    ?.elementAtOrNull(
                                                                        4),
                                                                '00:00',
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
                                                            Text(
                                                              '-',
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
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                listViewHorariosRow
                                                                    ?.horaFechamento
                                                                    ?.elementAtOrNull(
                                                                        4),
                                                                '00:00',
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
                                                          ],
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              if (_model.statusQui == true)
                                                Icon(
                                                  Icons.keyboard_arrow_right,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 24.0,
                                                ),
                                              if (_model.statusQui == false)
                                                Icon(
                                                  Icons.keyboard_arrow_up,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 24.0,
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                if (_model.statusQui == false)
                                  Container(
                                    width: 100.0,
                                    height: 470.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 12.0, 16.0, 0.0),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Alterar Horário',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMedium
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 20.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: 290.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              'Quinta-Feira',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    fontSize:
                                                                        18.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                            FlutterFlowDropDown<
                                                                String>(
                                                              controller: _model
                                                                      .dropDownQuiValueController ??=
                                                                  FormFieldController<
                                                                      String>(
                                                                _model.dropDownQuiValue ??=
                                                                    listViewHorariosRow
                                                                        ?.status
                                                                        ?.elementAtOrNull(
                                                                            4),
                                                              ),
                                                              options: [
                                                                'Aberto',
                                                                'Fechado'
                                                              ],
                                                              onChanged: (val) =>
                                                                  safeSetState(() =>
                                                                      _model.dropDownQuiValue =
                                                                          val),
                                                              width: 120.0,
                                                              height: 40.0,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              icon: Icon(
                                                                Icons
                                                                    .keyboard_arrow_down_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 24.0,
                                                              ),
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              elevation: 2.0,
                                                              borderColor:
                                                                  Colors.black,
                                                              borderWidth: 2.0,
                                                              borderRadius: 8.0,
                                                              margin:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                              hidesUnderline:
                                                                  true,
                                                              isOverButton:
                                                                  true,
                                                              isSearchable:
                                                                  false,
                                                              isMultiSelect:
                                                                  false,
                                                            ),
                                                          ],
                                                        ),
                                                        if (_model
                                                                .dropDownQuiValue ==
                                                            'Aberto')
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: FutureBuilder<
                                                                List<SalaoRow>>(
                                                              future:
                                                                  SalaoTable()
                                                                      .queryRows(
                                                                queryFn: (q) =>
                                                                    q.inFilterOrNull(
                                                                  'id_salao',
                                                                  columnProfissionalRow
                                                                      ?.filiadoSalao,
                                                                ),
                                                              ),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          50.0,
                                                                      height:
                                                                          50.0,
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        valueColor:
                                                                            AlwaysStoppedAnimation<Color>(
                                                                          FlutterFlowTheme.of(context)
                                                                              .chamoisee,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                List<SalaoRow>
                                                                    radioButtonSalaoRowList =
                                                                    snapshot
                                                                        .data!;

                                                                return FlutterFlowRadioButton(
                                                                  options: radioButtonSalaoRowList
                                                                      .map((e) =>
                                                                          e.nome)
                                                                      .toList(),
                                                                  onChanged:
                                                                      (val) async {
                                                                    safeSetState(
                                                                        () {});
                                                                    logFirebaseEvent(
                                                                        'PROFISSIONAL_HORARIOS_RadioButton_9dbd0l');
                                                                    logFirebaseEvent(
                                                                        'RadioButton_update_page_state');
                                                                    _model
                                                                        .updateLocalTrabalhoAtIndex(
                                                                      4,
                                                                      (_) => valueOrDefault<
                                                                          String>(
                                                                        _model
                                                                            .radioButtonValue5,
                                                                        '0',
                                                                      ),
                                                                    );
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  controller: _model
                                                                      .radioButtonValueController5 ??= FormFieldController<
                                                                          String>(
                                                                      listViewHorariosRow!
                                                                          .localTrabalho
                                                                          .elementAtOrNull(
                                                                              4)!),
                                                                  optionHeight:
                                                                      32.0,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  selectedTextStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  buttonPosition:
                                                                      RadioButtonPosition
                                                                          .left,
                                                                  direction: Axis
                                                                      .horizontal,
                                                                  radioButtonColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                  inactiveRadioButtonColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                  toggleable:
                                                                      true,
                                                                  horizontalAlignment:
                                                                      WrapAlignment
                                                                          .start,
                                                                  verticalAlignment:
                                                                      WrapCrossAlignment
                                                                          .start,
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        if (_model
                                                                .dropDownQuiValue ==
                                                            'Aberto')
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        20.0,
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
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'Horário Abertura',
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
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            150.0,
                                                                        child:
                                                                            TextFormField(
                                                                          controller: _model.quiInicialTextController ??=
                                                                              TextEditingController(
                                                                            text: (listViewHorariosRow?.horaAbertura?.elementAtOrNull(4)) == '0'
                                                                                ? null
                                                                                : (listViewHorariosRow?.horaAbertura?.elementAtOrNull(4)),
                                                                          ),
                                                                          focusNode:
                                                                              _model.quiInicialFocusNode,
                                                                          autofocus:
                                                                              true,
                                                                          obscureText:
                                                                              false,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            labelText:
                                                                                'EX: 09:00',
                                                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x80000000),
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Readex Pro',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          validator: _model
                                                                              .quiInicialTextControllerValidator
                                                                              .asValidator(context),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'Horário Encerramento',
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
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            150.0,
                                                                        child:
                                                                            TextFormField(
                                                                          controller: _model.quiFinalTextController ??=
                                                                              TextEditingController(
                                                                            text: (listViewHorariosRow?.horaFechamento?.elementAtOrNull(4)) == '0'
                                                                                ? null
                                                                                : (listViewHorariosRow?.horaFechamento?.elementAtOrNull(4)),
                                                                          ),
                                                                          focusNode:
                                                                              _model.quiFinalFocusNode,
                                                                          autofocus:
                                                                              true,
                                                                          obscureText:
                                                                              false,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            labelText:
                                                                                'EX: 19:00',
                                                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x80000000),
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Readex Pro',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          validator: _model
                                                                              .quiFinalTextControllerValidator
                                                                              .asValidator(context),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        if (_model
                                                                .dropDownQuiValue ==
                                                            'Aberto')
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        20.0,
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
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'Início do Intervalo',
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
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            150.0,
                                                                        child:
                                                                            TextFormField(
                                                                          controller: _model.quiInterInicialTextController ??=
                                                                              TextEditingController(
                                                                            text: (listViewHorariosRow?.intervaloInicio?.elementAtOrNull(4)) == '0'
                                                                                ? null
                                                                                : (listViewHorariosRow?.intervaloInicio?.elementAtOrNull(4)),
                                                                          ),
                                                                          focusNode:
                                                                              _model.quiInterInicialFocusNode,
                                                                          autofocus:
                                                                              true,
                                                                          obscureText:
                                                                              false,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            labelText:
                                                                                'EX: 09:00',
                                                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x80000000),
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Readex Pro',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          validator: _model
                                                                              .quiInterInicialTextControllerValidator
                                                                              .asValidator(context),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'Fim do Intervalo',
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
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            150.0,
                                                                        child:
                                                                            TextFormField(
                                                                          controller: _model.quiInterFinalTextController ??=
                                                                              TextEditingController(
                                                                            text: (listViewHorariosRow?.intervaloFinal?.elementAtOrNull(4)) == '0'
                                                                                ? null
                                                                                : (listViewHorariosRow?.intervaloFinal?.elementAtOrNull(4)),
                                                                          ),
                                                                          focusNode:
                                                                              _model.quiInterFinalFocusNode,
                                                                          autofocus:
                                                                              true,
                                                                          obscureText:
                                                                              false,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            labelText:
                                                                                'EX: 19:00',
                                                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x80000000),
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Readex Pro',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          validator: _model
                                                                              .quiInterFinalTextControllerValidator
                                                                              .asValidator(context),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
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
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 15.0, 0.0, 0.0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'PROFISSIONAL_HORARIOS_SALVAR_BTN_ON_TAP');
                                                    if (_model
                                                            .dropDownQuiValue ==
                                                        'Aberto') {
                                                      if (functions.horarioFormatoProf(
                                                          _model
                                                              .quiInicialTextController
                                                              .text,
                                                          _model
                                                              .quiFinalTextController
                                                              .text,
                                                          _model
                                                              .quiInterInicialTextController
                                                              .text,
                                                          _model
                                                              .quiInterFinalTextController
                                                              .text)) {
                                                        logFirebaseEvent(
                                                            'Button_update_page_state');
                                                        _model
                                                            .updateListaHoraInicialAtIndex(
                                                          4,
                                                          (_) => _model
                                                              .quiInicialTextController
                                                              .text,
                                                        );
                                                        _model
                                                            .updateListaHoraFinalAtIndex(
                                                          4,
                                                          (_) => _model
                                                              .quiFinalTextController
                                                              .text,
                                                        );
                                                        _model
                                                            .updateListaStatusAtIndex(
                                                          4,
                                                          (_) => _model
                                                              .dropDownQuiValue!,
                                                        );
                                                        _model
                                                            .updateIntervaloInicioAtIndex(
                                                          4,
                                                          (_) => _model
                                                              .quiInterInicialTextController
                                                              .text,
                                                        );
                                                        _model
                                                            .updateIntervaloFinalAtIndex(
                                                          4,
                                                          (_) => _model
                                                              .quiFinalTextController
                                                              .text,
                                                        );
                                                        _model
                                                            .updateLocalTrabalhoAtIndex(
                                                          4,
                                                          (_) => valueOrDefault<
                                                              String>(
                                                            _model
                                                                .radioButtonValue5,
                                                            '0',
                                                          ),
                                                        );
                                                        safeSetState(() {});
                                                        logFirebaseEvent(
                                                            'Button_backend_call');
                                                        await HorariosTable()
                                                            .update(
                                                          data: {
                                                            'status': _model
                                                                .listaStatus,
                                                            'hora_abertura': _model
                                                                .listaHoraInicial,
                                                            'hora_fechamento':
                                                                _model
                                                                    .listaHoraFinal,
                                                            'intervalo_inicio':
                                                                _model
                                                                    .intervaloInicio,
                                                            'intervalo_final':
                                                                _model
                                                                    .intervaloFinal,
                                                            'local_trabalho':
                                                                _model
                                                                    .localTrabalho,
                                                          },
                                                          matchingRows:
                                                              (rows) =>
                                                                  rows.eqOrNull(
                                                            'id_horario',
                                                            currentUserUid,
                                                          ),
                                                        );
                                                        logFirebaseEvent(
                                                            'Button_update_page_state');
                                                        _model.statusQui = true;
                                                        safeSetState(() {});
                                                        logFirebaseEvent(
                                                            'Button_refresh_database_request');
                                                        safeSetState(() => _model
                                                                .requestCompleter =
                                                            null);
                                                        await _model
                                                            .waitForRequestCompleted();
                                                      } else {
                                                        logFirebaseEvent(
                                                            'Button_show_snack_bar');
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'Horário em formato Inválido',
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    2000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                          ),
                                                        );
                                                      }
                                                    } else {
                                                      logFirebaseEvent(
                                                          'Button_update_page_state');
                                                      _model
                                                          .updateListaHoraInicialAtIndex(
                                                        4,
                                                        (_) => '0',
                                                      );
                                                      _model
                                                          .updateListaHoraFinalAtIndex(
                                                        4,
                                                        (_) => '0',
                                                      );
                                                      _model
                                                          .updateListaStatusAtIndex(
                                                        4,
                                                        (_) => _model
                                                            .dropDownQuiValue!,
                                                      );
                                                      _model
                                                          .updateIntervaloInicioAtIndex(
                                                        4,
                                                        (_) => '0',
                                                      );
                                                      _model
                                                          .updateIntervaloFinalAtIndex(
                                                        4,
                                                        (_) => '0',
                                                      );
                                                      _model
                                                          .updateLocalTrabalhoAtIndex(
                                                        4,
                                                        (_) => '0',
                                                      );
                                                      safeSetState(() {});
                                                      logFirebaseEvent(
                                                          'Button_backend_call');
                                                      await HorariosTable()
                                                          .update(
                                                        data: {
                                                          'status': _model
                                                              .listaStatus,
                                                          'hora_abertura': _model
                                                              .listaHoraInicial,
                                                          'hora_fechamento':
                                                              _model
                                                                  .listaHoraFinal,
                                                          'intervalo_inicio':
                                                              _model
                                                                  .intervaloInicio,
                                                          'intervalo_final':
                                                              _model
                                                                  .intervaloFinal,
                                                          'local_trabalho':
                                                              _model
                                                                  .localTrabalho,
                                                        },
                                                        matchingRows: (rows) =>
                                                            rows.eqOrNull(
                                                          'id_horario',
                                                          currentUserUid,
                                                        ),
                                                      );
                                                      logFirebaseEvent(
                                                          'Button_update_page_state');
                                                      _model.statusQui = true;
                                                      safeSetState(() {});
                                                      logFirebaseEvent(
                                                          'Button_refresh_database_request');
                                                      safeSetState(() => _model
                                                              .requestCompleter =
                                                          null);
                                                      await _model
                                                          .waitForRequestCompleted();
                                                    }
                                                  },
                                                  text: 'Salvar',
                                                  options: FFButtonOptions(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.9,
                                                    height: 40.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    elevation: 3.0,
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 0.0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'PROFISSIONAL_HORARIOS_CANCELAR_BTN_ON_TA');
                                                    logFirebaseEvent(
                                                        'Button_refresh_database_request');
                                                    safeSetState(() => _model
                                                            .requestCompleter =
                                                        null);
                                                    await _model
                                                        .waitForRequestCompleted();
                                                    logFirebaseEvent(
                                                        'Button_update_page_state');
                                                    _model.statusQui = true;
                                                    safeSetState(() {});
                                                  },
                                                  text: 'Cancelar',
                                                  options: FFButtonOptions(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.9,
                                                    height: 40.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    elevation: 3.0,
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 1.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'PROFISSIONAL_HORARIOS_PAGE_Sexta_ON_TAP');
                                        if (_model.statusSex == false) {
                                          logFirebaseEvent(
                                              'Sexta_update_page_state');
                                          _model.statusSex = true;
                                          safeSetState(() {});
                                        } else {
                                          logFirebaseEvent(
                                              'Sexta_update_page_state');
                                          _model.statusSex = false;
                                          safeSetState(() {});
                                        }
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 0.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              offset: Offset(
                                                0.0,
                                                1.0,
                                              ),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 12.0, 16.0, 12.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 12.0, 0.0),
                                                  child: Text(
                                                    'Sexta-feira',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.47,
                                                  height: 40.0,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.rectangle,
                                                  ),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    15.0,
                                                                    0.0),
                                                        child: Container(
                                                          width: 70.0,
                                                          height: 30.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: (listViewHorariosRow
                                                                        ?.status
                                                                        ?.elementAtOrNull(
                                                                            5)) ==
                                                                    'Fechado'
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .error
                                                                : Color(
                                                                    0xFF80E34D),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Text(
                                                              (listViewHorariosRow
                                                                          ?.status
                                                                          ?.elementAtOrNull(
                                                                              5)) ==
                                                                      'Fechado'
                                                                  ? 'Fechado'
                                                                  : 'Aberto',
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
                                                      ),
                                                      if (((listViewHorariosRow
                                                                  ?.horaAbertura
                                                                  ?.elementAtOrNull(
                                                                      5)) !=
                                                              '0') &&
                                                          ((listViewHorariosRow
                                                                  ?.horaFechamento
                                                                  ?.elementAtOrNull(
                                                                      5)) !=
                                                              '0'))
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                listViewHorariosRow
                                                                    ?.horaAbertura
                                                                    ?.elementAtOrNull(
                                                                        5),
                                                                '00:00',
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
                                                            Text(
                                                              '-',
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
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                listViewHorariosRow
                                                                    ?.horaFechamento
                                                                    ?.elementAtOrNull(
                                                                        5),
                                                                '00:00',
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
                                                          ],
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              if (_model.statusSex == true)
                                                Icon(
                                                  Icons.keyboard_arrow_right,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 24.0,
                                                ),
                                              if (_model.statusSex == false)
                                                Icon(
                                                  Icons.keyboard_arrow_up,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 24.0,
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                if (_model.statusSex == false)
                                  Container(
                                    width: 100.0,
                                    height: 470.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 12.0, 16.0, 0.0),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Alterar Horário',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMedium
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 20.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: 290.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              'Sexta-Feira',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    fontSize:
                                                                        18.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                            FlutterFlowDropDown<
                                                                String>(
                                                              controller: _model
                                                                      .dropDownSexValueController ??=
                                                                  FormFieldController<
                                                                      String>(
                                                                _model.dropDownSexValue ??=
                                                                    listViewHorariosRow
                                                                        ?.status
                                                                        ?.elementAtOrNull(
                                                                            5),
                                                              ),
                                                              options: [
                                                                'Aberto',
                                                                'Fechado'
                                                              ],
                                                              onChanged: (val) =>
                                                                  safeSetState(() =>
                                                                      _model.dropDownSexValue =
                                                                          val),
                                                              width: 120.0,
                                                              height: 40.0,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              icon: Icon(
                                                                Icons
                                                                    .keyboard_arrow_down_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 24.0,
                                                              ),
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              elevation: 2.0,
                                                              borderColor:
                                                                  Colors.black,
                                                              borderWidth: 2.0,
                                                              borderRadius: 8.0,
                                                              margin:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                              hidesUnderline:
                                                                  true,
                                                              isOverButton:
                                                                  true,
                                                              isSearchable:
                                                                  false,
                                                              isMultiSelect:
                                                                  false,
                                                            ),
                                                          ],
                                                        ),
                                                        if (_model
                                                                .dropDownSexValue ==
                                                            'Aberto')
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: FutureBuilder<
                                                                List<SalaoRow>>(
                                                              future:
                                                                  SalaoTable()
                                                                      .queryRows(
                                                                queryFn: (q) =>
                                                                    q.inFilterOrNull(
                                                                  'id_salao',
                                                                  columnProfissionalRow
                                                                      ?.filiadoSalao,
                                                                ),
                                                              ),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          50.0,
                                                                      height:
                                                                          50.0,
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        valueColor:
                                                                            AlwaysStoppedAnimation<Color>(
                                                                          FlutterFlowTheme.of(context)
                                                                              .chamoisee,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                List<SalaoRow>
                                                                    radioButtonSalaoRowList =
                                                                    snapshot
                                                                        .data!;

                                                                return FlutterFlowRadioButton(
                                                                  options: radioButtonSalaoRowList
                                                                      .map((e) =>
                                                                          e.nome)
                                                                      .toList(),
                                                                  onChanged:
                                                                      (val) async {
                                                                    safeSetState(
                                                                        () {});
                                                                    logFirebaseEvent(
                                                                        'PROFISSIONAL_HORARIOS_RadioButton_lvq7md');
                                                                    logFirebaseEvent(
                                                                        'RadioButton_update_page_state');
                                                                    _model
                                                                        .updateLocalTrabalhoAtIndex(
                                                                      5,
                                                                      (_) => valueOrDefault<
                                                                          String>(
                                                                        _model
                                                                            .radioButtonValue6,
                                                                        '0',
                                                                      ),
                                                                    );
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  controller: _model
                                                                      .radioButtonValueController6 ??= FormFieldController<
                                                                          String>(
                                                                      listViewHorariosRow!
                                                                          .localTrabalho
                                                                          .elementAtOrNull(
                                                                              5)!),
                                                                  optionHeight:
                                                                      32.0,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  selectedTextStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  buttonPosition:
                                                                      RadioButtonPosition
                                                                          .left,
                                                                  direction: Axis
                                                                      .horizontal,
                                                                  radioButtonColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                  inactiveRadioButtonColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                  toggleable:
                                                                      true,
                                                                  horizontalAlignment:
                                                                      WrapAlignment
                                                                          .start,
                                                                  verticalAlignment:
                                                                      WrapCrossAlignment
                                                                          .start,
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        if (_model
                                                                .dropDownSexValue ==
                                                            'Aberto')
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        20.0,
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
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'Horário Abertura',
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
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            150.0,
                                                                        child:
                                                                            TextFormField(
                                                                          controller: _model.sexInicialTextController ??=
                                                                              TextEditingController(
                                                                            text: (listViewHorariosRow?.horaAbertura?.elementAtOrNull(5)) == '0'
                                                                                ? null
                                                                                : (listViewHorariosRow?.horaAbertura?.elementAtOrNull(5)),
                                                                          ),
                                                                          focusNode:
                                                                              _model.sexInicialFocusNode,
                                                                          autofocus:
                                                                              true,
                                                                          obscureText:
                                                                              false,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            labelText:
                                                                                'EX: 09:00',
                                                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x80000000),
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Readex Pro',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          validator: _model
                                                                              .sexInicialTextControllerValidator
                                                                              .asValidator(context),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'Horário Encerramento',
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
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            150.0,
                                                                        child:
                                                                            TextFormField(
                                                                          controller: _model.sexFinalTextController ??=
                                                                              TextEditingController(
                                                                            text: (listViewHorariosRow?.horaFechamento?.elementAtOrNull(5)) == '0'
                                                                                ? null
                                                                                : (listViewHorariosRow?.horaFechamento?.elementAtOrNull(5)),
                                                                          ),
                                                                          focusNode:
                                                                              _model.sexFinalFocusNode,
                                                                          autofocus:
                                                                              true,
                                                                          obscureText:
                                                                              false,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            labelText:
                                                                                'EX: 19:00',
                                                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x80000000),
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Readex Pro',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          validator: _model
                                                                              .sexFinalTextControllerValidator
                                                                              .asValidator(context),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        if (_model
                                                                .dropDownSexValue ==
                                                            'Aberto')
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        20.0,
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
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'Início do Intervalo',
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
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            150.0,
                                                                        child:
                                                                            TextFormField(
                                                                          controller: _model.sexInterInicialTextController ??=
                                                                              TextEditingController(
                                                                            text: (listViewHorariosRow?.intervaloInicio?.elementAtOrNull(5)) == '0'
                                                                                ? null
                                                                                : (listViewHorariosRow?.intervaloInicio?.elementAtOrNull(5)),
                                                                          ),
                                                                          focusNode:
                                                                              _model.sexInterInicialFocusNode,
                                                                          autofocus:
                                                                              true,
                                                                          obscureText:
                                                                              false,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            labelText:
                                                                                'EX: 09:00',
                                                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x80000000),
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Readex Pro',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          validator: _model
                                                                              .sexInterInicialTextControllerValidator
                                                                              .asValidator(context),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'Fim do Intervalo',
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
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            150.0,
                                                                        child:
                                                                            TextFormField(
                                                                          controller: _model.sexInterFinalTextController ??=
                                                                              TextEditingController(
                                                                            text: (listViewHorariosRow?.intervaloFinal?.elementAtOrNull(5)) == '0'
                                                                                ? null
                                                                                : (listViewHorariosRow?.intervaloFinal?.elementAtOrNull(5)),
                                                                          ),
                                                                          focusNode:
                                                                              _model.sexInterFinalFocusNode,
                                                                          autofocus:
                                                                              true,
                                                                          obscureText:
                                                                              false,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            labelText:
                                                                                'EX: 19:00',
                                                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x80000000),
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Readex Pro',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          validator: _model
                                                                              .sexInterFinalTextControllerValidator
                                                                              .asValidator(context),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
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
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 15.0, 0.0, 0.0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'PROFISSIONAL_HORARIOS_SALVAR_BTN_ON_TAP');
                                                    if (_model
                                                            .dropDownSexValue ==
                                                        'Aberto') {
                                                      if (functions.horarioFormatoProf(
                                                          _model
                                                              .sexInicialTextController
                                                              .text,
                                                          _model
                                                              .sexFinalTextController
                                                              .text,
                                                          _model
                                                              .sexInterInicialTextController
                                                              .text,
                                                          _model
                                                              .sexInterFinalTextController
                                                              .text)) {
                                                        logFirebaseEvent(
                                                            'Button_update_page_state');
                                                        _model
                                                            .updateListaHoraInicialAtIndex(
                                                          5,
                                                          (_) => _model
                                                              .sexInicialTextController
                                                              .text,
                                                        );
                                                        _model
                                                            .updateListaHoraFinalAtIndex(
                                                          5,
                                                          (_) => _model
                                                              .sexFinalTextController
                                                              .text,
                                                        );
                                                        _model
                                                            .updateListaStatusAtIndex(
                                                          5,
                                                          (_) => _model
                                                              .dropDownSexValue!,
                                                        );
                                                        _model
                                                            .updateIntervaloInicioAtIndex(
                                                          5,
                                                          (_) => _model
                                                              .sexInterInicialTextController
                                                              .text,
                                                        );
                                                        _model
                                                            .updateIntervaloFinalAtIndex(
                                                          5,
                                                          (_) => _model
                                                              .sexInterFinalTextController
                                                              .text,
                                                        );
                                                        _model
                                                            .updateLocalTrabalhoAtIndex(
                                                          5,
                                                          (_) => valueOrDefault<
                                                              String>(
                                                            _model
                                                                .radioButtonValue6,
                                                            '0',
                                                          ),
                                                        );
                                                        safeSetState(() {});
                                                        logFirebaseEvent(
                                                            'Button_backend_call');
                                                        await HorariosTable()
                                                            .update(
                                                          data: {
                                                            'status': _model
                                                                .listaStatus,
                                                            'hora_abertura': _model
                                                                .listaHoraInicial,
                                                            'hora_fechamento':
                                                                _model
                                                                    .listaHoraFinal,
                                                            'intervalo_inicio':
                                                                _model
                                                                    .intervaloInicio,
                                                            'intervalo_final':
                                                                _model
                                                                    .intervaloFinal,
                                                            'local_trabalho':
                                                                _model
                                                                    .localTrabalho,
                                                          },
                                                          matchingRows:
                                                              (rows) =>
                                                                  rows.eqOrNull(
                                                            'id_horario',
                                                            currentUserUid,
                                                          ),
                                                        );
                                                        logFirebaseEvent(
                                                            'Button_update_page_state');
                                                        _model.statusSex = true;
                                                        safeSetState(() {});
                                                        logFirebaseEvent(
                                                            'Button_refresh_database_request');
                                                        safeSetState(() => _model
                                                                .requestCompleter =
                                                            null);
                                                        await _model
                                                            .waitForRequestCompleted();
                                                      } else {
                                                        logFirebaseEvent(
                                                            'Button_show_snack_bar');
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'Horário em formato Inválido',
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    2000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                          ),
                                                        );
                                                      }
                                                    } else {
                                                      logFirebaseEvent(
                                                          'Button_update_page_state');
                                                      _model
                                                          .updateListaHoraInicialAtIndex(
                                                        5,
                                                        (_) => '0',
                                                      );
                                                      _model
                                                          .updateListaHoraFinalAtIndex(
                                                        5,
                                                        (_) => '0',
                                                      );
                                                      _model
                                                          .updateListaStatusAtIndex(
                                                        5,
                                                        (_) => _model
                                                            .dropDownSexValue!,
                                                      );
                                                      _model
                                                          .updateIntervaloInicioAtIndex(
                                                        5,
                                                        (_) => '0',
                                                      );
                                                      _model
                                                          .updateIntervaloFinalAtIndex(
                                                        5,
                                                        (_) => '0',
                                                      );
                                                      _model
                                                          .updateLocalTrabalhoAtIndex(
                                                        5,
                                                        (_) => '0',
                                                      );
                                                      safeSetState(() {});
                                                      logFirebaseEvent(
                                                          'Button_backend_call');
                                                      await HorariosTable()
                                                          .update(
                                                        data: {
                                                          'status': _model
                                                              .listaStatus,
                                                          'hora_abertura': _model
                                                              .listaHoraInicial,
                                                          'hora_fechamento':
                                                              _model
                                                                  .listaHoraFinal,
                                                          'intervalo_inicio':
                                                              _model
                                                                  .intervaloInicio,
                                                          'intervalo_final':
                                                              _model
                                                                  .intervaloFinal,
                                                          'local_trabalho':
                                                              _model
                                                                  .localTrabalho,
                                                        },
                                                        matchingRows: (rows) =>
                                                            rows.eqOrNull(
                                                          'id_horario',
                                                          currentUserUid,
                                                        ),
                                                      );
                                                      logFirebaseEvent(
                                                          'Button_update_page_state');
                                                      _model.statusSex = true;
                                                      safeSetState(() {});
                                                      logFirebaseEvent(
                                                          'Button_refresh_database_request');
                                                      safeSetState(() => _model
                                                              .requestCompleter =
                                                          null);
                                                      await _model
                                                          .waitForRequestCompleted();
                                                    }
                                                  },
                                                  text: 'Salvar',
                                                  options: FFButtonOptions(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.9,
                                                    height: 40.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    elevation: 3.0,
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 0.0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'PROFISSIONAL_HORARIOS_CANCELAR_BTN_ON_TA');
                                                    logFirebaseEvent(
                                                        'Button_refresh_database_request');
                                                    safeSetState(() => _model
                                                            .requestCompleter =
                                                        null);
                                                    await _model
                                                        .waitForRequestCompleted();
                                                    logFirebaseEvent(
                                                        'Button_update_page_state');
                                                    _model.statusSex = true;
                                                    safeSetState(() {});
                                                  },
                                                  text: 'Cancelar',
                                                  options: FFButtonOptions(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.9,
                                                    height: 40.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    elevation: 3.0,
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 1.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'PROFISSIONAL_HORARIOS_PAGE_Sabado_ON_TAP');
                                        if (_model.statusSab == false) {
                                          logFirebaseEvent(
                                              'Sabado_update_page_state');
                                          _model.statusSab = true;
                                          safeSetState(() {});
                                        } else {
                                          logFirebaseEvent(
                                              'Sabado_update_page_state');
                                          _model.statusSab = false;
                                          safeSetState(() {});
                                        }
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 0.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              offset: Offset(
                                                0.0,
                                                1.0,
                                              ),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 12.0, 16.0, 12.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 12.0, 0.0),
                                                  child: Text(
                                                    'Sábado',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.47,
                                                  height: 40.0,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.rectangle,
                                                  ),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    15.0,
                                                                    0.0),
                                                        child: Container(
                                                          width: 70.0,
                                                          height: 30.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: (listViewHorariosRow
                                                                        ?.status
                                                                        ?.elementAtOrNull(
                                                                            6)) ==
                                                                    'Fechado'
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .error
                                                                : Color(
                                                                    0xFF80E34D),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Text(
                                                              (listViewHorariosRow
                                                                          ?.status
                                                                          ?.elementAtOrNull(
                                                                              6)) ==
                                                                      'Fechado'
                                                                  ? 'Fechado'
                                                                  : 'Aberto',
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
                                                      ),
                                                      if (((listViewHorariosRow
                                                                  ?.horaAbertura
                                                                  ?.elementAtOrNull(
                                                                      6)) !=
                                                              '0') &&
                                                          ((listViewHorariosRow
                                                                  ?.horaFechamento
                                                                  ?.elementAtOrNull(
                                                                      6)) !=
                                                              '0'))
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                listViewHorariosRow
                                                                    ?.horaAbertura
                                                                    ?.elementAtOrNull(
                                                                        6),
                                                                '00:00',
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
                                                            Text(
                                                              '-',
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
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                listViewHorariosRow
                                                                    ?.horaFechamento
                                                                    ?.elementAtOrNull(
                                                                        6),
                                                                '00:00',
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
                                                          ],
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              if (_model.statusSab == true)
                                                Icon(
                                                  Icons.keyboard_arrow_right,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 24.0,
                                                ),
                                              if (_model.statusSab == false)
                                                Icon(
                                                  Icons.keyboard_arrow_up,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 24.0,
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                if (_model.statusSab == false)
                                  Container(
                                    width: 100.0,
                                    height: 470.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 12.0, 16.0, 0.0),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Alterar Horário',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMedium
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 20.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: 290.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              'Sábado',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    fontSize:
                                                                        18.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                            FlutterFlowDropDown<
                                                                String>(
                                                              controller: _model
                                                                      .dropDownSabValueController ??=
                                                                  FormFieldController<
                                                                      String>(
                                                                _model.dropDownSabValue ??=
                                                                    listViewHorariosRow
                                                                        ?.status
                                                                        ?.elementAtOrNull(
                                                                            6),
                                                              ),
                                                              options: [
                                                                'Aberto',
                                                                'Fechado'
                                                              ],
                                                              onChanged: (val) =>
                                                                  safeSetState(() =>
                                                                      _model.dropDownSabValue =
                                                                          val),
                                                              width: 120.0,
                                                              height: 40.0,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              icon: Icon(
                                                                Icons
                                                                    .keyboard_arrow_down_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 24.0,
                                                              ),
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              elevation: 2.0,
                                                              borderColor:
                                                                  Colors.black,
                                                              borderWidth: 2.0,
                                                              borderRadius: 8.0,
                                                              margin:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                              hidesUnderline:
                                                                  true,
                                                              isOverButton:
                                                                  true,
                                                              isSearchable:
                                                                  false,
                                                              isMultiSelect:
                                                                  false,
                                                            ),
                                                          ],
                                                        ),
                                                        if (_model
                                                                .dropDownSabValue ==
                                                            'Aberto')
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: FutureBuilder<
                                                                List<SalaoRow>>(
                                                              future:
                                                                  SalaoTable()
                                                                      .queryRows(
                                                                queryFn: (q) =>
                                                                    q.inFilterOrNull(
                                                                  'id_salao',
                                                                  columnProfissionalRow
                                                                      ?.filiadoSalao,
                                                                ),
                                                              ),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          50.0,
                                                                      height:
                                                                          50.0,
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        valueColor:
                                                                            AlwaysStoppedAnimation<Color>(
                                                                          FlutterFlowTheme.of(context)
                                                                              .chamoisee,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                List<SalaoRow>
                                                                    radioButtonSalaoRowList =
                                                                    snapshot
                                                                        .data!;

                                                                return FlutterFlowRadioButton(
                                                                  options: radioButtonSalaoRowList
                                                                      .map((e) =>
                                                                          e.nome)
                                                                      .toList(),
                                                                  onChanged:
                                                                      (val) async {
                                                                    safeSetState(
                                                                        () {});
                                                                    logFirebaseEvent(
                                                                        'PROFISSIONAL_HORARIOS_RadioButton_djudgp');
                                                                    logFirebaseEvent(
                                                                        'RadioButton_update_page_state');
                                                                    _model
                                                                        .updateLocalTrabalhoAtIndex(
                                                                      6,
                                                                      (_) => valueOrDefault<
                                                                          String>(
                                                                        _model
                                                                            .radioButtonValue7,
                                                                        '0',
                                                                      ),
                                                                    );
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  controller: _model
                                                                      .radioButtonValueController7 ??= FormFieldController<
                                                                          String>(
                                                                      listViewHorariosRow!
                                                                          .localTrabalho
                                                                          .elementAtOrNull(
                                                                              6)!),
                                                                  optionHeight:
                                                                      32.0,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  selectedTextStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  buttonPosition:
                                                                      RadioButtonPosition
                                                                          .left,
                                                                  direction: Axis
                                                                      .horizontal,
                                                                  radioButtonColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                  inactiveRadioButtonColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                  toggleable:
                                                                      true,
                                                                  horizontalAlignment:
                                                                      WrapAlignment
                                                                          .start,
                                                                  verticalAlignment:
                                                                      WrapCrossAlignment
                                                                          .start,
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        if (_model
                                                                .dropDownSabValue ==
                                                            'Aberto')
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        20.0,
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
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'Horário Abertura',
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
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            150.0,
                                                                        child:
                                                                            TextFormField(
                                                                          controller: _model.sabInicialTextController ??=
                                                                              TextEditingController(
                                                                            text: (listViewHorariosRow?.horaAbertura?.elementAtOrNull(6)) == '0'
                                                                                ? null
                                                                                : (listViewHorariosRow?.horaAbertura?.elementAtOrNull(6)),
                                                                          ),
                                                                          focusNode:
                                                                              _model.sabInicialFocusNode,
                                                                          autofocus:
                                                                              true,
                                                                          obscureText:
                                                                              false,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            labelText:
                                                                                'EX: 09:00',
                                                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x80000000),
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Readex Pro',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          validator: _model
                                                                              .sabInicialTextControllerValidator
                                                                              .asValidator(context),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'Horário Encerramento',
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
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            150.0,
                                                                        child:
                                                                            TextFormField(
                                                                          controller: _model.sabFinalTextController ??=
                                                                              TextEditingController(
                                                                            text: (listViewHorariosRow?.horaFechamento?.elementAtOrNull(6)) == '0'
                                                                                ? null
                                                                                : (listViewHorariosRow?.horaFechamento?.elementAtOrNull(6)),
                                                                          ),
                                                                          focusNode:
                                                                              _model.sabFinalFocusNode,
                                                                          autofocus:
                                                                              true,
                                                                          obscureText:
                                                                              false,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            labelText:
                                                                                'EX: 19:00',
                                                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x80000000),
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Readex Pro',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          validator: _model
                                                                              .sabFinalTextControllerValidator
                                                                              .asValidator(context),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        if (_model
                                                                .dropDownSabValue ==
                                                            'Aberto')
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        20.0,
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
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'Início do Intervalo',
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
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            150.0,
                                                                        child:
                                                                            TextFormField(
                                                                          controller: _model.sabInterInicialTextController ??=
                                                                              TextEditingController(
                                                                            text: (listViewHorariosRow?.intervaloInicio?.elementAtOrNull(6)) == '0'
                                                                                ? null
                                                                                : (listViewHorariosRow?.intervaloInicio?.elementAtOrNull(6)),
                                                                          ),
                                                                          focusNode:
                                                                              _model.sabInterInicialFocusNode,
                                                                          autofocus:
                                                                              true,
                                                                          obscureText:
                                                                              false,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            labelText:
                                                                                'EX: 09:00',
                                                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x80000000),
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Readex Pro',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          validator: _model
                                                                              .sabInterInicialTextControllerValidator
                                                                              .asValidator(context),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'Fim do Intervalo',
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
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            150.0,
                                                                        child:
                                                                            TextFormField(
                                                                          controller: _model.sabInterFinalTextController ??=
                                                                              TextEditingController(
                                                                            text: (listViewHorariosRow?.intervaloFinal?.elementAtOrNull(6)) == '0'
                                                                                ? null
                                                                                : (listViewHorariosRow?.intervaloFinal?.elementAtOrNull(6)),
                                                                          ),
                                                                          focusNode:
                                                                              _model.sabInterFinalFocusNode,
                                                                          autofocus:
                                                                              true,
                                                                          obscureText:
                                                                              false,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            labelText:
                                                                                'EX: 19:00',
                                                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x80000000),
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Readex Pro',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          validator: _model
                                                                              .sabInterFinalTextControllerValidator
                                                                              .asValidator(context),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
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
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 15.0, 0.0, 0.0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'PROFISSIONAL_HORARIOS_SALVAR_BTN_ON_TAP');
                                                    if (_model
                                                            .dropDownSabValue ==
                                                        'Aberto') {
                                                      if (functions.horarioFormatoProf(
                                                          _model
                                                              .sabInicialTextController
                                                              .text,
                                                          _model
                                                              .sabFinalTextController
                                                              .text,
                                                          _model
                                                              .sabInterInicialTextController
                                                              .text,
                                                          _model
                                                              .sabInterFinalTextController
                                                              .text)) {
                                                        logFirebaseEvent(
                                                            'Button_update_page_state');
                                                        _model
                                                            .updateListaHoraInicialAtIndex(
                                                          6,
                                                          (_) => _model
                                                              .sabInicialTextController
                                                              .text,
                                                        );
                                                        _model
                                                            .updateListaHoraFinalAtIndex(
                                                          6,
                                                          (_) => _model
                                                              .sabFinalTextController
                                                              .text,
                                                        );
                                                        _model
                                                            .updateListaStatusAtIndex(
                                                          6,
                                                          (_) => _model
                                                              .dropDownSabValue!,
                                                        );
                                                        _model
                                                            .updateIntervaloInicioAtIndex(
                                                          6,
                                                          (_) => _model
                                                              .sabInterInicialTextController
                                                              .text,
                                                        );
                                                        _model
                                                            .updateIntervaloFinalAtIndex(
                                                          6,
                                                          (_) => _model
                                                              .sabInterFinalTextController
                                                              .text,
                                                        );
                                                        _model
                                                            .updateLocalTrabalhoAtIndex(
                                                          6,
                                                          (_) => valueOrDefault<
                                                              String>(
                                                            _model
                                                                .radioButtonValue7,
                                                            '0',
                                                          ),
                                                        );
                                                        safeSetState(() {});
                                                        logFirebaseEvent(
                                                            'Button_backend_call');
                                                        await HorariosTable()
                                                            .update(
                                                          data: {
                                                            'status': _model
                                                                .listaStatus,
                                                            'hora_abertura': _model
                                                                .listaHoraInicial,
                                                            'hora_fechamento':
                                                                _model
                                                                    .listaHoraFinal,
                                                            'intervalo_inicio':
                                                                _model
                                                                    .intervaloInicio,
                                                            'intervalo_final':
                                                                _model
                                                                    .intervaloFinal,
                                                            'local_trabalho':
                                                                _model
                                                                    .localTrabalho,
                                                          },
                                                          matchingRows:
                                                              (rows) =>
                                                                  rows.eqOrNull(
                                                            'id_horario',
                                                            currentUserUid,
                                                          ),
                                                        );
                                                        logFirebaseEvent(
                                                            'Button_update_page_state');
                                                        _model.statusSab = true;
                                                        safeSetState(() {});
                                                        logFirebaseEvent(
                                                            'Button_refresh_database_request');
                                                        safeSetState(() => _model
                                                                .requestCompleter =
                                                            null);
                                                        await _model
                                                            .waitForRequestCompleted();
                                                      } else {
                                                        logFirebaseEvent(
                                                            'Button_show_snack_bar');
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'Horário em formato Inválido',
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    2000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                          ),
                                                        );
                                                      }
                                                    } else {
                                                      logFirebaseEvent(
                                                          'Button_update_page_state');
                                                      _model
                                                          .updateListaHoraInicialAtIndex(
                                                        6,
                                                        (_) => '0',
                                                      );
                                                      _model
                                                          .updateListaHoraFinalAtIndex(
                                                        6,
                                                        (_) => '0',
                                                      );
                                                      _model
                                                          .updateListaStatusAtIndex(
                                                        6,
                                                        (_) => _model
                                                            .dropDownSabValue!,
                                                      );
                                                      _model
                                                          .updateIntervaloInicioAtIndex(
                                                        6,
                                                        (_) => '0',
                                                      );
                                                      _model
                                                          .updateIntervaloFinalAtIndex(
                                                        6,
                                                        (_) => '0',
                                                      );
                                                      _model
                                                          .updateLocalTrabalhoAtIndex(
                                                        6,
                                                        (_) => '0',
                                                      );
                                                      safeSetState(() {});
                                                      logFirebaseEvent(
                                                          'Button_backend_call');
                                                      await HorariosTable()
                                                          .update(
                                                        data: {
                                                          'status': _model
                                                              .listaStatus,
                                                          'hora_abertura': _model
                                                              .listaHoraInicial,
                                                          'hora_fechamento':
                                                              _model
                                                                  .listaHoraFinal,
                                                          'intervalo_inicio':
                                                              _model
                                                                  .intervaloInicio,
                                                          'intervalo_final':
                                                              _model
                                                                  .intervaloFinal,
                                                          'local_trabalho':
                                                              _model
                                                                  .localTrabalho,
                                                        },
                                                        matchingRows: (rows) =>
                                                            rows.eqOrNull(
                                                          'id_horario',
                                                          currentUserUid,
                                                        ),
                                                      );
                                                      logFirebaseEvent(
                                                          'Button_update_page_state');
                                                      _model.statusSab = true;
                                                      safeSetState(() {});
                                                      logFirebaseEvent(
                                                          'Button_refresh_database_request');
                                                      safeSetState(() => _model
                                                              .requestCompleter =
                                                          null);
                                                      await _model
                                                          .waitForRequestCompleted();
                                                    }
                                                  },
                                                  text: 'Salvar',
                                                  options: FFButtonOptions(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.9,
                                                    height: 40.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    elevation: 3.0,
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 0.0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'PROFISSIONAL_HORARIOS_CANCELAR_BTN_ON_TA');
                                                    logFirebaseEvent(
                                                        'Button_refresh_database_request');
                                                    safeSetState(() => _model
                                                            .requestCompleter =
                                                        null);
                                                    await _model
                                                        .waitForRequestCompleted();
                                                    logFirebaseEvent(
                                                        'Button_update_page_state');
                                                    _model.statusSab = true;
                                                    safeSetState(() {});
                                                  },
                                                  text: 'Cancelar',
                                                  options: FFButtonOptions(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.9,
                                                    height: 40.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    elevation: 3.0,
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
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
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 400.0),
                      child: StickyHeader(
                        overlapHeaders: false,
                        header: Container(),
                        content: Container(
                          width: double.infinity,
                          constraints: BoxConstraints(
                            maxWidth: 430.0,
                          ),
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(0.0),
                          ),
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
  }
}
