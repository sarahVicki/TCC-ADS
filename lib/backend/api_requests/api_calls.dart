import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class BuscarLugaresCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'BuscarLugares',
      apiUrl: 'https://eoocwftqshausldpnzqe.supabase.co/rest/v1/salao',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            '',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? coordenadas(dynamic response) => (getJsonField(
        response,
        r'''$[:].coordenadas''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class BuscarSaloesCall {
  static Future<ApiCallResponse> call({
    String? variavelDeBusca = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'BuscarSaloes',
      apiUrl:
          'https://eoocwftqshausldpnzqe.supabase.co/rest/v1/salao?nome=ilike.*${variavelDeBusca}*&select=*',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            '',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVvb2N3ZnRxc2hhdXNsZHBuenFlIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjE2NzY4NDQsImV4cCI6MjAzNzI1Mjg0NH0.Qa0oD--zqRj6jh-cx7Nnf7Z1hkHlKJITGbgpGvY1634',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class BuscarServicosCall {
  static Future<ApiCallResponse> call({
    String? variavelDeBusca = '',
    String? cat = '',
    double? valorMin,
    double? valorMax,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'BuscarServicos',
      apiUrl:
          'https://eoocwftqshausldpnzqe.supabase.co/rest/v1/servicos?categoria=ilike.*${cat}*&nome=ilike.*${variavelDeBusca}*&valor>=gte.${valorMin}&valor=lte.${valorMax}&select=*',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            '',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVvb2N3ZnRxc2hhdXNsZHBuenFlIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjE2NzY4NDQsImV4cCI6MjAzNzI1Mjg0NH0.Qa0oD--zqRj6jh-cx7Nnf7Z1hkHlKJITGbgpGvY1634',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class BuscarProfissionaisCall {
  static Future<ApiCallResponse> call({
    String? variavelDeBusca = '',
    bool? domi = true,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'BuscarProfissionais',
      apiUrl:
          'https://eoocwftqshausldpnzqe.supabase.co/rest/v1/profissional?nome=ilike.*${variavelDeBusca}*&domicilio=eq.${domi}&select=*',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVvb2N3ZnRxc2hhdXNsZHBuenFlIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjE2NzY4NDQsImV4cCI6MjAzNzI1Mjg0NH0.Qa0oD--zqRj6jh-cx7Nnf7Z1hkHlKJITGbgpGvY1634',
        'apikey':
            '',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ListarProfissionaisCall {
  static Future<ApiCallResponse> call({
    String? variavelDeBusca = '',
    String? idsalao = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'ListarProfissionais',
      apiUrl:
          'https://eoocwftqshausldpnzqe.supabase.co/rest/v1/profissional?nome=ilike.*${variavelDeBusca}*&filiado_salao=like*${idsalao}*&select=*',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            '',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVvb2N3ZnRxc2hhdXNsZHBuenFlIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjE2NzY4NDQsImV4cCI6MjAzNzI1Mjg0NH0.Qa0oD--zqRj6jh-cx7Nnf7Z1hkHlKJITGbgpGvY1634',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class BuscarEnderecosCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'BuscarEnderecos',
      apiUrl:
          'https://eoocwftqshausldpnzqe.supabase.co/rest/v1/endereco?select=*',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            '',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SearchProfissionaisCall {
  static Future<ApiCallResponse> call({
    String? variavelDeBusca = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'searchProfissionais',
      apiUrl:
          'https://eoocwftqshausldpnzqe.supabase.co/rest/v1/profissional?nome=ilike.*${variavelDeBusca}*&select=*',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            '',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVvb2N3ZnRxc2hhdXNsZHBuenFlIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjE2NzY4NDQsImV4cCI6MjAzNzI1Mjg0NH0.Qa0oD--zqRj6jh-cx7Nnf7Z1hkHlKJITGbgpGvY1634',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class FiltraNomeServicosCall {
  static Future<ApiCallResponse> call({
    String? variavelDeBusca = '',
    double? valorMin,
    double? valorMax,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'FiltraNomeServicos',
      apiUrl:
          'https://eoocwftqshausldpnzqe.supabase.co/rest/v1/servicos?nome=ilike.*${variavelDeBusca}*&valor>=gte.${valorMin}&valor=lte.${valorMax}&select=*',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            '',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVvb2N3ZnRxc2hhdXNsZHBuenFlIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjE2NzY4NDQsImV4cCI6MjAzNzI1Mjg0NH0.Qa0oD--zqRj6jh-cx7Nnf7Z1hkHlKJITGbgpGvY1634',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
