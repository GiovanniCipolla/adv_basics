import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_summary.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.chosenAnswer, required this.buttonRestartQuiz});

  final List<String> chosenAnswer;
  final void Function()  buttonRestartQuiz;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswer.length; i++) {
      summary.add({
        'question-index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answer[0],
        'user_answer': chosenAnswer[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestion = questions.length;
    // il where ,come il map non modifica l'originale.
    // si scriverà una condizione l'elemento che la rispetterà verrà aggiunto nel nuovo elenco
    final numCorrectQuestion = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      // inseriamo tutto in un sizedBox, all'interno un container
      width: double
          .infinity, // configuriamo il layout e decidiamo di fare colonne (domanda,risposte)
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'you answered $numCorrectQuestion out of $numTotalQuestion questions correctly!!', style:  const TextStyle(color: Color.fromARGB(255, 245, 239, 239), fontSize: 18),),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData: summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton(onPressed: buttonRestartQuiz, child: const Text('restart Quiz')),
          ],
        ),
      ),
    );
  }
}
