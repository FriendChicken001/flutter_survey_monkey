import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'cardx_survey_monkey_method_channel.dart';

abstract class CardxSurveyMonkeyPlatform extends PlatformInterface {
  CardxSurveyMonkeyPlatform() : super(token: _token);

  static final Object _token = Object();

  static CardxSurveyMonkeyPlatform _instance = MethodChannelCardxSurveyMonkey();

  static CardxSurveyMonkeyPlatform get instance => _instance;

  static set instance(CardxSurveyMonkeyPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> startSurveyMonkey(String hash) {
    throw UnimplementedError('surveyMonkey has not been implemented.');
  }

  void initSurveyListener(Function(String?) onResult) {
    throw UnimplementedError('initSurveyListener has not been implemented.');
  }
}
