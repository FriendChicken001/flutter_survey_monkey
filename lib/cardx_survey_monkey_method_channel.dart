import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'cardx_survey_monkey_platform_interface.dart';

class MethodChannelCardxSurveyMonkey extends CardxSurveyMonkeyPlatform {
  @visibleForTesting
  final methodChannel = const MethodChannel('cardx_survey_monkey');

  @override
  Future<String?> startSurveyMonkey(String hash) async {
    final result = await methodChannel.invokeMethod<String>(
      'startSurveyMonkey',
      {
        "hash": hash,
      },
    );
    return result;
  }

  @override
  void initSurveyListener(Function(String?) onResult) {
    methodChannel.setMethodCallHandler(
      (call) async {
        if (call.method == "surveyResult") {
          final result = call.arguments as String?;
          onResult(result);
        }
      },
    );
  }
}
