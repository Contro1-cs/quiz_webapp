import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internship_web_app_assignment/questions/quiz_page.dart';
import 'package:internship_web_app_assignment/user/user.dart';

class Homeview extends StatefulWidget {
  const Homeview({super.key});

  @override
  State<Homeview> createState() => _HomeviewState();
}

bool error = false;

class _HomeviewState extends State<Homeview> {
  @override
  Widget build(BuildContext context) {
    {
      TextEditingController username = TextEditingController();
      var w = MediaQuery.of(context).size.width;
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
                    style:
                        GoogleFonts.poppins(color: Colors.black, fontSize: 20),
                  ),
                  SizedBox(
                    height: 50,
                    width: 300,
                    child: TextFormField(
                      controller: username,
                      decoration: InputDecoration(
                        hintText: 'Ex. John Fish',
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            width: 1,
                            color: error ? Colors.red : Colors.black,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: error ? Colors.red : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 100),
            Center(
              child: TextButton(
                onPressed: () {
                  if (username.text.isEmpty) {
                    setState(() {
                      error = true;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Please Enter your name',
                          style: TextStyle(color: Colors.black),
                        ),
                        backgroundColor: Colors.red,
                      ),
                    );
                  } else {
                    user.add(username.text);

                    setState(() {
                      error = false;
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const QuizPage()));
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
}
