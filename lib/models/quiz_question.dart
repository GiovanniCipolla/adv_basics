class QuizQuestion {

// il modell conterrà domanda e elenco di risposte e un metodo che restituisce una copia dell'elenco di risposte
const QuizQuestion(this.text,this.answer);


  final String text;
  final List<String> answer;

  List<String> get shuffleAnswer {
    final shuffleList = List.of(answer);
    shuffleList.shuffle();  // shuffle modifica l'originale
    return shuffleList;
  }
}