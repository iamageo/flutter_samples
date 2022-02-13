import '../network/result.dart';

class Quiz {
  late int? responseCode;
  late List<Results> results;

  Quiz({required this.responseCode, required this.results});

  Quiz.fromJson(Map<String, dynamic> json) {
    responseCode = json['response_code'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['response_code'] = responseCode;
    data['results'] = results.map((v) => v.toJson()).toList();
    return data;
  }
}

