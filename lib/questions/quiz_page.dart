import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internship_web_app_assignment/questions/answers.dart';
import 'package:internship_web_app_assignment/questions/questions_list.dart';
import 'package:internship_web_app_assignment/view/result_view.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

int _questionIndex = 0;
bool opt1Selected = false;
bool opt2Selected = false;
bool opt3Selected = false;
bool opt4Selected = false;

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
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
          Container(
            padding: const EdgeInsets.fromLTRB(100, 50, 50, 100),
            width: w,
            alignment: Alignment.center,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${_questionIndex + 1}. ',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      questions_list[_questionIndex]['question'],
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //
                    //option 1
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          opt1Selected = !opt1Selected;
                          opt2Selected = false;
                          opt3Selected = false;
                          opt4Selected = false;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                          border: opt1Selected
                              ? Border.all(color: Colors.amber, width: 2)
                              : null,
                          borderRadius: BorderRadius.circular(8),
                          color: opt1Selected ? Colors.amber : Colors.black,
                        ),
                        child: Text(
                          questions_list[_questionIndex]['option 1'],
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 50),

                    //option 2
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          opt1Selected = false;
                          opt2Selected = !opt2Selected;
                          opt3Selected = false;
                          opt4Selected = false;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                          border: opt2Selected
                              ? Border.all(color: Colors.amber, width: 2)
                              : null,
                          borderRadius: BorderRadius.circular(8),
                          color: opt2Selected ? Colors.amber : Colors.black,
                        ),
                        child: Text(
                          questions_list[_questionIndex]['option 2'],
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 50),

                    //option 3
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          opt1Selected = false;
                          opt2Selected = false;
                          opt3Selected = !opt3Selected;
                          opt4Selected = false;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                          border: opt3Selected
                              ? Border.all(color: Colors.amber, width: 2)
                              : null,
                          borderRadius: BorderRadius.circular(8),
                          color: opt3Selected ? Colors.amber : Colors.black,
                        ),
                        child: Text(
                          questions_list[_questionIndex]['option 3'],
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 50),

                    //option 4
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          opt1Selected = false;
                          opt2Selected = false;
                          opt3Selected = false;
                          opt4Selected = !opt4Selected;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                          border: opt4Selected
                              ? Border.all(color: Colors.amber, width: 2)
                              : null,
                          borderRadius: BorderRadius.circular(8),
                          color: opt4Selected ? Colors.amber : Colors.black,
                        ),
                        child: Text(
                          questions_list[_questionIndex]['option 4'],
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 150),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Center(
                child: TextButton(
                  onPressed: () {
                    if (_questionIndex == questions_list.length - 1) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Results(),
                        ),
                      );
                      _questionIndex = -1;
                    } else if (opt1Selected == false &&
                        opt2Selected == false &&
                        opt3Selected == false &&
                        opt4Selected == false) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(
                          'Please select atlease one option',
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        duration: Duration(milliseconds: 1000),
                      ));
                    } else {
                      if (opt1Selected == true) {
                        answers.add(questions_list[_questionIndex]['option 1']);
                      } else if (opt2Selected == true) {
                        answers.add(questions_list[_questionIndex]['option 2']);
                      } else if (opt3Selected == true) {
                        answers.add(questions_list[_questionIndex]['option 3']);
                      } else if (opt4Selected == true) {
                        answers.add(questions_list[_questionIndex]['option 4']);
                      }
                      setState(() {
                        _questionIndex++;
                      });
                      opt1Selected = false;
                      opt2Selected = false;
                      opt3Selected = false;
                      opt4Selected = false;
                    }
                  },
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
                      _questionIndex == questions_list.length - 1
                          ? 'Next'
                          : 'Finish',
                      style: GoogleFonts.poppins(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
