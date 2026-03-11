import 'package:flutter_test/flutter_test.dart';
import 'package:cardx_survey_monkey/cardx_survey_monkey_platform_interface.dart';
import 'package:cardx_survey_monkey/cardx_survey_monkey_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockCardxSurveyMonkeyPlatform
    with MockPlatformInterfaceMixin
    implements CardxSurveyMonkeyPlatform {
  @override
  Future<String?> startSurveyMonkey(String hash) {
    throw UnimplementedError();
  }

  @override
  void initSurveyListener(Function(String? p1) onResult) {
    throw UnimplementedError();
  }
}

void main() {
  final CardxSurveyMonkeyPlatform initialPlatform =
      CardxSurveyMonkeyPlatform.instance;

  test('$MethodChannelCardxSurveyMonkey is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelCardxSurveyMonkey>());
  });
}
