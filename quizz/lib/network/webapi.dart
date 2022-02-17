import 'dart:convert';

import 'package:http/http.dart';
import 'package:http_interceptor/http_client_with_interceptor.dart';
import 'package:http_interceptor/interceptor_contract.dart';
import 'package:http_interceptor/models/request_data.dart';
import 'package:http_interceptor/models/response_data.dart';
import 'package:quizz/network/result.dart';

import '../model/quiz.dart';

class RemoteServices {
  Future<List<QuestionItem>> fetchQuestions(int questionsNumber) async {
    late Quiz quiz;

    final Client client =
        HttpClientWithInterceptor.build(interceptors: [LoggingInterceptor()]);
    var res = await client.get("https://opentdb.com/api.php?amount=$questionsNumber");
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
