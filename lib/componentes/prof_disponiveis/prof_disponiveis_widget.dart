import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'prof_disponiveis_model.dart';
export 'prof_disponiveis_model.dart';

class ProfDisponiveisWidget extends StatefulWidget {
  const ProfDisponiveisWidget({
    super.key,
    required this.refServico,
    required this.horaInicio,
    required this.horaFim,
    required this.agendamentos,
    required this.diaSemana,
    required this.nomeSalao,
  });

  final String? refServico;
  final DateTime? horaInicio;
  final DateTime? horaFim;
  final List<AgendamentosRow>? agendamentos;
  final int? diaSemana;
  final String? nomeSalao;

  @override
  State<ProfDisponiveisWidget> createState() => _ProfDisponiveisWidgetState();
}

class _ProfDisponiveisWidgetState extends State<ProfDisponiveisWidget> {
  late ProfDisponiveisModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfDisponiveisModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('PROF_DISPONIVEIS_Prof-disponiveis_ON_INI');
      logFirebaseEvent('Prof-disponiveis_update_component_state');
      _model.agendamentos =
          widget!.agendamentos!.toList().cast<AgendamentosRow>();
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
    return FutureBuilder<List<ServicosRow>>(
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
        List<ServicosRow> containerServicosRowList = snapshot.data!;

        final containerServicosRow = containerServicosRowList.isNotEmpty
            ? containerServicosRowList.first
            : null;

        return Container(
          width: 315.0,
          height: 467.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'PROF_DISPONIVEIS_Icon_yzl8iopg_ON_TAP');
                        logFirebaseEvent('Icon_navigate_back');
                        context.safePop();
                      },
                      child: Icon(
                        Icons.arrow_back_ios_rounded,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 30.0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                  child: FutureBuilder<List<ProfissionalRow>>(
                    future: ProfissionalTable().queryRows(
                      queryFn: (q) => q.inFilterOrNull(
                        'id_prof',
                        containerServicosRow?.idProf,
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
                      List<ProfissionalRow> listViewProfissionalRowList =
                          snapshot.data!;

                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewProfissionalRowList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewProfissionalRow =
                              listViewProfissionalRowList[listViewIndex];
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 5.0),
                            child: FutureBuilder<List<HorariosRow>>(
                              future: HorariosTable().querySingleRow(
                                queryFn: (q) => q.eqOrNull(
                                  'id_horario',
                                  listViewProfissionalRow.idProf,
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
                                List<HorariosRow> containerHorariosRowList =
                                    snapshot.data!;

                                final containerHorariosRow =
                                    containerHorariosRowList.isNotEmpty
                                        ? containerHorariosRowList.first
                                        : null;

                                return Container(
                                  width: double.infinity,
                                  height: 76.0,
                                  decoration: BoxDecoration(
                                    color: Color(0x00E6CCB2),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Visibility(
                                    visible: (functions.verificarConflitoDataProf(
                                                listViewProfissionalRow.idProf,
                                                widget!.horaInicio!,
                                                widget!.horaFim!,
                                                widget!.agendamentos!.toList(),
                                                functions.atualizarHorario(
                                                    widget!.horaInicio!,
                                                    containerHorariosRow!
                                                        .intervaloInicio
                                                        .elementAtOrNull(widget!
                                                            .diaSemana!)!),
                                                functions.atualizarHorario(
                                                    widget!.horaInicio!,
                                                    containerHorariosRow!
                                                        .intervaloFinal
                                                        .elementAtOrNull(widget!
                                                            .diaSemana!)!)) ==
                                            false) &&
                                        ((containerHorariosRow?.localTrabalho
                                                ?.elementAtOrNull(
                                                    widget!.diaSemana!)) ==
                                            widget!.nomeSalao),
                                    child: Container(
                                      width: 100.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context).dun,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'PROF_DISPONIVEIS_Row_x11l7wlx_ON_TAP');
                                            logFirebaseEvent(
                                                'Row_update_app_state');
                                            FFAppState().ProfEscolhido =
                                                listViewProfissionalRow.idProf;
                                            safeSetState(() {});
                                            logFirebaseEvent(
                                                'Row_close_dialog_drawer_etc');
                                            Navigator.pop(context);
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 0.0, 0.0, 5.0),
                                                child: Container(
                                                  width: 60.0,
                                                  height: 60.0,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Image.network(
                                                    valueOrDefault<String>(
                                                      listViewProfissionalRow
                                                          .foto,
                                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/saloes-v0eeqm/assets/x5qq3eogp6d4/sem-foto.jpg',
                                                    ),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 5.0, 0.0, 5.0),
                                                child: Container(
                                                  width: 200.0,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            listViewProfissionalRow
                                                                .nome,
                                                            'Sem Nome',
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
        );
      },
    );
  }
}
