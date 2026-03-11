import 'package:flutter/material.dart';
import 'package:cardx_survey_monkey/cardx_survey_monkey.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _cardxSurveyMonkeyPlugin = CardxSurveyMonkey();

  @override
  void initState() {
    super.initState();
    _cardxSurveyMonkeyPlugin.initSurveyListener((result) {
      print('Received survey result: $result');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              final x = await _cardxSurveyMonkeyPlugin.startSurvey("C82S6K7");
              print('Survey result: $x');
            },
            child: const Text('Running'),
          ),
        ),
      ),
    );
  }
}
