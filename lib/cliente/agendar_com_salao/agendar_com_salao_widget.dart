import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/componentes/prof_disponiveis/prof_disponiveis_widget.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'agendar_com_salao_model.dart';
export 'agendar_com_salao_model.dart';

class AgendarComSalaoWidget extends StatefulWidget {
  const AgendarComSalaoWidget({
    super.key,
    this.refSalao,
    required this.refServico,
  });

  final String? refSalao;
  final String? refServico;

  @override
  State<AgendarComSalaoWidget> createState() => _AgendarComSalaoWidgetState();
}

class _AgendarComSalaoWidgetState extends State<AgendarComSalaoWidget>
    with TickerProviderStateMixin {
  late AgendarComSalaoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AgendarComSalaoModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'AgendarComSalao'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('AGENDAR_COM_SALAO_AgendarComSalao_ON_INI');
      logFirebaseEvent('AgendarComSalao_backend_call');
      _model.horariosSalao = await HorariosTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'id_horario',
          widget!.refSalao,
        ),
      );
      logFirebaseEvent('AgendarComSalao_backend_call');
      _model.todosHorarios = await HorariosTable().queryRows(
        queryFn: (q) => q,
      );
      // DataSemana
      logFirebaseEvent('AgendarComSalao_DataSemana');
      _model.diaSemana = functions.verificaDiaSemana(getCurrentTimestamp);
      safeSetState(() {});
      // StatusDia
      logFirebaseEvent('AgendarComSalao_StatusDia');
      _model.statusDia = _model.horariosSalao
          ?.elementAtOrNull(0)
          ?.status
          ?.elementAtOrNull(_model.diaSemana!);
      safeSetState(() {});
      if (_model.statusDia == 'Aberto') {
        // HoraInicio
        logFirebaseEvent('AgendarComSalao_HoraInicio');
        _model.horaInicio = _model.horariosSalao
            ?.elementAtOrNull(0)
            ?.horaAbertura
            ?.elementAtOrNull(_model.diaSemana!);
        safeSetState(() {});
        // HoraFim
        logFirebaseEvent('AgendarComSalao_HoraFim');
        _model.horaFim = _model.horariosSalao
            ?.elementAtOrNull(0)
            ?.horaFechamento
            ?.elementAtOrNull(_model.diaSemana!);
        safeSetState(() {});
        logFirebaseEvent('AgendarComSalao_action_block');
        await _model.buscarHoras(context);
        safeSetState(() {});
      }
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<List<HorariosRow>>(
      future: HorariosTable().querySingleRow(
        queryFn: (q) => q.eqOrNull(
          'id_horario',
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
        List<HorariosRow> agendarComSalaoHorariosRowList = snapshot.data!;

        final agendarComSalaoHorariosRow =
            agendarComSalaoHorariosRowList.isNotEmpty
                ? agendarComSalaoHorariosRowList.first
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
                  logFirebaseEvent('AGENDAR_COM_SALAO_arrow_back_rounded_ICN');
                  logFirebaseEvent('IconButton_navigate_back');
                  context.pop();
                  logFirebaseEvent('IconButton_update_app_state');
                  FFAppState().ProfEscolhido = '';
                  safeSetState(() {});
                },
              ),
              title: Text(
                'Agendamento',
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
              child: FutureBuilder<List<ServicosRow>>(
                future: ServicosTable().querySingleRow(
                  queryFn: (q) => q.eqOrNull(
                    'id_servico',
                    widget!.refServico,
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
                  List<ServicosRow> columnServicosRowList = snapshot.data!;

                  final columnServicosRow = columnServicosRowList.isNotEmpty
                      ? columnServicosRowList.first
                      : null;

                  return SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, -1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 15.0, 15.0, 15.0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.9,
                                    height: 295.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context).dun,
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        FlutterFlowCalendar(
                                          color: FlutterFlowTheme.of(context)
                                              .chamoisee,
                                          iconColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          weekFormat: false,
                                          weekStartsMonday: false,
                                          initialDate: getCurrentTimestamp,
                                          rowHeight: 40.0,
                                          onChange: (DateTimeRange?
                                              newSelectedDate) async {
                                            if (_model.calendarSelectedDay ==
                                                newSelectedDate) {
                                              return;
                                            }
                                            _model.calendarSelectedDay =
                                                newSelectedDate;
                                            logFirebaseEvent(
                                                'AGENDAR_COM_SALAO_Calendar_nyyilz11_ON_D');
                                            logFirebaseEvent(
                                                'Calendar_update_page_state');
                                            _model.horaClicada = null;
                                            _model.fimAgendamento = null;
                                            safeSetState(() {});
                                            logFirebaseEvent(
                                                'Calendar_update_app_state');
                                            FFAppState().ProfEscolhido = '';
                                            safeSetState(() {});
                                            if (functions.verificarDiaCalendario(
                                                    _model.calendarSelectedDay!
                                                        .start) ==
                                                true) {
                                              // DataSemana
                                              logFirebaseEvent(
                                                  'Calendar_DataSemana');
                                              _model.diaSemana = functions
                                                  .verificaDiaSemana(_model
                                                      .calendarSelectedDay!
                                                      .start);
                                              safeSetState(() {});
                                              // StatusDia
                                              logFirebaseEvent(
                                                  'Calendar_StatusDia');
                                              _model.statusDia =
                                                  agendarComSalaoHorariosRow
                                                      ?.status
                                                      ?.elementAtOrNull(
                                                          _model.diaSemana!);
                                              safeSetState(() {});
                                              if (_model.statusDia ==
                                                  'Aberto') {
                                                // HoraInicio
                                                logFirebaseEvent(
                                                    'Calendar_HoraInicio');
                                                _model.horaInicio =
                                                    agendarComSalaoHorariosRow
                                                        ?.horaAbertura
                                                        ?.elementAtOrNull(
                                                            _model.diaSemana!);
                                                safeSetState(() {});
                                                // HoraFim
                                                logFirebaseEvent(
                                                    'Calendar_HoraFim');
                                                _model.horaFim =
                                                    agendarComSalaoHorariosRow
                                                        ?.horaFechamento
                                                        ?.elementAtOrNull(
                                                            _model.diaSemana!);
                                                safeSetState(() {});
                                                logFirebaseEvent(
                                                    'Calendar_action_block');
                                                await _model
                                                    .buscarHoras(context);
                                                safeSetState(() {});
                                              }
                                            } else {
                                              // StatusDia
                                              logFirebaseEvent(
                                                  'Calendar_StatusDia');
                                              _model.statusDia = 'Fechado';
                                              safeSetState(() {});
                                              logFirebaseEvent(
                                                  'Calendar_show_snack_bar');
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Data inválida',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 2000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .error,
                                                ),
                                              );
                                            }

                                            safeSetState(() {});
                                          },
                                          titleStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleLarge
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    letterSpacing: 0.0,
                                                  ),
                                          dayOfWeekStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelLarge
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                          dateStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    letterSpacing: 0.0,
                                                  ),
                                          selectedDateStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    letterSpacing: 0.0,
                                                  ),
                                          inactiveDateStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 0.0, 15.0, 0.0),
                          child: FutureBuilder<List<SalaoRow>>(
                            future: SalaoTable().querySingleRow(
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
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).chamoisee,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              List<SalaoRow> columnSalaoRowList =
                                  snapshot.data!;

                              final columnSalaoRow =
                                  columnSalaoRowList.isNotEmpty
                                      ? columnSalaoRowList.first
                                      : null;

                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 250.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment: Alignment(0.0, 0),
                                          child: FlutterFlowButtonTabBar(
                                            useToggleButtonStyle: true,
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      letterSpacing: 0.0,
                                                    ),
                                            unselectedLabelStyle: TextStyle(),
                                            labelColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            unselectedLabelColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .chamoisee,
                                            unselectedBackgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .customColor2,
                                            unselectedBorderColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                            borderWidth: 2.0,
                                            borderRadius: 8.0,
                                            elevation: 0.0,
                                            buttonMargin:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 8.0, 0.0),
                                            tabs: [
                                              Tab(
                                                text: 'Manhã',
                                              ),
                                              Tab(
                                                text: 'Tarde',
                                              ),
                                              Tab(
                                                text: 'Noite',
                                              ),
                                            ],
                                            controller: _model.tabBarController,
                                            onTap: (i) async {
                                              [
                                                () async {},
                                                () async {},
                                                () async {}
                                              ][i]();
                                            },
                                          ),
                                        ),
                                        Expanded(
                                          child: TabBarView(
                                            controller: _model.tabBarController,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 5.0, 0.0, 0.0),
                                                child: Container(
                                                  width: 100.0,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .dun,
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      if ((_model.statusDia ==
                                                              'Aberto') &&
                                                          (functions
                                                                  .gerarHorarios(
                                                                      columnServicosRow!
                                                                          .idProf
                                                                          .toList(),
                                                                      _model
                                                                          .calendarSelectedDay!
                                                                          .start,
                                                                      _model.horasAgendadas
                                                                          .toList(),
                                                                      functions.atualizarHorario(
                                                                          _model
                                                                              .calendarSelectedDay!
                                                                              .start,
                                                                          agendarComSalaoHorariosRow!.horaAbertura.elementAtOrNull(_model
                                                                              .diaSemana!)!)!,
                                                                      functions.atualizarHorario(
                                                                          _model
                                                                              .calendarSelectedDay!
                                                                              .start,
                                                                          agendarComSalaoHorariosRow!.horaFechamento.elementAtOrNull(_model
                                                                              .diaSemana!)!)!,
                                                                      _model
                                                                          .todosHorarios
                                                                          ?.toList(),
                                                                      columnServicosRow!
                                                                          .tempo!,
                                                                      columnSalaoRow!
                                                                          .nome)
                                                                  ?.length !=
                                                              0))
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        10.0,
                                                                        10.0,
                                                                        10.0),
                                                            child: Builder(
                                                              builder:
                                                                  (context) {
                                                                final horas = functions
                                                                        .gerarHorarios(
                                                                            columnServicosRow!.idProf
                                                                                .toList(),
                                                                            _model
                                                                                .calendarSelectedDay!.start,
                                                                            _model.horasAgendadas
                                                                                .toList(),
                                                                            functions.atualizarHorario(_model.calendarSelectedDay!.start,
                                                                                agendarComSalaoHorariosRow!.horaAbertura.elementAtOrNull(_model.diaSemana!)!)!,
                                                                            functions.atualizarHorario(_model.calendarSelectedDay!.start, agendarComSalaoHorariosRow!.horaFechamento.elementAtOrNull(_model.diaSemana!)!)!,
                                                                            _model.todosHorarios?.toList(),
                                                                            columnServicosRow!.tempo!,
                                                                            columnSalaoRow!.nome)
                                                                        ?.map((e) => e)
                                                                        .toList()
                                                                        ?.where((e) => e.secondsSinceEpoch < functions.atualizarHorario(_model.calendarSelectedDay!.start, '12:00')!.secondsSinceEpoch)
                                                                        .toList()
                                                                        ?.toList() ??
                                                                    [];

                                                                return GridView
                                                                    .builder(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  gridDelegate:
                                                                      SliverGridDelegateWithFixedCrossAxisCount(
                                                                    crossAxisCount:
                                                                        6,
                                                                    crossAxisSpacing:
                                                                        10.0,
                                                                    mainAxisSpacing:
                                                                        10.0,
                                                                    childAspectRatio:
                                                                        1.0,
                                                                  ),
                                                                  scrollDirection:
                                                                      Axis.vertical,
                                                                  itemCount: horas
                                                                      .length,
                                                                  itemBuilder:
                                                                      (context,
                                                                          horasIndex) {
                                                                    final horasItem =
                                                                        horas[
                                                                            horasIndex];
                                                                    return InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'AGENDAR_COM_SALAO_Container_o8c4a3y4_ON_');
                                                                        logFirebaseEvent(
                                                                            'Container_update_page_state');
                                                                        _model.horaClicada =
                                                                            horasItem;
                                                                        safeSetState(
                                                                            () {});
                                                                        logFirebaseEvent(
                                                                            'Container_update_page_state');
                                                                        _model.fimAgendamento = functions.horarioFinalAgendamento(
                                                                            _model.horaClicada!,
                                                                            columnServicosRow!.tempo!);
                                                                        safeSetState(
                                                                            () {});
                                                                        logFirebaseEvent(
                                                                            'Container_update_app_state');
                                                                        FFAppState().ProfEscolhido =
                                                                            '';
                                                                        safeSetState(
                                                                            () {});
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            60.0,
                                                                        height:
                                                                            60.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          borderRadius:
                                                                              BorderRadius.circular(10.0),
                                                                          border:
                                                                              Border.all(
                                                                            color: horasItem == _model.horaClicada
                                                                                ? FlutterFlowTheme.of(context).primary
                                                                                : Color(0x00000000),
                                                                            width:
                                                                                0.0,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Text(
                                                                              dateTimeFormat("Hm", horasItem),
                                                                              textAlign: TextAlign.center,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Readex Pro',
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                      if ((_model.statusDia ==
                                                              'Fechado') ||
                                                          (functions
                                                                  .gerarHorarios(
                                                                      columnServicosRow!
                                                                          .idProf
                                                                          .toList(),
                                                                      _model
                                                                          .calendarSelectedDay!
                                                                          .start,
                                                                      _model.horasAgendadas
                                                                          .toList(),
                                                                      functions.atualizarHorario(
                                                                          _model
                                                                              .calendarSelectedDay!
                                                                              .start,
                                                                          agendarComSalaoHorariosRow!.horaAbertura.elementAtOrNull(_model
                                                                              .diaSemana!)!)!,
                                                                      functions.atualizarHorario(
                                                                          _model
                                                                              .calendarSelectedDay!
                                                                              .start,
                                                                          agendarComSalaoHorariosRow!.horaFechamento.elementAtOrNull(_model
                                                                              .diaSemana!)!)!,
                                                                      _model
                                                                          .todosHorarios
                                                                          ?.toList(),
                                                                      columnServicosRow!
                                                                          .tempo!,
                                                                      columnSalaoRow!
                                                                          .nome)
                                                                  ?.length ==
                                                              0))
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      80.0,
                                                                      10.0,
                                                                      0.0),
                                                          child: Text(
                                                            'Não temos horários disponiveis neste turno',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  fontSize:
                                                                      20.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 5.0, 0.0, 0.0),
                                                child: Container(
                                                  width: 100.0,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .dun,
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      if ((_model.statusDia ==
                                                              'Aberto') &&
                                                          (functions
                                                                  .gerarHorarios(
                                                                      columnServicosRow!
                                                                          .idProf
                                                                          .toList(),
                                                                      _model
                                                                          .calendarSelectedDay!
                                                                          .start,
                                                                      _model.horasAgendadas
                                                                          .toList(),
                                                                      functions.atualizarHorario(
                                                                          _model
                                                                              .calendarSelectedDay!
                                                                              .start,
                                                                          agendarComSalaoHorariosRow!.horaAbertura.elementAtOrNull(_model
                                                                              .diaSemana!)!)!,
                                                                      functions.atualizarHorario(
                                                                          _model
                                                                              .calendarSelectedDay!
                                                                              .start,
                                                                          agendarComSalaoHorariosRow!.horaFechamento.elementAtOrNull(_model
                                                                              .diaSemana!)!)!,
                                                                      _model
                                                                          .todosHorarios
                                                                          ?.toList(),
                                                                      columnServicosRow!
                                                                          .tempo!,
                                                                      columnSalaoRow!
                                                                          .nome)
                                                                  ?.length !=
                                                              0))
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        10.0,
                                                                        10.0,
                                                                        10.0),
                                                            child: Builder(
                                                              builder:
                                                                  (context) {
                                                                final horas = functions
                                                                        .gerarHorarios(
                                                                            columnServicosRow!.idProf
                                                                                .toList(),
                                                                            _model
                                                                                .calendarSelectedDay!.start,
                                                                            _model.horasAgendadas
                                                                                .toList(),
                                                                            functions.atualizarHorario(_model.calendarSelectedDay!.start,
                                                                                agendarComSalaoHorariosRow!.horaAbertura.elementAtOrNull(_model.diaSemana!)!)!,
                                                                            functions.atualizarHorario(_model.calendarSelectedDay!.start, agendarComSalaoHorariosRow!.horaFechamento.elementAtOrNull(_model.diaSemana!)!)!,
                                                                            _model.todosHorarios?.toList(),
                                                                            columnServicosRow!.tempo!,
                                                                            columnSalaoRow!.nome)
                                                                        ?.map((e) => e)
                                                                        .toList()
                                                                        ?.where((e) => (e.secondsSinceEpoch >= functions.atualizarHorario(_model.calendarSelectedDay!.start, '12:00')!.secondsSinceEpoch) && (e.secondsSinceEpoch < functions.atualizarHorario(_model.calendarSelectedDay!.start, '18:00')!.secondsSinceEpoch))
                                                                        .toList()
                                                                        ?.toList() ??
                                                                    [];

                                                                return GridView
                                                                    .builder(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  gridDelegate:
                                                                      SliverGridDelegateWithFixedCrossAxisCount(
                                                                    crossAxisCount:
                                                                        6,
                                                                    crossAxisSpacing:
                                                                        10.0,
                                                                    mainAxisSpacing:
                                                                        10.0,
                                                                    childAspectRatio:
                                                                        1.0,
                                                                  ),
                                                                  scrollDirection:
                                                                      Axis.vertical,
                                                                  itemCount: horas
                                                                      .length,
                                                                  itemBuilder:
                                                                      (context,
                                                                          horasIndex) {
                                                                    final horasItem =
                                                                        horas[
                                                                            horasIndex];
                                                                    return InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'AGENDAR_COM_SALAO_Container_vkxzasx2_ON_');
                                                                        logFirebaseEvent(
                                                                            'Container_update_page_state');
                                                                        _model.horaClicada =
                                                                            horasItem;
                                                                        safeSetState(
                                                                            () {});
                                                                        logFirebaseEvent(
                                                                            'Container_update_page_state');
                                                                        _model.fimAgendamento = functions.horarioFinalAgendamento(
                                                                            _model.horaClicada!,
                                                                            columnServicosRow!.tempo!);
                                                                        safeSetState(
                                                                            () {});
                                                                        logFirebaseEvent(
                                                                            'Container_update_app_state');
                                                                        FFAppState().ProfEscolhido =
                                                                            '';
                                                                        safeSetState(
                                                                            () {});
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            60.0,
                                                                        height:
                                                                            60.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          borderRadius:
                                                                              BorderRadius.circular(10.0),
                                                                          border:
                                                                              Border.all(
                                                                            color: horasItem == _model.horaClicada
                                                                                ? FlutterFlowTheme.of(context).primary
                                                                                : Color(0x00000000),
                                                                            width:
                                                                                0.0,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Text(
                                                                              dateTimeFormat("Hm", horasItem),
                                                                              textAlign: TextAlign.center,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Readex Pro',
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                      if ((_model.statusDia ==
                                                              'Fechado') ||
                                                          (functions
                                                                  .gerarHorarios(
                                                                      columnServicosRow!
                                                                          .idProf
                                                                          .toList(),
                                                                      _model
                                                                          .calendarSelectedDay!
                                                                          .start,
                                                                      _model.horasAgendadas
                                                                          .toList(),
                                                                      functions.atualizarHorario(
                                                                          _model
                                                                              .calendarSelectedDay!
                                                                              .start,
                                                                          agendarComSalaoHorariosRow!.horaAbertura.elementAtOrNull(_model
                                                                              .diaSemana!)!)!,
                                                                      functions.atualizarHorario(
                                                                          _model
                                                                              .calendarSelectedDay!
                                                                              .start,
                                                                          agendarComSalaoHorariosRow!.horaFechamento.elementAtOrNull(_model
                                                                              .diaSemana!)!)!,
                                                                      _model
                                                                          .todosHorarios
                                                                          ?.toList(),
                                                                      columnServicosRow!
                                                                          .tempo!,
                                                                      columnSalaoRow!
                                                                          .nome)
                                                                  ?.length ==
                                                              0))
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      80.0,
                                                                      10.0,
                                                                      0.0),
                                                          child: Text(
                                                            'Não temos horários disponiveis neste turno',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  fontSize:
                                                                      20.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 5.0, 0.0, 0.0),
                                                child: Container(
                                                  width: 100.0,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .dun,
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      if ((_model.statusDia ==
                                                              'Aberto') &&
                                                          (functions
                                                                  .gerarHorarios(
                                                                      columnServicosRow!
                                                                          .idProf
                                                                          .toList(),
                                                                      _model
                                                                          .calendarSelectedDay!
                                                                          .start,
                                                                      _model.horasAgendadas
                                                                          .toList(),
                                                                      functions.atualizarHorario(
                                                                          _model
                                                                              .calendarSelectedDay!
                                                                              .start,
                                                                          agendarComSalaoHorariosRow!.horaAbertura.elementAtOrNull(_model
                                                                              .diaSemana!)!)!,
                                                                      functions.atualizarHorario(
                                                                          _model
                                                                              .calendarSelectedDay!
                                                                              .start,
                                                                          agendarComSalaoHorariosRow!.horaFechamento.elementAtOrNull(_model
                                                                              .diaSemana!)!)!,
                                                                      _model
                                                                          .todosHorarios
                                                                          ?.toList(),
                                                                      columnServicosRow!
                                                                          .tempo!,
                                                                      columnSalaoRow!
                                                                          .nome)
                                                                  ?.length !=
                                                              0))
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        10.0,
                                                                        10.0,
                                                                        10.0),
                                                            child: Builder(
                                                              builder:
                                                                  (context) {
                                                                final horas = functions
                                                                        .gerarHorarios(
                                                                            columnServicosRow!.idProf
                                                                                .toList(),
                                                                            _model
                                                                                .calendarSelectedDay!.start,
                                                                            _model.horasAgendadas
                                                                                .toList(),
                                                                            functions.atualizarHorario(_model.calendarSelectedDay!.start,
                                                                                agendarComSalaoHorariosRow!.horaAbertura.elementAtOrNull(_model.diaSemana!)!)!,
                                                                            functions.atualizarHorario(_model.calendarSelectedDay!.start, agendarComSalaoHorariosRow!.horaFechamento.elementAtOrNull(_model.diaSemana!)!)!,
                                                                            _model.todosHorarios?.toList(),
                                                                            columnServicosRow!.tempo!,
                                                                            columnSalaoRow!.nome)
                                                                        ?.map((e) => e)
                                                                        .toList()
                                                                        ?.where((e) => e.secondsSinceEpoch >= functions.atualizarHorario(_model.calendarSelectedDay!.start, '18:00')!.secondsSinceEpoch)
                                                                        .toList()
                                                                        ?.toList() ??
                                                                    [];

                                                                return GridView
                                                                    .builder(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  gridDelegate:
                                                                      SliverGridDelegateWithFixedCrossAxisCount(
                                                                    crossAxisCount:
                                                                        6,
                                                                    crossAxisSpacing:
                                                                        10.0,
                                                                    mainAxisSpacing:
                                                                        10.0,
                                                                    childAspectRatio:
                                                                        1.0,
                                                                  ),
                                                                  scrollDirection:
                                                                      Axis.vertical,
                                                                  itemCount: horas
                                                                      .length,
                                                                  itemBuilder:
                                                                      (context,
                                                                          horasIndex) {
                                                                    final horasItem =
                                                                        horas[
                                                                            horasIndex];
                                                                    return InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'AGENDAR_COM_SALAO_Container_c0ui6jvh_ON_');
                                                                        logFirebaseEvent(
                                                                            'Container_update_page_state');
                                                                        _model.horaClicada =
                                                                            horasItem;
                                                                        safeSetState(
                                                                            () {});
                                                                        logFirebaseEvent(
                                                                            'Container_update_page_state');
                                                                        _model.fimAgendamento = functions.horarioFinalAgendamento(
                                                                            _model.horaClicada!,
                                                                            columnServicosRow!.tempo!);
                                                                        safeSetState(
                                                                            () {});
                                                                        logFirebaseEvent(
                                                                            'Container_update_app_state');
                                                                        FFAppState().ProfEscolhido =
                                                                            '';
                                                                        safeSetState(
                                                                            () {});
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            60.0,
                                                                        height:
                                                                            60.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          borderRadius:
                                                                              BorderRadius.circular(10.0),
                                                                          border:
                                                                              Border.all(
                                                                            color: horasItem == _model.horaClicada
                                                                                ? FlutterFlowTheme.of(context).primary
                                                                                : Color(0x00000000),
                                                                            width:
                                                                                0.0,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Text(
                                                                              dateTimeFormat("Hm", horasItem),
                                                                              textAlign: TextAlign.center,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Readex Pro',
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                      if ((_model.statusDia ==
                                                              'Fechado') ||
                                                          (functions
                                                                  .gerarHorarios(
                                                                      columnServicosRow!
                                                                          .idProf
                                                                          .toList(),
                                                                      _model
                                                                          .calendarSelectedDay!
                                                                          .start,
                                                                      _model.horasAgendadas
                                                                          .toList(),
                                                                      functions.atualizarHorario(
                                                                          _model
                                                                              .calendarSelectedDay!
                                                                              .start,
                                                                          agendarComSalaoHorariosRow!.horaAbertura.elementAtOrNull(_model
                                                                              .diaSemana!)!)!,
                                                                      functions.atualizarHorario(
                                                                          _model
                                                                              .calendarSelectedDay!
                                                                              .start,
                                                                          agendarComSalaoHorariosRow!.horaFechamento.elementAtOrNull(_model
                                                                              .diaSemana!)!)!,
                                                                      _model
                                                                          .todosHorarios
                                                                          ?.toList(),
                                                                      columnServicosRow!
                                                                          .tempo!,
                                                                      columnSalaoRow!
                                                                          .nome)
                                                                  ?.length ==
                                                              0))
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      80.0,
                                                                      10.0,
                                                                      0.0),
                                                          child: Text(
                                                            'Não temos horários disponiveis neste turno',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  fontSize:
                                                                      20.0,
                                                                  letterSpacing:
                                                                      0.0,
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
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 15.0, 15.0, 0.0),
                          child: FutureBuilder<List<ProfissionalRow>>(
                            future: (_model.requestCompleter ??= Completer<
                                    List<ProfissionalRow>>()
                                  ..complete(ProfissionalTable().querySingleRow(
                                    queryFn: (q) => q.eqOrNull(
                                      'id_prof',
                                      FFAppState().ProfEscolhido,
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
                              List<ProfissionalRow> servicoProfissionalRowList =
                                  snapshot.data!;

                              final servicoProfissionalRow =
                                  servicoProfissionalRowList.isNotEmpty
                                      ? servicoProfissionalRowList.first
                                      : null;

                              return Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 143.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).dun,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: FutureBuilder<List<SalaoRow>>(
                                  future: SalaoTable().querySingleRow(
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
                                    List<SalaoRow> columnSalaoRowList =
                                        snapshot.data!;

                                    final columnSalaoRow =
                                        columnSalaoRowList.isNotEmpty
                                            ? columnSalaoRowList.first
                                            : null;

                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 10.0, 10.0, 10.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                valueOrDefault<String>(
                                                  columnServicosRow?.nome,
                                                  'Indefinido',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 20.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    'R\$ ${formatNumber(
                                                      columnServicosRow?.valor,
                                                      formatType:
                                                          FormatType.decimal,
                                                      decimalType: DecimalType
                                                          .commaDecimal,
                                                    )}',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 5.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      '${dateTimeFormat("Hm", _model.horaClicada)} - ${dateTimeFormat("Hm", _model.fimAgendamento)}',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          thickness: 1.0,
                                          color: FlutterFlowTheme.of(context)
                                              .accent4,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 8.0, 10.0, 10.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Profissional: ${FFAppState().ProfEscolhido != null && FFAppState().ProfEscolhido != '' ? servicoProfissionalRow?.nome : 'Indefinido'}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Builder(
                                                builder: (context) =>
                                                    FFButtonWidget(
                                                  onPressed:
                                                      (_model.horaClicada ==
                                                              null)
                                                          ? null
                                                          : () async {
                                                              logFirebaseEvent(
                                                                  'AGENDAR_COM_SALAO_ALTERAR_BTN_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'Button_alert_dialog');
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (dialogContext) {
                                                                  return Dialog(
                                                                    elevation:
                                                                        0,
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
                                                                            Directionality.of(context)),
                                                                    child:
                                                                        GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        FocusScope.of(dialogContext)
                                                                            .unfocus();
                                                                        FocusManager
                                                                            .instance
                                                                            .primaryFocus
                                                                            ?.unfocus();
                                                                      },
                                                                      child:
                                                                          ProfDisponiveisWidget(
                                                                        refServico:
                                                                            widget!.refServico!,
                                                                        horaInicio:
                                                                            _model.horaClicada!,
                                                                        horaFim:
                                                                            _model.fimAgendamento!,
                                                                        agendamentos:
                                                                            _model.horasAgendadas,
                                                                        diaSemana:
                                                                            _model.diaSemana!,
                                                                        nomeSalao:
                                                                            columnSalaoRow!.nome,
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              );

                                                              logFirebaseEvent(
                                                                  'Button_refresh_database_request');
                                                              safeSetState(() =>
                                                                  _model.requestCompleter =
                                                                      null);
                                                              await _model
                                                                  .waitForRequestCompleted();
                                                            },
                                                  text: 'Alterar',
                                                  options: FFButtonOptions(
                                                    height: 30.0,
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
                                                        .chamoisee,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: Colors.white,
                                                          fontSize: 14.0,
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
                                                    disabledColor:
                                                        Color(0x7CB07D62),
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
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 10.0, 15.0, 5.0),
                          child: Container(
                            width: double.infinity,
                            height: 70.0,
                            decoration: BoxDecoration(
                              color: Color(0x00E6CCB2),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Container(
                              width: 100.0,
                              height: 120.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFE6CCB2),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 10.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        width: 200.0,
                                        child: TextFormField(
                                          controller: _model.textController,
                                          focusNode: _model.textFieldFocusNode,
                                          autofocus: false,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            labelText: 'Contato',
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      letterSpacing: 0.0,
                                                    ),
                                            hintText: 'Email ou Celular',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      letterSpacing: 0.0,
                                                    ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            filled: true,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                letterSpacing: 0.0,
                                              ),
                                          cursorColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          validator: _model
                                              .textControllerValidator
                                              .asValidator(context),
                                        ),
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
                              15.0, 10.0, 15.0, 0.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 70.0,
                            decoration: BoxDecoration(
                              color: Color(0x00FFFFFF),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'Total: R\$ ',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                fontSize: 20.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Text(
                                          valueOrDefault<String>(
                                            columnServicosRow?.valor
                                                ?.toString(),
                                            '.',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                fontSize: 20.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Text(
                                          ',00',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                fontSize: 20.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          valueOrDefault<String>(
                                            columnServicosRow?.tempo
                                                ?.toString(),
                                            '.',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Text(
                                          ' min',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 15.0),
                          child: FFButtonWidget(
                            onPressed: ((_model.horaClicada == null) ||
                                    (FFAppState().ProfEscolhido == null ||
                                        FFAppState().ProfEscolhido == ''))
                                ? null
                                : () async {
                                    logFirebaseEvent(
                                        'AGENDAR_COM_SALAO_AGENDAR_BTN_ON_TAP');
                                    if (functions.verificarConflitoDataCliente(
                                            currentUserUid,
                                            _model.horaClicada!,
                                            _model.fimAgendamento!,
                                            _model.horasAgendadas.toList()) ==
                                        false) {
                                      logFirebaseEvent('Button_backend_call');
                                      await AgendamentosTable().insert({
                                        'id_cliente': currentUserUid,
                                        'id_salao': widget!.refSalao,
                                        'id_servico': widget!.refServico,
                                        'data_agendada':
                                            supaSerialize<DateTime>(functions
                                                .horaUTC(_model.horaClicada!)),
                                        'id_prof': FFAppState().ProfEscolhido,
                                        'data_fim': supaSerialize<DateTime>(
                                            functions.horaUTC(
                                                _model.fimAgendamento!)),
                                        'status': 'Confirmado',
                                        'contato_cliente':
                                            _model.textController.text,
                                      });
                                      logFirebaseEvent('Button_show_snack_bar');
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Agendamento Confirmado',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          duration:
                                              Duration(milliseconds: 5000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                        ),
                                      );
                                      logFirebaseEvent('Button_action_block');
                                      await _model.buscarHoras(context);
                                      safeSetState(() {});
                                      logFirebaseEvent(
                                          'Button_update_app_state');
                                      FFAppState().ProfEscolhido = '';
                                      safeSetState(() {});
                                      logFirebaseEvent('Button_navigate_back');
                                      context.safePop();
                                    } else {
                                      logFirebaseEvent('Button_show_snack_bar');
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Você já possui um agendamento nesta data',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          duration:
                                              Duration(milliseconds: 5100),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .tertiary,
                                        ),
                                      );
                                    }
                                  },
                            text: 'Agendar',
                            options: FFButtonOptions(
                              width: 363.0,
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primaryText,
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
                              disabledColor: Color(0x8514181B),
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
