import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'encontrar_salao_model.dart';
export 'encontrar_salao_model.dart';

class EncontrarSalaoWidget extends StatefulWidget {
  const EncontrarSalaoWidget({super.key});

  @override
  State<EncontrarSalaoWidget> createState() => _EncontrarSalaoWidgetState();
}

class _EncontrarSalaoWidgetState extends State<EncontrarSalaoWidget>
    with TickerProviderStateMixin {
  late EncontrarSalaoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EncontrarSalaoModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'EncontrarSalao'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('ENCONTRAR_SALAO_EncontrarSalao_ON_INIT_S');
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
      logFirebaseEvent('EncontrarSalao_backend_call');
      _model.buscaFavoritos = await FavoritosTable().queryRows(
        queryFn: (q) => q,
      );
      logFirebaseEvent('EncontrarSalao_update_page_state');
      _model.listaFavoritos =
          _model.buscaFavoritos!.toList().cast<FavoritosRow>();
      safeSetState(() {});
      logFirebaseEvent('EncontrarSalao_backend_call');
      _model.outResultado = await BuscarLugaresCall.call();

      logFirebaseEvent('EncontrarSalao_update_page_state');
      _model.local = functions
          .stringtolat(
              (_model.outResultado?.bodyText ?? ''), _model.campos.toList())
          .map((e) => DtlocalStruct.maybeFromMap(e))
          .withoutNulls
          .toList()
          .toList()
          .cast<DtlocalStruct>();
      safeSetState(() {});
      logFirebaseEvent('EncontrarSalao_update_page_state');
      _model.distancia = functions
          .calculateDistancesFromCurrentLocation(
              currentUserLocationValue!,
              _model.local
                  .map((e) => e.coordenadas)
                  .withoutNulls
                  .toList()
                  .toList())
          .toList()
          .cast<double>();
      safeSetState(() {});
    });

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => safeSetState(() => currentUserLocationValue = loc));
    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
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

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        drawer: Drawer(
          elevation: 16.0,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                child: Text(
                  'Filtros',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        fontSize: 22.0,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              Text(
                'Salão',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      fontSize: 18.0,
                      letterSpacing: 0.0,
                    ),
              ),
              Divider(
                thickness: 1.0,
                color: FlutterFlowTheme.of(context).secondaryText,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                child: Text(
                  'Serviço',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        fontSize: 18.0,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              Text(
                'Valor',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      letterSpacing: 0.0,
                    ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Min ',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0.0,
                        ),
                  ),
                  Text(
                    valueOrDefault<String>(
                      _model.valorMinValue?.toString(),
                      '0',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0.0,
                        ),
                  ),
                  Text(
                    '   -   ',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0.0,
                        ),
                  ),
                  Text(
                    valueOrDefault<String>(
                      _model.valorMaxValue?.toString(),
                      '0',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0.0,
                        ),
                  ),
                  Text(
                    ' Max',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0.0,
                        ),
                  ),
                ],
              ),
              SliderTheme(
                data: SliderThemeData(
                  showValueIndicator: ShowValueIndicator.always,
                ),
                child: Slider(
                  activeColor: FlutterFlowTheme.of(context).primaryText,
                  inactiveColor: FlutterFlowTheme.of(context).alternate,
                  min: 10.0,
                  max: 300.0,
                  value: _model.valorMinValue ??= 50.0,
                  label: _model.valorMinValue?.toStringAsFixed(2),
                  onChanged: (newValue) {
                    newValue = double.parse(newValue.toStringAsFixed(2));
                    safeSetState(() => _model.valorMinValue = newValue);
                  },
                ),
              ),
              Slider(
                activeColor: FlutterFlowTheme.of(context).primaryText,
                inactiveColor: FlutterFlowTheme.of(context).alternate,
                min: 300.0,
                max: 1000.0,
                value: _model.valorMaxValue ??= 1000.0,
                onChanged: (newValue) {
                  newValue = double.parse(newValue.toStringAsFixed(2));
                  safeSetState(() => _model.valorMaxValue = newValue);
                },
              ),
              Text(
                'Dia',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      letterSpacing: 0.0,
                    ),
              ),
              Divider(
                thickness: 1.0,
                color: FlutterFlowTheme.of(context).secondaryText,
              ),
              Text(
                'Profissional',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      fontSize: 18.0,
                      letterSpacing: 0.0,
                    ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Theme(
                    data: ThemeData(
                      checkboxTheme: CheckboxThemeData(
                        visualDensity: VisualDensity.compact,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                      unselectedWidgetColor:
                          FlutterFlowTheme.of(context).alternate,
                    ),
                    child: Checkbox(
                      value: _model.domicilioValue ??= false,
                      onChanged: (newValue) async {
                        safeSetState(() => _model.domicilioValue = newValue!);
                      },
                      side: BorderSide(
                        width: 2,
                        color: FlutterFlowTheme.of(context).alternate,
                      ),
                      activeColor: FlutterFlowTheme.of(context).primaryText,
                      checkColor: FlutterFlowTheme.of(context).info,
                    ),
                  ),
                  Text(
                    'Atende à domicílio',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0.0,
                        ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent('ENCONTRAR_SALAO_Text_ek53i2r4_ON_TAP');
                    logFirebaseEvent('Text_drawer');
                    if (scaffoldKey.currentState!.isDrawerOpen ||
                        scaffoldKey.currentState!.isEndDrawerOpen) {
                      Navigator.pop(context);
                    }
                  },
                  child: Text(
                    'Cancelar',
                    style: FlutterFlowTheme.of(context).labelSmall.override(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).eerieBlack,
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
              logFirebaseEvent('ENCONTRAR_SALAO_arrow_back_rounded_ICN_O');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          title: Text(
            'Buscar Salão',
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
          child: Align(
            alignment: AlignmentDirectional(0.0, -1.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: 60.0,
                    decoration: BoxDecoration(),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FlutterFlowIconButton(
                          borderColor: FlutterFlowTheme.of(context).chamoisee,
                          borderRadius: 20.0,
                          borderWidth: 1.0,
                          buttonSize: 40.0,
                          fillColor: FlutterFlowTheme.of(context).buff,
                          icon: Icon(
                            Icons.filter_list_outlined,
                            color: Colors.white,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            logFirebaseEvent(
                                'ENCONTRAR_SALAO_filter_list_outlined_ICN');
                            logFirebaseEvent('IconButton_drawer');
                            scaffoldKey.currentState!.openDrawer();
                          },
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 0.0, 0.0),
                            child: TextFormField(
                              controller: _model.textController,
                              focusNode: _model.textFieldFocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.textController',
                                Duration(milliseconds: 300),
                                () => safeSetState(() {}),
                              ),
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Pesquisar',
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      letterSpacing: 0.0,
                                    ),
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      letterSpacing: 0.0,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).buff,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
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
                              validator: _model.textControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 0.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 0.223,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: FlutterFlowGoogleMap(
                      controller: _model.googleMapsController,
                      onCameraIdle: (latLng) =>
                          _model.googleMapsCenter = latLng,
                      initialLocation: _model.googleMapsCenter ??=
                          currentUserLocationValue!,
                      markers: _model.local
                          .map((e) => e.coordenadas)
                          .withoutNulls
                          .toList()
                          .map(
                            (marker) => FlutterFlowMarker(
                              marker.serialize(),
                              marker,
                            ),
                          )
                          .toList(),
                      markerColor: GoogleMarkerColor.red,
                      mapType: MapType.normal,
                      style: GoogleMapStyle.standard,
                      initialZoom: 14.0,
                      allowInteraction: true,
                      allowZoom: true,
                      showZoomControls: true,
                      showLocation: true,
                      showCompass: false,
                      showMapToolbar: false,
                      showTraffic: false,
                      centerMapOnMarkerTap: true,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 5.0),
                  child: FutureBuilder<List<CategoriasRow>>(
                    future: CategoriasTable().queryRows(
                      queryFn: (q) => q,
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
                      List<CategoriasRow> choiceChipsCategoriasRowList =
                          snapshot.data!;

                      return FlutterFlowChoiceChips(
                        options: choiceChipsCategoriasRowList
                            .map((e) => e.nome)
                            .toList()
                            .map((label) => ChipData(label))
                            .toList(),
                        onChanged: (val) async {
                          safeSetState(
                              () => _model.choiceChipsValue = val?.firstOrNull);
                          logFirebaseEvent(
                              'ENCONTRAR_SALAO_ChoiceChips_7le2ryu6_ON_');
                          logFirebaseEvent('ChoiceChips_backend_call');
                          _model.filtroCategoria =
                              await ServicosTable().queryRows(
                            queryFn: (q) => q.eqOrNull(
                              'categoria',
                              valueOrDefault<String>(
                                _model.choiceChipsValue,
                                '.',
                              ),
                            ),
                          );

                          safeSetState(() {});
                        },
                        selectedChipStyle: ChipStyle(
                          backgroundColor:
                              FlutterFlowTheme.of(context).chamoisee,
                          textStyle: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Readex Pro',
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                              ),
                          iconColor: FlutterFlowTheme.of(context).primaryText,
                          iconSize: 18.0,
                          elevation: 4.0,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        unselectedChipStyle: ChipStyle(
                          backgroundColor:
                              FlutterFlowTheme.of(context).alternate,
                          textStyle: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Readex Pro',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                              ),
                          iconColor: FlutterFlowTheme.of(context).secondaryText,
                          iconSize: 18.0,
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        chipSpacing: 12.0,
                        rowSpacing: 12.0,
                        multiselect: false,
                        alignment: WrapAlignment.start,
                        controller: _model.choiceChipsValueController ??=
                            FormFieldController<List<String>>(
                          [],
                        ),
                        wrapped: false,
                      );
                    },
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment(0.0, 0),
                        child: TabBar(
                          isScrollable: true,
                          labelColor: FlutterFlowTheme.of(context).primaryText,
                          unselectedLabelColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          labelStyle:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                          unselectedLabelStyle: TextStyle(),
                          indicatorColor:
                              FlutterFlowTheme.of(context).primaryText,
                          padding: EdgeInsets.all(4.0),
                          tabs: [
                            Tab(
                              text: 'Salões',
                            ),
                            Tab(
                              text: 'Serviços',
                            ),
                            Tab(
                              text: 'Profissionais',
                            ),
                          ],
                          controller: _model.tabBarController,
                          onTap: (i) async {
                            [() async {}, () async {}, () async {}][i]();
                          },
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: _model.tabBarController,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 30.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (_model.textController.text == '')
                                      FutureBuilder<ApiCallResponse>(
                                        future: BuscarSaloesCall.call(
                                          variavelDeBusca:
                                              valueOrDefault<String>(
                                            _model.textController.text,
                                            'a',
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
                                                    FlutterFlowTheme.of(context)
                                                        .chamoisee,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          final listViewBuscarSaloesResponse =
                                              snapshot.data!;

                                          return Builder(
                                            builder: (context) {
                                              final locais =
                                                  _model.local.toList();

                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                primary: false,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount: locais.length,
                                                itemBuilder:
                                                    (context, locaisIndex) {
                                                  final locaisItem =
                                                      locais[locaisIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 10.0),
                                                    child: Container(
                                                      width: 100.0,
                                                      height: 140.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        0.0,
                                                                        5.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 370.0,
                                                              height: 139.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .dun,
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    blurRadius:
                                                                        4.0,
                                                                    color: Color(
                                                                        0x33000000),
                                                                    offset:
                                                                        Offset(
                                                                      0.0,
                                                                      2.0,
                                                                    ),
                                                                  )
                                                                ],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.0),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            10.0,
                                                                            10.0,
                                                                            10.0),
                                                                    child:
                                                                        InkWell(
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
                                                                            'ENCONTRAR_SALAO_PAGE_Row_ayh7gmuj_ON_TAP');
                                                                        logFirebaseEvent(
                                                                            'Row_navigate_to');

                                                                        context
                                                                            .pushNamed(
                                                                          'Cliente-PerfilSalao',
                                                                          queryParameters:
                                                                              {
                                                                            'refSalao':
                                                                                serializeParam(
                                                                              locaisItem.idSalao,
                                                                              ParamType.String,
                                                                            ),
                                                                          }.withoutNulls,
                                                                        );
                                                                      },
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                100.0,
                                                                            height:
                                                                                100.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).chamoisee,
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                              border: Border.all(
                                                                                color: FlutterFlowTheme.of(context).customColor2,
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 2.0, 2.0),
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                child: Image.network(
                                                                                  valueOrDefault<String>(
                                                                                    locaisItem.fotoPerfil,
                                                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/saloes-v0eeqm/assets/x5qq3eogp6d4/sem-foto.jpg',
                                                                                  ),
                                                                                  width: 86.0,
                                                                                  height: 100.0,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 200.0,
                                                                              height: 115.0,
                                                                              decoration: BoxDecoration(),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Text(
                                                                                    locaisItem.nome,
                                                                                    textAlign: TextAlign.center,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Readex Pro',
                                                                                          fontSize: 16.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w600,
                                                                                        ),
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Text(
                                                                                        formatNumber(
                                                                                          _model.distancia.elementAtOrNull(locaisIndex),
                                                                                          formatType: FormatType.custom,
                                                                                          format: '##0.# km',
                                                                                          locale: 'pt_BR',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Readex Pro',
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  Container(
                                                                                    width: 260.0,
                                                                                    height: 45.0,
                                                                                    decoration: BoxDecoration(),
                                                                                    child: Text(
                                                                                      valueOrDefault<String>(
                                                                                        locaisItem.endereco,
                                                                                        '.',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Readex Pro',
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        RatingBarIndicator(
                                                                                          itemBuilder: (context, index) => Icon(
                                                                                            Icons.star_rounded,
                                                                                            color: FlutterFlowTheme.of(context).brownSugar,
                                                                                          ),
                                                                                          direction: Axis.horizontal,
                                                                                          rating: locaisItem.estrelas,
                                                                                          unratedColor: FlutterFlowTheme.of(context).slateGray,
                                                                                          itemCount: 5,
                                                                                          itemSize: 20.0,
                                                                                        ),
                                                                                        Text(
                                                                                          locaisItem.qntAvaliacoes.toString(),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Readex Pro',
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
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            -1.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          logFirebaseEvent(
                                                                              'ENCONTRAR_SALAO_PAGE_favorito_ON_TAP');
                                                                          logFirebaseEvent(
                                                                              'favorito_backend_call');
                                                                          _model.favoritos =
                                                                              await FavoritosTable().queryRows(
                                                                            queryFn: (q) =>
                                                                                q,
                                                                          );
                                                                          if (functions.verificarFavorito(currentUserUid, locaisItem.idSalao, 'Salão', _model.favoritos?.toList()) ==
                                                                              false) {
                                                                            logFirebaseEvent('favorito_backend_call');
                                                                            await FavoritosTable().insert({
                                                                              'id_cliente': currentUserUid,
                                                                              'id_salao': locaisItem.idSalao,
                                                                            });
                                                                          } else {
                                                                            logFirebaseEvent('favorito_backend_call');
                                                                            await FavoritosTable().delete(
                                                                              matchingRows: (rows) => rows
                                                                                  .eqOrNull(
                                                                                    'id_cliente',
                                                                                    currentUserUid,
                                                                                  )
                                                                                  .eqOrNull(
                                                                                    'id_salao',
                                                                                    locaisItem.idSalao,
                                                                                  ),
                                                                            );
                                                                          }

                                                                          logFirebaseEvent(
                                                                              'favorito_backend_call');
                                                                          _model.posFavoritos =
                                                                              await FavoritosTable().queryRows(
                                                                            queryFn: (q) =>
                                                                                q,
                                                                          );
                                                                          logFirebaseEvent(
                                                                              'favorito_update_page_state');
                                                                          _model.listaFavoritos = _model
                                                                              .posFavoritos!
                                                                              .toList()
                                                                              .cast<FavoritosRow>();
                                                                          safeSetState(
                                                                              () {});

                                                                          safeSetState(
                                                                              () {});
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              30.0,
                                                                          height:
                                                                              30.0,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              if (functions.verificarFavorito(currentUserUid, locaisItem.idSalao, 'Salão', _model.listaFavoritos.toList()) == false)
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                                                                                  child: Icon(
                                                                                    Icons.favorite_border,
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    size: 28.0,
                                                                                  ),
                                                                                ),
                                                                              if (functions.verificarFavorito(currentUserUid, locaisItem.idSalao, 'Salão', _model.listaFavoritos.toList()) == true)
                                                                                Icon(
                                                                                  Icons.favorite_sharp,
                                                                                  color: Color(0xFFEB4444),
                                                                                  size: 28.0,
                                                                                ),
                                                                            ],
                                                                          ),
                                                                        ),
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
                                                  );
                                                },
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    if (_model.textController.text != '')
                                      FutureBuilder<ApiCallResponse>(
                                        future: BuscarSaloesCall.call(
                                          variavelDeBusca:
                                              valueOrDefault<String>(
                                            _model.textController.text,
                                            'a',
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
                                                    FlutterFlowTheme.of(context)
                                                        .chamoisee,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          final listViewBuscarSaloesResponse =
                                              snapshot.data!;

                                          return Builder(
                                            builder: (context) {
                                              final resultadoBuscarSalao =
                                                  listViewBuscarSaloesResponse
                                                      .jsonBody
                                                      .toList();

                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                primary: false,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount:
                                                    resultadoBuscarSalao.length,
                                                itemBuilder: (context,
                                                    resultadoBuscarSalaoIndex) {
                                                  final resultadoBuscarSalaoItem =
                                                      resultadoBuscarSalao[
                                                          resultadoBuscarSalaoIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                10.0, 10.0),
                                                    child: Container(
                                                      width: 360.0,
                                                      height: 135.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .dun,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            blurRadius: 4.0,
                                                            color: Color(
                                                                0x33000000),
                                                            offset: Offset(
                                                              0.0,
                                                              2.0,
                                                            ),
                                                          )
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        10.0,
                                                                        10.0,
                                                                        10.0),
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                logFirebaseEvent(
                                                                    'ENCONTRAR_SALAO_PAGE_Row_813fyu7g_ON_TAP');
                                                                logFirebaseEvent(
                                                                    'Row_navigate_to');

                                                                context
                                                                    .pushNamed(
                                                                  'Cliente-PerfilSalao',
                                                                  queryParameters:
                                                                      {
                                                                    'refSalao':
                                                                        serializeParam(
                                                                      getJsonField(
                                                                        resultadoBuscarSalaoItem,
                                                                        r'''$.id_salao''',
                                                                      ).toString(),
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );
                                                              },
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Container(
                                                                    width:
                                                                        100.0,
                                                                    height:
                                                                        100.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .chamoisee,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .customColor2,
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
                                                                            BorderRadius.circular(8.0),
                                                                        child: Image
                                                                            .network(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            getJsonField(
                                                                              resultadoBuscarSalaoItem,
                                                                              r'''$.foto_perfil''',
                                                                            )?.toString(),
                                                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/saloes-v0eeqm/assets/x5qq3eogp6d4/sem-foto.jpg',
                                                                          ),
                                                                          width:
                                                                              86.0,
                                                                          height:
                                                                              100.0,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          211.0,
                                                                      height:
                                                                          115.0,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            getJsonField(
                                                                              resultadoBuscarSalaoItem,
                                                                              r'''$.nome''',
                                                                            ).toString(),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  fontSize: 16.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            formatNumber(
                                                                              _model.distancia.elementAtOrNull(resultadoBuscarSalaoIndex),
                                                                              formatType: FormatType.custom,
                                                                              format: '##0.## km',
                                                                              locale: 'pt_BR',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Container(
                                                                                width: 233.0,
                                                                                height: 51.0,
                                                                                decoration: BoxDecoration(),
                                                                                child: Text(
                                                                                  getJsonField(
                                                                                    resultadoBuscarSalaoItem,
                                                                                    r'''$.endereco''',
                                                                                  ).toString(),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Readex Pro',
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                5.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                RatingBarIndicator(
                                                                                  itemBuilder: (context, index) => Icon(
                                                                                    Icons.star_rounded,
                                                                                    color: FlutterFlowTheme.of(context).bole,
                                                                                  ),
                                                                                  direction: Axis.horizontal,
                                                                                  rating: getJsonField(
                                                                                    resultadoBuscarSalaoItem,
                                                                                    r'''$.estrelas''',
                                                                                  ),
                                                                                  unratedColor: FlutterFlowTheme.of(context).buff2,
                                                                                  itemCount: 5,
                                                                                  itemSize: 20.0,
                                                                                ),
                                                                                Text(
                                                                                  getJsonField(
                                                                                    resultadoBuscarSalaoItem,
                                                                                    r'''$.qntAvaliacoes''',
                                                                                  ).toString(),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Readex Pro',
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
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, -1.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'ENCONTRAR_SALAO_PAGE_favorito_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'favorito_backend_call');
                                                                  _model.favoritosBusca =
                                                                      await FavoritosTable()
                                                                          .queryRows(
                                                                    queryFn:
                                                                        (q) =>
                                                                            q,
                                                                  );
                                                                  if (functions.verificarFavorito(
                                                                          currentUserUid,
                                                                          getJsonField(
                                                                            resultadoBuscarSalaoItem,
                                                                            r'''$.id_salao''',
                                                                          ).toString(),
                                                                          'Salão',
                                                                          _model.favoritosBusca?.toList()) ==
                                                                      false) {
                                                                    logFirebaseEvent(
                                                                        'favorito_backend_call');
                                                                    await FavoritosTable()
                                                                        .insert({
                                                                      'id_cliente':
                                                                          currentUserUid,
                                                                      'id_salao':
                                                                          getJsonField(
                                                                        resultadoBuscarSalaoItem,
                                                                        r'''$.id_salao''',
                                                                      ).toString(),
                                                                    });
                                                                  } else {
                                                                    logFirebaseEvent(
                                                                        'favorito_backend_call');
                                                                    await FavoritosTable()
                                                                        .delete(
                                                                      matchingRows: (rows) => rows
                                                                          .eqOrNull(
                                                                            'id_cliente',
                                                                            currentUserUid,
                                                                          )
                                                                          .eqOrNull(
                                                                            'id_salao',
                                                                            getJsonField(
                                                                              resultadoBuscarSalaoItem,
                                                                              r'''$.id_salao''',
                                                                            ).toString(),
                                                                          ),
                                                                    );
                                                                  }

                                                                  logFirebaseEvent(
                                                                      'favorito_backend_call');
                                                                  _model.posFavoritosBusca =
                                                                      await FavoritosTable()
                                                                          .queryRows(
                                                                    queryFn:
                                                                        (q) =>
                                                                            q,
                                                                  );
                                                                  logFirebaseEvent(
                                                                      'favorito_update_page_state');
                                                                  _model.listaFavoritos = _model
                                                                      .posFavoritosBusca!
                                                                      .toList()
                                                                      .cast<
                                                                          FavoritosRow>();
                                                                  safeSetState(
                                                                      () {});

                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: 30.0,
                                                                  height: 30.0,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      if (functions.verificarFavorito(
                                                                              currentUserUid,
                                                                              getJsonField(
                                                                                resultadoBuscarSalaoItem,
                                                                                r'''$.id_salao''',
                                                                              ).toString(),
                                                                              'Salão',
                                                                              _model.listaFavoritos.toList()) ==
                                                                          false)
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              1.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Icon(
                                                                            Icons.favorite_border,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            size:
                                                                                28.0,
                                                                          ),
                                                                        ),
                                                                      if (functions.verificarFavorito(
                                                                              currentUserUid,
                                                                              getJsonField(
                                                                                resultadoBuscarSalaoItem,
                                                                                r'''$.id_salao''',
                                                                              ).toString(),
                                                                              'Salão',
                                                                              _model.listaFavoritos.toList()) ==
                                                                          true)
                                                                        Icon(
                                                                          Icons
                                                                              .favorite_sharp,
                                                                          color:
                                                                              Color(0xFFEB4444),
                                                                          size:
                                                                              28.0,
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          );
                                        },
                                      ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 0.0, 0.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    FutureBuilder<ApiCallResponse>(
                                      future: (_model.apiRequestCompleter ??=
                                              Completer<ApiCallResponse>()
                                                ..complete(
                                                    BuscarServicosCall.call(
                                                  variavelDeBusca:
                                                      valueOrDefault<String>(
                                                    _model.textController.text,
                                                    'a',
                                                  ),
                                                  cat: _model.choiceChipsValue,
                                                  valorMin:
                                                      _model.valorMinValue,
                                                  valorMax:
                                                      _model.valorMaxValue,
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
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .chamoisee,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        final listViewBuscarServicosBuscarServicosResponse =
                                            snapshot.data!;

                                        return Builder(
                                          builder: (context) {
                                            final resultadoBuscarServico =
                                                listViewBuscarServicosBuscarServicosResponse
                                                    .jsonBody
                                                    .toList();

                                            return RefreshIndicator(
                                              onRefresh: () async {
                                                logFirebaseEvent(
                                                    'ENCONTRAR_SALAO_ListViewBuscarServicos_O');
                                                logFirebaseEvent(
                                                    'ListViewBuscarServicos_refresh_database_');
                                                safeSetState(() =>
                                                    _model.apiRequestCompleter =
                                                        null);
                                                await _model
                                                    .waitForApiRequestCompleted();
                                              },
                                              child: ListView.builder(
                                                padding: EdgeInsets.zero,
                                                primary: false,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount:
                                                    resultadoBuscarServico
                                                        .length,
                                                itemBuilder: (context,
                                                    resultadoBuscarServicoIndex) {
                                                  final resultadoBuscarServicoItem =
                                                      resultadoBuscarServico[
                                                          resultadoBuscarServicoIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                10.0, 10.0),
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
                                                            'ENCONTRAR_SALAO_Container_xa60sbw7_ON_TA');
                                                        if (getJsonField(
                                                              resultadoBuscarServicoItem,
                                                              r'''$.id_salao''',
                                                            ) !=
                                                            null) {
                                                          logFirebaseEvent(
                                                              'Container_navigate_to');

                                                          context.pushNamed(
                                                            'Cliente-PerfilSalao',
                                                            queryParameters: {
                                                              'refSalao':
                                                                  serializeParam(
                                                                getJsonField(
                                                                  resultadoBuscarServicoItem,
                                                                  r'''$.id_salao''',
                                                                ).toString(),
                                                                ParamType
                                                                    .String,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        } else {
                                                          logFirebaseEvent(
                                                              'Container_navigate_to');

                                                          context.pushNamed(
                                                            'Cliente-PerfilProfissional',
                                                            queryParameters: {
                                                              'refProfissional':
                                                                  serializeParam(
                                                                getJsonField(
                                                                  resultadoBuscarServicoItem,
                                                                  r'''$.id_prof''',
                                                                ).toString(),
                                                                ParamType
                                                                    .String,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        }
                                                      },
                                                      child: Container(
                                                        width: 74.0,
                                                        height: 89.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .dun,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    getJsonField(
                                                                      resultadoBuscarServicoItem,
                                                                      r'''$.nome''',
                                                                    ).toString(),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
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
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Text(
                                                                        'Categoria: ',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Readex Pro',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        getJsonField(
                                                                          resultadoBuscarServicoItem,
                                                                          r'''$.categoria''',
                                                                        ).toString(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Readex Pro',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Text(
                                                                        'R\$',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Readex Pro',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        getJsonField(
                                                                          resultadoBuscarServicoItem,
                                                                          r'''$.valor''',
                                                                        ).toString(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Readex Pro',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        '- ',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Readex Pro',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        getJsonField(
                                                                          resultadoBuscarServicoItem,
                                                                          r'''$.tempo''',
                                                                        ).toString(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Readex Pro',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            1.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          'minutos',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Readex Pro',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      FutureBuilder<
                                                                          List<
                                                                              SalaoRow>>(
                                                                        future:
                                                                            SalaoTable().querySingleRow(
                                                                          queryFn: (q) =>
                                                                              q.eqOrNull(
                                                                            'id_salao',
                                                                            getJsonField(
                                                                              resultadoBuscarServicoItem,
                                                                              r'''$.id_salao''',
                                                                            ).toString(),
                                                                          ),
                                                                        ),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
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
                                                                          List<SalaoRow>
                                                                              rowSalaoRowList =
                                                                              snapshot.data!;

                                                                          final rowSalaoRow = rowSalaoRowList.isNotEmpty
                                                                              ? rowSalaoRowList.first
                                                                              : null;

                                                                          return Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              FutureBuilder<List<ProfissionalRow>>(
                                                                                future: ProfissionalTable().querySingleRow(
                                                                                  queryFn: (q) => q.eqOrNull(
                                                                                    'id_prof',
                                                                                    getJsonField(
                                                                                      resultadoBuscarServicoItem,
                                                                                      r'''$.id_prof''',
                                                                                    ).toString(),
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
                                                                                  List<ProfissionalRow> textProfissionalRowList = snapshot.data!;

                                                                                  final textProfissionalRow = textProfissionalRowList.isNotEmpty ? textProfissionalRowList.first : null;

                                                                                  return Text(
                                                                                    valueOrDefault<String>(
                                                                                      () {
                                                                                        if (getJsonField(
                                                                                              resultadoBuscarServicoItem,
                                                                                              r'''$.id_salao''',
                                                                                            ) !=
                                                                                            null) {
                                                                                          return rowSalaoRow?.nome;
                                                                                        } else if (getJsonField(
                                                                                              resultadoBuscarServicoItem,
                                                                                              r'''$.id_prof''',
                                                                                            ) !=
                                                                                            null) {
                                                                                          return textProfissionalRow?.nome;
                                                                                        } else {
                                                                                          return textProfissionalRow?.nome;
                                                                                        }
                                                                                      }(),
                                                                                      '.',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Readex Pro',
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  );
                                                                                },
                                                                              ),
                                                                              Text(
                                                                                ' - ',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Readex Pro',
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                              Text(
                                                                                formatNumber(
                                                                                  _model.distancia.elementAtOrNull(resultadoBuscarServicoIndex),
                                                                                  formatType: FormatType.custom,
                                                                                  format: '##0.# km',
                                                                                  locale: 'pt_BR',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Readex Pro',
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          );
                                                                        },
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                FFButtonWidget(
                                                                  onPressed:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'ENCONTRAR_SALAO_PAGE_AGENDAR_BTN_ON_TAP');
                                                                    if (getJsonField(
                                                                          resultadoBuscarServicoItem,
                                                                          r'''$.id_salao''',
                                                                        ) !=
                                                                        null) {
                                                                      logFirebaseEvent(
                                                                          'Button_navigate_to');

                                                                      context
                                                                          .pushNamed(
                                                                        'AgendarComSalao',
                                                                        queryParameters:
                                                                            {
                                                                          'refSalao':
                                                                              serializeParam(
                                                                            getJsonField(
                                                                              resultadoBuscarServicoItem,
                                                                              r'''$.id_salao''',
                                                                            ).toString(),
                                                                            ParamType.String,
                                                                          ),
                                                                          'refServico':
                                                                              serializeParam(
                                                                            getJsonField(
                                                                              resultadoBuscarServicoItem,
                                                                              r'''$.id_servico''',
                                                                            ).toString(),
                                                                            ParamType.String,
                                                                          ),
                                                                        }.withoutNulls,
                                                                      );
                                                                    } else {
                                                                      logFirebaseEvent(
                                                                          'Button_navigate_to');

                                                                      context
                                                                          .pushNamed(
                                                                        'AgendarComProf',
                                                                        queryParameters:
                                                                            {
                                                                          'refProf':
                                                                              serializeParam(
                                                                            getJsonField(
                                                                              resultadoBuscarServicoItem,
                                                                              r'''$.id_prof''',
                                                                            ).toString(),
                                                                            ParamType.String,
                                                                          ),
                                                                          'refServico':
                                                                              serializeParam(
                                                                            getJsonField(
                                                                              resultadoBuscarServicoItem,
                                                                              r'''$.id_servico''',
                                                                            ).toString(),
                                                                            ParamType.String,
                                                                          ),
                                                                        }.withoutNulls,
                                                                      );
                                                                    }
                                                                  },
                                                                  text:
                                                                      'Agendar',
                                                                  options:
                                                                      FFButtonOptions(
                                                                    width:
                                                                        120.0,
                                                                    height:
                                                                        30.0,
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
                                                                        ),
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
                                                              ].divide(SizedBox(
                                                                  height:
                                                                      10.0)),
                                                            ),
                                                          ],
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
                                    if ((_model.textController.text == '') &&
                                        (_model.choiceChipsValue == null ||
                                            _model.choiceChipsValue == ''))
                                      FutureBuilder<ApiCallResponse>(
                                        future: BuscarServicosCall.call(
                                          valorMin: _model.valorMinValue,
                                          valorMax: _model.valorMaxValue,
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
                                                    FlutterFlowTheme.of(context)
                                                        .chamoisee,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          final listViewBuscarServicosResponse =
                                              snapshot.data!;

                                          return Builder(
                                            builder: (context) {
                                              final resultadoBuscarServico2 =
                                                  listViewBuscarServicosResponse
                                                      .jsonBody
                                                      .toList();

                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                primary: false,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount:
                                                    resultadoBuscarServico2
                                                        .length,
                                                itemBuilder: (context,
                                                    resultadoBuscarServico2Index) {
                                                  final resultadoBuscarServico2Item =
                                                      resultadoBuscarServico2[
                                                          resultadoBuscarServico2Index];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                10.0, 10.0),
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
                                                            'ENCONTRAR_SALAO_Container_t6g6xjwp_ON_TA');
                                                        if (getJsonField(
                                                              resultadoBuscarServico2Item,
                                                              r'''$.id_salao''',
                                                            ) !=
                                                            null) {
                                                          logFirebaseEvent(
                                                              'Container_navigate_to');

                                                          context.pushNamed(
                                                            'Cliente-PerfilSalao',
                                                            queryParameters: {
                                                              'refSalao':
                                                                  serializeParam(
                                                                getJsonField(
                                                                  resultadoBuscarServico2Item,
                                                                  r'''$.id_salao''',
                                                                ).toString(),
                                                                ParamType
                                                                    .String,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        } else {
                                                          logFirebaseEvent(
                                                              'Container_navigate_to');

                                                          context.pushNamed(
                                                            'Cliente-PerfilProfissional',
                                                            queryParameters: {
                                                              'refProfissional':
                                                                  serializeParam(
                                                                getJsonField(
                                                                  resultadoBuscarServico2Item,
                                                                  r'''$.id_prof''',
                                                                ).toString(),
                                                                ParamType
                                                                    .String,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        }
                                                      },
                                                      child: Container(
                                                        width: 74.0,
                                                        height: 89.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .dun,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                              child: FutureBuilder<
                                                                  List<
                                                                      ProfissionalRow>>(
                                                                future: ProfissionalTable()
                                                                    .querySingleRow(
                                                                  queryFn: (q) =>
                                                                      q.eqOrNull(
                                                                    'id_prof',
                                                                    getJsonField(
                                                                      resultadoBuscarServico2Item,
                                                                      r'''$.id_prof''',
                                                                    ).toString(),
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
                                                                            FlutterFlowTheme.of(context).chamoisee,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  List<ProfissionalRow>
                                                                      columnProfissionalRowList =
                                                                      snapshot
                                                                          .data!;

                                                                  final columnProfissionalRow = columnProfissionalRowList
                                                                          .isNotEmpty
                                                                      ? columnProfissionalRowList
                                                                          .first
                                                                      : null;

                                                                  return Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        getJsonField(
                                                                          resultadoBuscarServico2Item,
                                                                          r'''$.nome''',
                                                                        ).toString(),
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Readex Pro',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Text(
                                                                            'Categoria: ',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            getJsonField(
                                                                              resultadoBuscarServico2Item,
                                                                              r'''$.categoria''',
                                                                            ).toString(),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Text(
                                                                            'R\$',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            getJsonField(
                                                                              resultadoBuscarServico2Item,
                                                                              r'''$.valor''',
                                                                            ).toString(),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            '- ',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            getJsonField(
                                                                              resultadoBuscarServico2Item,
                                                                              r'''$.tempo''',
                                                                            ).toString(),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                2.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              'minutos',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Readex Pro',
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              FutureBuilder<List<SalaoRow>>(
                                                                                future: SalaoTable().querySingleRow(
                                                                                  queryFn: (q) => q.eqOrNull(
                                                                                    'id_salao',
                                                                                    getJsonField(
                                                                                      resultadoBuscarServico2Item,
                                                                                      r'''$.id_salao''',
                                                                                    ).toString(),
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
                                                                                  List<SalaoRow> textSalaoRowList = snapshot.data!;

                                                                                  final textSalaoRow = textSalaoRowList.isNotEmpty ? textSalaoRowList.first : null;

                                                                                  return Text(
                                                                                    valueOrDefault<String>(
                                                                                      getJsonField(
                                                                                                resultadoBuscarServico2Item,
                                                                                                r'''$.id_salao''',
                                                                                              ) !=
                                                                                              null
                                                                                          ? textSalaoRow?.nome
                                                                                          : valueOrDefault<String>(
                                                                                              columnProfissionalRow?.nome,
                                                                                              'sem nome',
                                                                                            ),
                                                                                      'sem nome',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Readex Pro',
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  );
                                                                                },
                                                                              ),
                                                                              Text(
                                                                                ' - ',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Readex Pro',
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                              Text(
                                                                                '4km',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Readex Pro',
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                FFButtonWidget(
                                                                  onPressed:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'ENCONTRAR_SALAO_PAGE_AGENDAR_BTN_ON_TAP');
                                                                    if (getJsonField(
                                                                          resultadoBuscarServico2Item,
                                                                          r'''$.id_salao''',
                                                                        ) !=
                                                                        null) {
                                                                      logFirebaseEvent(
                                                                          'Button_navigate_to');

                                                                      context
                                                                          .pushNamed(
                                                                        'AgendarComSalao',
                                                                        queryParameters:
                                                                            {
                                                                          'refSalao':
                                                                              serializeParam(
                                                                            getJsonField(
                                                                              resultadoBuscarServico2Item,
                                                                              r'''$.id_salao''',
                                                                            ).toString(),
                                                                            ParamType.String,
                                                                          ),
                                                                          'refServico':
                                                                              serializeParam(
                                                                            getJsonField(
                                                                              resultadoBuscarServico2Item,
                                                                              r'''$.id_servico''',
                                                                            ).toString(),
                                                                            ParamType.String,
                                                                          ),
                                                                        }.withoutNulls,
                                                                      );
                                                                    } else {
                                                                      logFirebaseEvent(
                                                                          'Button_navigate_to');

                                                                      context
                                                                          .pushNamed(
                                                                        'AgendarComProf',
                                                                        queryParameters:
                                                                            {
                                                                          'refProf':
                                                                              serializeParam(
                                                                            getJsonField(
                                                                              resultadoBuscarServico2Item,
                                                                              r'''$.id_prof''',
                                                                            ).toString(),
                                                                            ParamType.String,
                                                                          ),
                                                                          'refServico':
                                                                              serializeParam(
                                                                            getJsonField(
                                                                              resultadoBuscarServico2Item,
                                                                              r'''$.id_servico''',
                                                                            ).toString(),
                                                                            ParamType.String,
                                                                          ),
                                                                        }.withoutNulls,
                                                                      );
                                                                    }
                                                                  },
                                                                  text:
                                                                      'Agendar',
                                                                  options:
                                                                      FFButtonOptions(
                                                                    width:
                                                                        120.0,
                                                                    height:
                                                                        30.0,
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
                                                                        ),
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
                                                              ].divide(SizedBox(
                                                                  height:
                                                                      10.0)),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          );
                                        },
                                      ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 0.0, 0.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (_model.domicilioValue == false)
                                      FutureBuilder<ApiCallResponse>(
                                        future: BuscarProfissionaisCall.call(
                                          variavelDeBusca:
                                              _model.textController.text,
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
                                                    FlutterFlowTheme.of(context)
                                                        .chamoisee,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          final listViewSemFiltrosBuscarProfissionaisResponse =
                                              snapshot.data!;

                                          return Builder(
                                            builder: (context) {
                                              final respBuscarProfSemFiltro =
                                                  listViewSemFiltrosBuscarProfissionaisResponse
                                                      .jsonBody
                                                      .toList();

                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                primary: false,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount:
                                                    respBuscarProfSemFiltro
                                                        .length,
                                                itemBuilder: (context,
                                                    respBuscarProfSemFiltroIndex) {
                                                  final respBuscarProfSemFiltroItem =
                                                      respBuscarProfSemFiltro[
                                                          respBuscarProfSemFiltroIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                10.0, 10.0),
                                                    child: Container(
                                                      width: 100.0,
                                                      height: 91.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .dun,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      child: Row(
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
                                                                        10.0,
                                                                        5.0,
                                                                        0.0,
                                                                        5.0),
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                logFirebaseEvent(
                                                                    'ENCONTRAR_SALAO_PAGE_Row_85nbsviv_ON_TAP');
                                                                logFirebaseEvent(
                                                                    'Row_navigate_to');

                                                                context
                                                                    .pushNamed(
                                                                  'Cliente-PerfilProfissional',
                                                                  queryParameters:
                                                                      {
                                                                    'refProfissional':
                                                                        serializeParam(
                                                                      getJsonField(
                                                                        respBuscarProfSemFiltroItem,
                                                                        r'''$.id_prof''',
                                                                      ).toString(),
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );
                                                              },
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Container(
                                                                    width: 90.0,
                                                                    height:
                                                                        90.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .chamoisee,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .customColor2,
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
                                                                            BorderRadius.circular(8.0),
                                                                        child: Image
                                                                            .network(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            getJsonField(
                                                                              respBuscarProfSemFiltroItem,
                                                                              r'''$.foto''',
                                                                            )?.toString(),
                                                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/saloes-v0eeqm/assets/x5qq3eogp6d4/sem-foto.jpg',
                                                                          ),
                                                                          width:
                                                                              250.0,
                                                                          height:
                                                                              150.0,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            50.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          125.0,
                                                                      height:
                                                                          100.0,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Text(
                                                                            getJsonField(
                                                                              respBuscarProfSemFiltroItem,
                                                                              r'''$.nome''',
                                                                            ).toString(),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            getJsonField(
                                                                              respBuscarProfSemFiltroItem,
                                                                              r'''$.especialidade''',
                                                                            ).toString(),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            'Distância',
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                          FutureBuilder<
                                                                              List<SalaoRow>>(
                                                                            future:
                                                                                SalaoTable().querySingleRow(
                                                                              queryFn: (q) => q.eqOrNull(
                                                                                'id_salao',
                                                                                getJsonField(
                                                                                  respBuscarProfSemFiltroItem,
                                                                                  r'''$.filiado_salao''',
                                                                                ).toString(),
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
                                                                                    child: CircularProgressIndicator(
                                                                                      valueColor: AlwaysStoppedAnimation<Color>(
                                                                                        FlutterFlowTheme.of(context).chamoisee,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              }
                                                                              List<SalaoRow> textSalaoRowList = snapshot.data!;

                                                                              final textSalaoRow = textSalaoRowList.isNotEmpty ? textSalaoRowList.first : null;

                                                                              return Text(
                                                                                valueOrDefault<String>(
                                                                                  getJsonField(
                                                                                            respBuscarProfSemFiltroItem,
                                                                                            r'''$.filiado_salao''',
                                                                                          ) !=
                                                                                          null
                                                                                      ? textSalaoRow?.nome
                                                                                      : 'Autônomo',
                                                                                  'a',
                                                                                ),
                                                                                textAlign: TextAlign.center,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Readex Pro',
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              );
                                                                            },
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, -1.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          10.0,
                                                                          0.0),
                                                              child: InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'ENCONTRAR_SALAO_PAGE_favorito_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'favorito_backend_call');
                                                                  _model.favoritosProf =
                                                                      await FavoritosTable()
                                                                          .queryRows(
                                                                    queryFn:
                                                                        (q) =>
                                                                            q,
                                                                  );
                                                                  if (functions.verificarFavorito(
                                                                          currentUserUid,
                                                                          getJsonField(
                                                                            respBuscarProfSemFiltroItem,
                                                                            r'''$.id_prof''',
                                                                          ).toString(),
                                                                          'Profissional',
                                                                          _model.favoritosProf?.toList()) ==
                                                                      false) {
                                                                    logFirebaseEvent(
                                                                        'favorito_backend_call');
                                                                    await FavoritosTable()
                                                                        .insert({
                                                                      'id_cliente':
                                                                          currentUserUid,
                                                                      'id_prof':
                                                                          getJsonField(
                                                                        respBuscarProfSemFiltroItem,
                                                                        r'''$.id_prof''',
                                                                      ).toString(),
                                                                    });
                                                                  } else {
                                                                    logFirebaseEvent(
                                                                        'favorito_backend_call');
                                                                    await FavoritosTable()
                                                                        .delete(
                                                                      matchingRows: (rows) => rows
                                                                          .eqOrNull(
                                                                            'id_cliente',
                                                                            currentUserUid,
                                                                          )
                                                                          .eqOrNull(
                                                                            'id_prof',
                                                                            getJsonField(
                                                                              respBuscarProfSemFiltroItem,
                                                                              r'''$.id_prof''',
                                                                            ).toString(),
                                                                          ),
                                                                    );
                                                                  }

                                                                  logFirebaseEvent(
                                                                      'favorito_backend_call');
                                                                  _model.posFavoritosProf =
                                                                      await FavoritosTable()
                                                                          .queryRows(
                                                                    queryFn:
                                                                        (q) =>
                                                                            q,
                                                                  );
                                                                  logFirebaseEvent(
                                                                      'favorito_update_page_state');
                                                                  _model.listaFavoritos = _model
                                                                      .posFavoritosProf!
                                                                      .toList()
                                                                      .cast<
                                                                          FavoritosRow>();
                                                                  safeSetState(
                                                                      () {});

                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: 30.0,
                                                                  height: 30.0,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      if (functions.verificarFavorito(
                                                                              currentUserUid,
                                                                              getJsonField(
                                                                                respBuscarProfSemFiltroItem,
                                                                                r'''$.id_prof''',
                                                                              ).toString(),
                                                                              'Profissional',
                                                                              _model.listaFavoritos.toList()) ==
                                                                          false)
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              1.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Icon(
                                                                            Icons.favorite_border,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            size:
                                                                                28.0,
                                                                          ),
                                                                        ),
                                                                      if (functions.verificarFavorito(
                                                                              currentUserUid,
                                                                              getJsonField(
                                                                                respBuscarProfSemFiltroItem,
                                                                                r'''$.id_prof''',
                                                                              ).toString(),
                                                                              'Profissional',
                                                                              _model.listaFavoritos.toList()) ==
                                                                          true)
                                                                        Icon(
                                                                          Icons
                                                                              .favorite_sharp,
                                                                          color:
                                                                              Color(0xFFEB4444),
                                                                          size:
                                                                              28.0,
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    if (_model.domicilioValue != null)
                                      FutureBuilder<ApiCallResponse>(
                                        future: BuscarProfissionaisCall.call(
                                          variavelDeBusca:
                                              _model.textController.text,
                                          domi:
                                              _model.tabBarCurrentIndex != null
                                                  ? true
                                                  : false,
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
                                                    FlutterFlowTheme.of(context)
                                                        .chamoisee,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          final listViewComFiltrosBuscarProfissionaisResponse =
                                              snapshot.data!;

                                          return Builder(
                                            builder: (context) {
                                              final buscarProfResp =
                                                  listViewComFiltrosBuscarProfissionaisResponse
                                                      .jsonBody
                                                      .toList();

                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount:
                                                    buscarProfResp.length,
                                                itemBuilder: (context,
                                                    buscarProfRespIndex) {
                                                  final buscarProfRespItem =
                                                      buscarProfResp[
                                                          buscarProfRespIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                10.0, 10.0),
                                                    child: Container(
                                                      width: 100.0,
                                                      height: 85.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .dun,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      child: Row(
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
                                                                        10.0,
                                                                        5.0,
                                                                        0.0,
                                                                        5.0),
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                logFirebaseEvent(
                                                                    'ENCONTRAR_SALAO_PAGE_Row_eh1ja1ri_ON_TAP');
                                                                logFirebaseEvent(
                                                                    'Row_navigate_to');

                                                                context
                                                                    .pushNamed(
                                                                  'Cliente-PerfilProfissional',
                                                                  queryParameters:
                                                                      {
                                                                    'refProfissional':
                                                                        serializeParam(
                                                                      getJsonField(
                                                                        buscarProfRespItem,
                                                                        r'''$.id_prof''',
                                                                      ).toString(),
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );
                                                              },
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Container(
                                                                    width: 90.0,
                                                                    height:
                                                                        90.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .chamoisee,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .customColor2,
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
                                                                            BorderRadius.circular(8.0),
                                                                        child: Image
                                                                            .network(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            getJsonField(
                                                                              buscarProfRespItem,
                                                                              r'''$.foto''',
                                                                            )?.toString(),
                                                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/saloes-v0eeqm/assets/x5qq3eogp6d4/sem-foto.jpg',
                                                                          ),
                                                                          width:
                                                                              250.0,
                                                                          height:
                                                                              150.0,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            50.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          125.0,
                                                                      height:
                                                                          100.0,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Text(
                                                                            getJsonField(
                                                                              buscarProfRespItem,
                                                                              r'''$.nome''',
                                                                            ).toString(),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            getJsonField(
                                                                              buscarProfRespItem,
                                                                              r'''$.especialidade''',
                                                                            ).toString(),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            'Distância',
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                          FutureBuilder<
                                                                              List<SalaoRow>>(
                                                                            future:
                                                                                SalaoTable().querySingleRow(
                                                                              queryFn: (q) => q.eqOrNull(
                                                                                'id_salao',
                                                                                getJsonField(
                                                                                  buscarProfRespItem,
                                                                                  r'''$.filiado_salao''',
                                                                                ).toString(),
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
                                                                                    child: CircularProgressIndicator(
                                                                                      valueColor: AlwaysStoppedAnimation<Color>(
                                                                                        FlutterFlowTheme.of(context).chamoisee,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              }
                                                                              List<SalaoRow> textSalaoRowList = snapshot.data!;

                                                                              final textSalaoRow = textSalaoRowList.isNotEmpty ? textSalaoRowList.first : null;

                                                                              return Text(
                                                                                valueOrDefault<String>(
                                                                                  getJsonField(
                                                                                            buscarProfRespItem,
                                                                                            r'''$.filiado_salao''',
                                                                                          ) !=
                                                                                          null
                                                                                      ? textSalaoRow?.nome
                                                                                      : 'Autônomo',
                                                                                  'a',
                                                                                ),
                                                                                textAlign: TextAlign.center,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Readex Pro',
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              );
                                                                            },
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, -1.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          10.0,
                                                                          0.0),
                                                              child: InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'ENCONTRAR_SALAO_PAGE_favorito_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'favorito_backend_call');
                                                                  _model.favoritosProfBusca =
                                                                      await FavoritosTable()
                                                                          .queryRows(
                                                                    queryFn:
                                                                        (q) =>
                                                                            q,
                                                                  );
                                                                  if (functions.verificarFavorito(
                                                                          currentUserUid,
                                                                          getJsonField(
                                                                            buscarProfRespItem,
                                                                            r'''$.id_prof''',
                                                                          ).toString(),
                                                                          'Profissional',
                                                                          _model.favoritosProfBusca?.toList()) ==
                                                                      false) {
                                                                    logFirebaseEvent(
                                                                        'favorito_backend_call');
                                                                    await FavoritosTable()
                                                                        .insert({
                                                                      'id_cliente':
                                                                          currentUserUid,
                                                                      'id_prof':
                                                                          getJsonField(
                                                                        buscarProfRespItem,
                                                                        r'''$.id_prof''',
                                                                      ).toString(),
                                                                    });
                                                                  } else {
                                                                    logFirebaseEvent(
                                                                        'favorito_backend_call');
                                                                    await FavoritosTable()
                                                                        .delete(
                                                                      matchingRows: (rows) => rows
                                                                          .eqOrNull(
                                                                            'id_cliente',
                                                                            currentUserUid,
                                                                          )
                                                                          .eqOrNull(
                                                                            'id_prof',
                                                                            getJsonField(
                                                                              buscarProfRespItem,
                                                                              r'''$.id_prof''',
                                                                            ).toString(),
                                                                          ),
                                                                    );
                                                                  }

                                                                  logFirebaseEvent(
                                                                      'favorito_backend_call');
                                                                  _model.posFavoritosProfBusca =
                                                                      await FavoritosTable()
                                                                          .queryRows(
                                                                    queryFn:
                                                                        (q) =>
                                                                            q,
                                                                  );
                                                                  logFirebaseEvent(
                                                                      'favorito_update_page_state');
                                                                  _model.listaFavoritos = _model
                                                                      .posFavoritosProfBusca!
                                                                      .toList()
                                                                      .cast<
                                                                          FavoritosRow>();
                                                                  safeSetState(
                                                                      () {});

                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: 30.0,
                                                                  height: 30.0,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      if (functions.verificarFavorito(
                                                                              currentUserUid,
                                                                              getJsonField(
                                                                                buscarProfRespItem,
                                                                                r'''$.id_prof''',
                                                                              ).toString(),
                                                                              'Profissional',
                                                                              _model.listaFavoritos.toList()) ==
                                                                          false)
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              1.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Icon(
                                                                            Icons.favorite_border,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            size:
                                                                                28.0,
                                                                          ),
                                                                        ),
                                                                      if (functions.verificarFavorito(
                                                                              currentUserUid,
                                                                              getJsonField(
                                                                                buscarProfRespItem,
                                                                                r'''$.id_prof''',
                                                                              ).toString(),
                                                                              'Profissional',
                                                                              _model.listaFavoritos.toList()) ==
                                                                          true)
                                                                        Icon(
                                                                          Icons
                                                                              .favorite_sharp,
                                                                          color:
                                                                              Color(0xFFEB4444),
                                                                          size:
                                                                              28.0,
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          );
                                        },
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    decoration: BoxDecoration(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
