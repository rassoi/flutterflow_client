import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

class SetingredCall {
  static Future<ApiCallResponse> call({
    String ingredId = '',
  }) {
    final body = '''
{
  "message": "${ingredId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'setingred',
      apiUrl: 'https://us-central1-rassoi-767af.cloudfunctions.net/function-3',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'ingred_id': ingredId,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}
