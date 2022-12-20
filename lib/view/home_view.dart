import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internship_web_app_assignment/questions/quiz_page.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    TextEditingController name = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Mitt Arv',
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 100),
          Padding(
            padding: const EdgeInsets.only(
              left: 50,
              right: 50,
            ),
            child: Row(
              children: [
                Text(
                  'Enter your name - ',
                  style: GoogleFonts.poppins(color: Colors.black, fontSize: 20),
                ),
                SizedBox(
                  height: 50,
                  width: 300,
                  child: TextField(
                    controller: name,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'ex. John Fish',
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 100),
          Center(
            child: TextButton(
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) =>const QuizPage())),
              child: Container(
                margin: EdgeInsets.fromLTRB(w / 3, 0, w / 3, 0),
                width: w,
                height: 50,
                alignment: Alignment.center,
                padding: const EdgeInsets.only(left: 100, right: 100),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8)),
                child: Text(
                  'Start Quiz',
                  style: GoogleFonts.poppins(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
