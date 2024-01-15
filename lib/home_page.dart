import 'package:flutter/material.dart';
import 'package:quiz_app/quiz_model.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int Index = 0;
  List<Icon> icons = [];
  List<QuizModel> QuestionAnswers = [
    QuizModel(Question: "Кыргызстанда 7 област бар", Answer: true),
    QuizModel(Question: "Кыргызстанда метро бар", Answer: false),
    QuizModel(Question: "Кыргызстанда океан жок", Answer: true),
  ];
  void userChoice(bool userClick) {
    final bizdinClick = QuestionAnswers[Index].Answer;
    if (bizdinClick == userClick) {
      icons.add(
        Icon(Icons.check, size: 50, color: Colors.green),
      );
    } else if (bizdinClick != userClick) {
      icons.add(
        Icon(Icons.cancel, size: 50, color: Colors.red),
      );
    }
    Index++;
    setState(() {});
  }

  String getQuestion() {
    if (Index < QuestionAnswers.length) {
      return QuestionAnswers[Index].Question!;
    } else {
      return "кайра башынан" + [Index].toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Center(
            child: Text(
              "тапшырма 7",
              style: TextStyle(fontSize: 23),
            ),
          )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              getQuestion().toString(),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 32),
            ),
          ),
          JoopWidget(
            tus: Colors.green,
            text: "True",
            onTap: () {
              userChoice(true);
            },
          ),
          const SizedBox(
            height: 20,
          ),
          JoopWidget(
            tus: Colors.red,
            text: "False",
            onTap: () {
              userChoice(false);
            },
          ),
          Row(children: icons),
        ],
      ),
    );
  }
}

class JoopWidget extends StatelessWidget {
  const JoopWidget({
    super.key,
    this.text,
    required this.tus,
    this.onTap,
  });

  final String? text;
  final Color tus;
  final Function()? onTap;
  @override
  Widget build(
    BuildContext context,
  ) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: 50,
        decoration:
            BoxDecoration(color: tus, borderRadius: BorderRadius.circular(6)),
        child: Text(
          text!,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 32, color: Colors.white),
        ),
      ),
    );
  }
}
