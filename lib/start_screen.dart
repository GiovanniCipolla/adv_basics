import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// schermata iniziale , di 'benvenuto'. sarà stateless, ovvero FISSO
// il bottone per iniziare il quiz non sarà propriamo del widget per questo non sarà statefull

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz,
      {super.key}); // quando viene chiamato il widget aspettiamo anche che ci passi una funzione
  //( quella per cambiare screen)

  final void Function() startQuiz; // sarà questa la funzione

  @override
  Widget build(BuildContext context) {
// tutta la logica di configurazione. ( ricordo che questo widget sarà contenuto in un container che ha già i suoi colori)
    return Center(
      // centriamo il contenuto
      child: Column(
        // avendo più ' widget' li disporemo per colonne
        mainAxisSize: MainAxisSize.min, // misure delle colonne
        children: [
          // elemnti nelle colonne

          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(128, 255, 255, 255),
          ),

          const SizedBox(
            // box utilizzato per distanziare.
            height: 80,
          ),

          Text(
            'Learn Flutter the fun way!!',
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(
            height: 30,
          ),

          OutlinedButton.icon(
            onPressed: () {
              startQuiz(); // qua chiamiamo la funzione ereditata, la logica sarà dove verrà chiamato il widhìget
              // cambierà la variabile nel widget 'padre'
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text(
              'Start Quiz',
            ),
          ),
        ],
      ),
    );
  }
}
