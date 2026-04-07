import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class EnviarCuestionarioCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? website = '',
    String? phone = '',
    String? mensaje = '',
    String? nombre = '',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "${escapeStringForJson(email)}",
  "website": "${escapeStringForJson(website)}",
  "phone": "${escapeStringForJson(phone)}",
  "mensaje": "${escapeStringForJson(mensaje)}",
  "nombre": "${escapeStringForJson(nombre)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'EnviarCuestionario',
      apiUrl: 'https://hook.eu2.make.com/7yunib3jhovojyqr7gxt9b968qjlxw5g',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SendEmailSendGridCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? web = '',
    String? telefono = '',
    String? mensaje = '',
  }) async {
    final ffApiRequestBody = '''
{
  "personalizations": [
    {
      "to": [
        { "email": "fcazanam@gmail.com" }
      ],
      "subject": "📩 Nuevo formulario en AfilIA"
    }
  ],
  "from": { "email": "contacto@afiliaia.com" },
  "content": [
    {
      "type": "text/plain",
      "value": "Has recibido un nuevo lead:\\n\\nEmail: {{email}}\\nWeb: {{web}}\\nTeléfono: {{telefono}}\\nMensaje: {{mensaje}}"
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SendEmailSendGrid',
      apiUrl: 'https://api.sendgrid.com/v3/mail/send',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer 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',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
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

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
