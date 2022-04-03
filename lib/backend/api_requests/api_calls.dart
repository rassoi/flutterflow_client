import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

class SetingredCall {
  static Future<ApiCallResponse> call({
    String recipeId = '',
  }) {
    final body = '''
{
  "message": "${recipeId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'setingred',
      apiUrl: 'https://us-central1-rassoi-767af.cloudfunctions.net/function-3',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'recipe_id': recipeId,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class RemoveIngredAsPerRecipeCall {
  static Future<ApiCallResponse> call({
    String recipeId = '',
  }) {
    final body = '''
{
  "message": "${recipeId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'removeIngredAsPerRecipe',
      apiUrl:
          'https://us-central1-rassoi-767af.cloudfunctions.net/remove_ingreds_of_a_recipe',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'recipe_id': recipeId,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}
