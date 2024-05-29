import 'package:flutter/material.dart';
import 'package:mobile_auth/screens/enter_mobile.dart';

class LanguageSelectScreen extends StatefulWidget {
  const LanguageSelectScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LanguageSelectScreenState createState() => _LanguageSelectScreenState();
}

class _LanguageSelectScreenState extends State<LanguageSelectScreen> {
  String _selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Column(
            children: <Widget>[
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Icon(
                        Icons.image_outlined,
                        size: 50,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Please select your Language',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        'You can change the language \nat any time.',
                        style: TextStyle(fontSize: 13),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.grey), // Border color
                          borderRadius:
                              BorderRadius.circular(10.0), // Border radius
                        ),
                        child: DropdownButton<String>(
                          value: _selectedLanguage,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedLanguage = newValue!;
                            });
                          },
                          underline: Container(),
                          items: <String>[
                            'English',
                            'Hindi',
                            'Spanish',
                            'French',
                            'German',
                            // Add more languages here
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal:
                                        50.0), // Optional padding for the text
                                child: Text(value),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Color(0xff2E3B62)),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const EnterMobileNumberScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          'NEXT',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Add images at the bottom
              Container(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Image.asset('assets/images/Vector.png', height: 100),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
