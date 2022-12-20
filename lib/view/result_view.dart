import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internship_web_app_assignment/questions/answer_key.dart';
import 'package:internship_web_app_assignment/questions/answers.dart';

class Results extends StatefulWidget {
  const Results({super.key});

  @override
  State<Results> createState() => _ResultsState();
}

var _points = 0;

class _ResultsState extends State<Results> {
  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < answers.length; i++) {
      if (answers[i] == answer_key[i]) {
        _points++;
      }
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 100),
            Center(
              child: Text(
                'Results - $_points / ${answers.length}',
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 50,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 400,
              height: 600,
              padding: const EdgeInsets.only(bottom: 50),
              // color: Colors.red,
              child: ListView.builder(
                itemCount: answers.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      answers[index],
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: answers[index] == answer_key[index]
                              ? Colors.green
                              : Colors.red,
                        ),
                      ),
                    ),
                    leading: Container(
                      width: 40,
                      height: 40,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: answers[index] == answer_key[index]
                              ? Colors.green
                              : Colors.red,
                          borderRadius: BorderRadius.circular(50)),
                      child: answers[index] == answer_key[index]
                          ? const Text('+1')
                          : const Text('0'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
