import 'cardx_survey_monkey_platform_interface.dart';

class CardxSurveyMonkey {
  Future<String?> startSurvey(String hash) {
    return CardxSurveyMonkeyPlatform.instance.startSurveyMonkey(hash);
  }

  void initSurveyListener(Function(String?) onResult) {
    CardxSurveyMonkeyPlatform.instance.initSurveyListener(onResult);
  }
}
