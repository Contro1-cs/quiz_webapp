import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internship_web_app_assignment/questions/answer_key.dart';
import 'package:internship_web_app_assignment/questions/answers.dart';

class Results extends StatefulWidget {
  const Results({super.key});

  @override
  State<Results> createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 100),
          Center(
            child: Text(
              'Results',
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 50,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: 200,
            height: 600,
            padding: const EdgeInsets.only(bottom: 50),
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
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
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
