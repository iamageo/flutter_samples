import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/interceptor_contract.dart';
import 'package:http_interceptor/models/request_data.dart';
import 'package:http_interceptor/models/response_data.dart';
import 'package:quizz/network/result.dart';

import '../model/quiz.dart';

class RemoteServices {
  Future<List<QuestionItem>> fetchQuestions(int number) async {
    late Quiz quiz;

    var url = Uri.http("www.opentdb.com", "/api.php?amount=$number");

    var res = await http.get(
      url,
      headers: {'content-Type': 'application/json', 'charset': 'utf-8'},
    );
    if (res.statusCode == 200) {
      var decRes = jsonDecode(res.body);
      quiz = Quiz.fromJson(decRes);
      return quiz.results;
    } else {
      return [];
    }
  }
}

//interceptor
class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    print(data.toString());
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    print(data.toString());
    return data;
  }
}
