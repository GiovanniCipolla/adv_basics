import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_screen.dart';
import 'package:adv_basics/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/results_screen.dart';

// un widget Stateful ha sempre due classi.
// la prima dove andrà il costruttore e l'override
// la seconda estendera la prima , e ci sarà il build con la logica all'interno

class Quiz extends StatefulWidget {
  const Quiz({super.key}); // costruttore , passare sempre la key!
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  void reStartQuiz() {
    selectedAnswers = [];
    setState(() {
      activeScreen = 'questions_screen';
    });
  }

  var activeScreen =
      'start-screen'; // variabile che contiene la 'schermata' da far vedere

  void switchScreen() {
    // creazione di un metodo che deve cambiare la variabile della 'schermata'
    setState(() {
      // funzione importatissima, per mette di ricaricare la pagina, è nel metodo in modo che viene eseguito
      activeScreen =
          'question-screen'; // la logica del metodo, cambiare 'schermata' nella variabie
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = activeScreen == 'start-screen'
        ? StartScreen(
            switchScreen) // costruttore che ciameremo , passando la funziona che dovrà cambiare schermata,
        // perhcè quella pagina dovrà fare solo quello
        : QuestionsScreen(
            onSelectAnswer:
                chooseAnswer, // mentre questa pagina non avrà il compito di cambiare schermata ma quella di salvare tutte le risposte
          ); // inizializziamo una variabile che sarà uguale alla 'schermata'
    // in modo da decidere cosa vedremo inizialmente

    if (activeScreen == 'results-screen') {
      screenWidget = ResultScreen(
          chosenAnswer: selectedAnswers, buttonRestartQuiz: reStartQuiz);
    }

    return MaterialApp(
      // configurazione di stile , regole , setup già impostato.
      home: Scaffold(
        // interfaccia che vedrà l'utente, configurata da Material App
        body: Container(
          // un container all'interno dello scaffold, dove configureremo i colori, lo sfondo e la 'schermata' da far vedere
          decoration: const BoxDecoration(
            // setup del container, colori,sfondi ecc
            gradient: LinearGradient(
              // gradiente
              colors: [
                Color.fromARGB(255, 202, 53, 42),
                Color.fromARGB(255, 211, 120, 114)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child:
              screenWidget, // schermata da far vedere, in questa app abbiamo due schermate. start screen e questionscreen
        ),
      ),
    );
  }
}

// in teoria, potrei creare un widget che contenga MaterialApp, scaffold, container ..
//e che nel costruttore per crearlo ci sarà un required widget che sarà la schermata
