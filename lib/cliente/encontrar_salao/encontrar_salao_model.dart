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
import 'encontrar_salao_widget.dart' show EncontrarSalaoWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EncontrarSalaoModel extends FlutterFlowModel<EncontrarSalaoWidget> {
  ///  Local state fields for this page.

  List<DtlocalStruct> local = [];
  void addToLocal(DtlocalStruct item) => local.add(item);
  void removeFromLocal(DtlocalStruct item) => local.remove(item);
  void removeAtIndexFromLocal(int index) => local.removeAt(index);
  void insertAtIndexInLocal(int index, DtlocalStruct item) =>
      local.insert(index, item);
  void updateLocalAtIndex(int index, Function(DtlocalStruct) updateFn) =>
      local[index] = updateFn(local[index]);

  List<String> campos = ['coordenadas'];
  void addToCampos(String item) => campos.add(item);
  void removeFromCampos(String item) => campos.remove(item);
  void removeAtIndexFromCampos(int index) => campos.removeAt(index);
  void insertAtIndexInCampos(int index, String item) =>
      campos.insert(index, item);
  void updateCamposAtIndex(int index, Function(String) updateFn) =>
      campos[index] = updateFn(campos[index]);

  List<double> distancia = [];
  void addToDistancia(double item) => distancia.add(item);
  void removeFromDistancia(double item) => distancia.remove(item);
  void removeAtIndexFromDistancia(int index) => distancia.removeAt(index);
  void insertAtIndexInDistancia(int index, double item) =>
      distancia.insert(index, item);
  void updateDistanciaAtIndex(int index, Function(double) updateFn) =>
      distancia[index] = updateFn(distancia[index]);

  LatLng? localAtual;

  List<FavoritosRow> listaFavoritos = [];
  void addToListaFavoritos(FavoritosRow item) => listaFavoritos.add(item);
  void removeFromListaFavoritos(FavoritosRow item) =>
      listaFavoritos.remove(item);
  void removeAtIndexFromListaFavoritos(int index) =>
      listaFavoritos.removeAt(index);
  void insertAtIndexInListaFavoritos(int index, FavoritosRow item) =>
      listaFavoritos.insert(index, item);
  void updateListaFavoritosAtIndex(
          int index, Function(FavoritosRow) updateFn) =>
      listaFavoritos[index] = updateFn(listaFavoritos[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in EncontrarSalao widget.
  List<FavoritosRow>? buscaFavoritos;
  // Stores action output result for [Backend Call - API (BuscarLugares)] action in EncontrarSalao widget.
  ApiCallResponse? outResultado;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Stores action output result for [Backend Call - Query Rows] action in ChoiceChips widget.
  List<ServicosRow>? filtroCategoria;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Stores action output result for [Backend Call - Query Rows] action in favorito widget.
  List<FavoritosRow>? favoritos;
  // Stores action output result for [Backend Call - Query Rows] action in favorito widget.
  List<FavoritosRow>? posFavoritos;
  // Stores action output result for [Backend Call - Query Rows] action in favorito widget.
  List<FavoritosRow>? favoritosBusca;
  // Stores action output result for [Backend Call - Query Rows] action in favorito widget.
  List<FavoritosRow>? posFavoritosBusca;
  Completer<ApiCallResponse>? apiRequestCompleter;
  // Stores action output result for [Backend Call - Query Rows] action in favorito widget.
  List<FavoritosRow>? favoritosProf;
  // Stores action output result for [Backend Call - Query Rows] action in favorito widget.
  List<FavoritosRow>? posFavoritosProf;
  // Stores action output result for [Backend Call - Query Rows] action in favorito widget.
  List<FavoritosRow>? favoritosProfBusca;
  // Stores action output result for [Backend Call - Query Rows] action in favorito widget.
  List<FavoritosRow>? posFavoritosProfBusca;
  // State field(s) for ValorMin widget.
  double? valorMinValue;
  // State field(s) for ValorMax widget.
  double? valorMaxValue;
  // State field(s) for domicilio widget.
  bool? domicilioValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    tabBarController?.dispose();
  }

  /// Additional helper methods.
  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
