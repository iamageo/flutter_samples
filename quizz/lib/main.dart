import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:quizz/model/quiz.dart';

import 'components/answer.dart';
import 'network/error.dart';
import 'network/result.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.white),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Quiz quiz;
  late List<Results> results;
  late Color c;
  Random random = Random();

  @override
  void initState() {
    super.initState();
  }

  Future<void> fetchQuestions() async {
    final Client client =
        HttpClientWithInterceptor.build(interceptors: [LoggingInterceptor()]);

    var res = await client.get("https://opentdb.com/api.php?amount=20");
    var decRes = jsonDecode(res.body);
    c = Colors.black;
    quiz = Quiz.fromJson(decRes);
    results = quiz.results;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Quiz App",
            ),
            SizedBox(
              width: 8,
            ),
            Icon(
              Icons.quiz,
              color: Colors.white,
            )
          ],
        ),
        elevation: 1,
      ),
      body: RefreshIndicator(
        onRefresh: fetchQuestions,
        child: FutureBuilder(
            future: fetchQuestions(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return const Text('Press button to start.');
                case ConnectionState.active:
                case ConnectionState.waiting:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case ConnectionState.done:
                  if (snapshot.hasError) return errorData(snapshot);
                  return questionList();
              }
            }),
      ),
    );
  }

  ListView questionList() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      itemCount: results.length,
      itemBuilder: (context, index) => Card(
        color: Colors.white,
        elevation: 1,
        child: QuestionItem(index),
      ),
    );
  }

  ExpansionTile QuestionItem(int index) {
    return ExpansionTile(
      title: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              results[index].question!,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            FittedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FilterChip(
                    backgroundColor: Colors.grey[100],
                    label: Text(results[index].category!),
                    onSelected: (b) {},
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  FilterChip(
                    backgroundColor: Colors.grey[100],
                    label: Text(
                      results[index].difficulty!,
                    ),
                    onSelected: (b) {},
                  )
                ],
              ),
            )
          ],
        ),
      ),
      leading: CircleAvatar(
        backgroundColor: Colors.grey[100],
        child: Text(index.toString()),
      ),
      children: results[index].allAnswers!.map((m) {
        return AnswerWidget(results, index, m);
      }).toList(),
    );
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
