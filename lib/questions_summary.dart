import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;
  @override

 
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(255, 243, 223, 223),
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),

      child: SizedBox(
        height: 300,
        child: SingleChildScrollView(
          child: Column(
            children: 
            summaryData.map(
              (data) {
                return Row(
                  children: [
                    Text(((data['question-index'] as int) + 1).toString(),style:  const TextStyle(backgroundColor: Colors.white,),),
                    Expanded( //prendi lo spazio disponibile sull'asse principale
                      child: Column(children: [
                        Text(data['question'] as String,
                        style: const TextStyle(color:  Color.fromARGB(255, 0, 0, 0), fontSize: 14),),
                        const SizedBox(height: 5,),
                        Text(data['correct_answer'] as String, style: const TextStyle(color: Colors.green),),
                        const SizedBox(height: 3,),
                        Text(data['user_answer'] as String, style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),)
                      ],),
                    )
                  ],
                );
              },
            ).toList(),
          ),
        ),
      ),
    );
  }
}
