import 'package:flutter/material.dart';

// widget creato per il bottone della risposta, sarà statless perchè sarà tutto ereditato,
class AnswerButton extends StatelessWidget {
  const AnswerButton({
    required this.answerText,
    required this.onTap,
    super.key,
  });
  // richiediamo il testo della risposta e la funziona di quando sarà toccata
  //( ereditiamo in modo da cambiare cosi anche le variamo dei widget padri)

  final String answerText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      // ritorniamo un semplice bottone settato graficamente,
      //  che al click eseguirà la funziona che cambierà i parametri in due funzioni
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 40,
        ),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      ),
      child: Text(
        answerText,
        textAlign: TextAlign.center,
      ),
    );
  }
}
