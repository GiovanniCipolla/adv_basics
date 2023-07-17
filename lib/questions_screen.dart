import 'package:adv_basics/answer_button.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// widget che conterrà la schermata con le domande e risposte, che cambieranno. 
// Stateful
class QuestionsScreen extends StatefulWidget {

  const QuestionsScreen({super.key, required this.onSelectAnswer });
  // richiediamo il metodo , che selezionerà le risposte date

  final void Function(String answer) onSelectAnswer; 

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}



class _QuestionsScreenState extends State<QuestionsScreen> {

  var currentQuestionIndex = 0;  // abbiamo un elenco di domande e risposte, inseriamo un indice per selezionarle.

  void answerQuestion(String selectedAnswer) {  // metodo che richiamerà il metodo ereditato ( salverò le risposte)
    widget.onSelectAnswer(selectedAnswer);
    setState(() {                              // e ricarichiamo la pagine aggiornando l'indice in modo da cambiare domanda e risposte
      currentQuestionIndex++;
    });
  }

 

 
  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];  // inizializziamo una variabile assegnamo la domanda e risposta 
                                                             // che vogliamo far vedere tramite indice
    return SizedBox(                                         // inseriamo tutto in un sizedBox, all'interno un container
      width: double.infinity,                                // configuriamo il layout e decidiamo di fare colonne (domanda,risposte)
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            Text(        // primo elemento della colonna, variabie inizialmente inizializzata 
              currentQuestion.text, // ci interessa il testo delle domanda. ( abbiamo un model con domanda e elenco di risposte)
              // si aggiornerà sempre grazie al metodo ereditato che chiameremo alla selezione della risposta
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(
              height: 30,
            ),
            
            ...currentQuestion.shuffleAnswer.map((answer) => AnswerButton(
                  answerText: answer,   
                  
                  onTap: () {
                    answerQuestion(answer);
                  },
                )),

                // i tre punti significano che isoleremo ogni elemento di un elenco, facendo 'sparire' l'elenco
                // currentQuestion è sempre la stessa variabile.
                // richiamiamo un metodo istanza del model che ritorna un elenco di stringhe 'ecco perchè i 3 .')
                // e farà una copia dell'elenco delle risposte in ordine casuale, quindi avremo un elenco casuale di risposte
                // map significa che le mapperà uno a uno , le 'prenderà'.
                // e la logica all'interno. per ogni elemento dell'elenco, instanzieremo un nuovo widget 'oggetto'
                // e al nuovo widget passeremo all'interno come parametro la risposta ( i 3 punti rendono singoli)
                /// e passeremo anche un metodo ( che richiama anche il metodo ereditato)
                /// 
                /// in poche parole. abbiamo costruito un widget per ogni bottone, con questo map assegnamo ogni singola risposta e metodo al widget.
                /// in modo da avere tanti widget tanto quante le risposte
          ],
        ),
      ),
    );
  }
}
