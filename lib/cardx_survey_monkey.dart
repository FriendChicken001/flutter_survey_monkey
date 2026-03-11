import 'package:cardx_survey_monkey/model/cardx_survey_monkey_response.dart';

import 'cardx_survey_monkey_platform_interface.dart';

class CardxSurveyMonkey {
  Future<String?> startSurveyMonkey({
    String? appName,
    required String hash,
  }) {
    return CardxSurveyMonkeyPlatform.instance.startSurveyMonkey(
      appName: appName,
      hash: hash,
    );
  }

  void initSurveyListener(Function(CardXSurveyMonkeyResponse?) onResult) {
    CardxSurveyMonkeyPlatform.instance.initSurveyListener(onResult);
  }
}
