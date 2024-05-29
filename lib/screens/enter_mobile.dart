import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:mobile_auth/screens/enter_otp.dart';

class EnterMobileNumberScreen extends StatefulWidget {
  const EnterMobileNumberScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _EnterMobileNumberScreenState createState() =>
      _EnterMobileNumberScreenState();
}

class _EnterMobileNumberScreenState extends State<EnterMobileNumberScreen> {
  final TextEditingController _controller = TextEditingController();
  late String _verificationId;
  String? _phoneNumber; // To store the formatted phone number

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _verifyPhoneNumber() async {
    print("Attempting to verify phone number: $_phoneNumber");
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: _phoneNumber!,
      verificationCompleted: (PhoneAuthCredential credential) async {
        print(
            "Verification completed automatically with credential: $credential");
        await FirebaseAuth.instance.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        print("Verification failed with error: ${e.code}");
        if (e.code == 'invalid-phone-number') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('The provided phone number is not valid.')),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Verification failed. Code: ${e.code}')),
          );
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        print("Code sent to $_phoneNumber, verificationId: $verificationId");
        setState(() {
          _verificationId = verificationId;
        });
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VerifyPhoneScreen(
              verificationId: _verificationId,
              phoneNumber: _phoneNumber!,
            ),
          ),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        print("Auto retrieval timeout for verificationId: $verificationId");
        setState(() {
          _verificationId = verificationId;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close), // Close icon
          onPressed: () {
            print("Close button pressed");
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Please enter your mobile number',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 5),
            const Text(
              'You’ll receive a 6 digit code \nto verify next.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            IntlPhoneField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Enter mobile number',
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
              ),
              initialCountryCode: 'IN', // Default country code
              onChanged: (phone) {
                _phoneNumber =
                    phone.completeNumber; // Update formatted phone number
                print("Phone number changed: ${phone.completeNumber}");
              },
              onCountryChanged: (country) {
                print("Country changed to: ${country.name}");
              },
            ),
            const SizedBox(height: 5),
            ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Color(0xff2E3B62)),
              ),
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => VerifyPhoneScreen(
                //       verificationId: _verificationId,
                //       phoneNumber: _phoneNumber!,
                //     ),
                //   ),
                // );
                print("Continue button pressed");
                if (_phoneNumber != null && _phoneNumber!.isNotEmpty) {
                  print("Phone number entered: $_phoneNumber");
                  _verifyPhoneNumber();
                } else {
                  print("No phone number entered");
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Please enter your mobile number')),
                  );
                }
                // await FirebaseAuth.instance.verifyPhoneNumber(
                //     verificationCompleted: (PhoneAuthCredential credential) {},
                //     verificationFailed: (FirebaseException ex) {},
                //     codeSent: (String verificationid, int? resendtoken) {
                //       Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //               builder: ((context) => VerifyPhoneScreen(
                //                   verificationId: verificationid,
                //                   phoneNumber: _controller.text.toString()))));
                //     },
                //     codeAutoRetrievalTimeout: (String verificationid) {},
                //     phoneNumber: _controller.text.toString());
              },
              child: const Text(
                'CONTINUE',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
