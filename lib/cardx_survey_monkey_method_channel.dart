import 'package:cardx_survey_monkey/model/cardx_survey_monkey_response.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'cardx_survey_monkey_platform_interface.dart';

class MethodChannelCardxSurveyMonkey extends CardxSurveyMonkeyPlatform {
  @visibleForTesting
  final methodChannel = const MethodChannel('cardx_survey_monkey');

  @override
  Future<String?> startSurveyMonkey({
    String? appName,
    required String hash,
  }) async {
    final result = await methodChannel.invokeMethod("startSurveyMonkey", {
      "appName": appName,
      "hash": hash,
    });
    return result;
  }

  @override
  void initSurveyListener(Function(CardXSurveyMonkeyResponse?) onResult) {
    methodChannel.setMethodCallHandler(
      (call) async {
        if (call.method == "surveyResult") {
          final result = call.arguments as String?;
          onResult(
            result != null ? cardXSurveyMonkeyResponseFromJson(result) : null,
          );
        }
      },
    );
  }
}
