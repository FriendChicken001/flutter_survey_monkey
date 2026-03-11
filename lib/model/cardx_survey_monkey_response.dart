// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

CardXSurveyMonkeyResponse cardXSurveyMonkeyResponseFromJson(String str) =>
    CardXSurveyMonkeyResponse.fromJson(json.decode(str));

String cardXSurveyMonkeyResponseToJson(CardXSurveyMonkeyResponse data) =>
    json.encode(data.toJson());

class CardXSurveyMonkeyResponse {
  String respondentId;
  String completionStatus;
  DateTime dateModified;
  DateTime dateStart;
  List<Response> responses;

  CardXSurveyMonkeyResponse({
    required this.respondentId,
    required this.completionStatus,
    required this.dateModified,
    required this.dateStart,
    required this.responses,
  });

  factory CardXSurveyMonkeyResponse.fromJson(Map<String, dynamic> json) =>
      CardXSurveyMonkeyResponse(
        respondentId: json["respondent_id"],
        completionStatus: json["completion_status"],
        dateModified: DateTime.parse(json["date_modified"]),
        dateStart: DateTime.parse(json["date_start"]),
        responses: List<Response>.from(
            json["responses"].map((x) => Response.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "respondent_id": respondentId,
        "completion_status": completionStatus,
        "date_modified": dateModified.toIso8601String(),
        "date_start": dateStart.toIso8601String(),
        "responses": List<dynamic>.from(responses.map((x) => x.toJson())),
      };
}

class Response {
  int pageIndex;
  String pageId;
  String questionId;
  int questionIndex;
  String questionValue;
  List<Answer> answers;

  Response({
    required this.pageIndex,
    required this.pageId,
    required this.questionId,
    required this.questionIndex,
    required this.questionValue,
    required this.answers,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        pageIndex: json["page_index"],
        pageId: json["page_id"],
        questionId: json["question_id"],
        questionIndex: json["question_index"],
        questionValue: json["question_value"],
        answers:
            List<Answer>.from(json["answers"].map((x) => Answer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "page_index": pageIndex,
        "page_id": pageId,
        "question_id": questionId,
        "question_index": questionIndex,
        "question_value": questionValue,
        "answers": List<dynamic>.from(answers.map((x) => x.toJson())),
      };
}

class Answer {
  int rowIndex;
  String rowId;
  String rowValue;

  Answer({
    required this.rowIndex,
    required this.rowId,
    required this.rowValue,
  });

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
        rowIndex: json["row_index"],
        rowId: json["row_id"],
        rowValue: json["row_value"],
      );

  Map<String, dynamic> toJson() => {
        "row_index": rowIndex,
        "row_id": rowId,
        "row_value": rowValue,
      };
}
