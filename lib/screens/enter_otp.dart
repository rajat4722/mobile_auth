import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile_auth/screens/select_profile.dart';
import 'package:sms_autofill/sms_autofill.dart';

class VerifyPhoneScreen extends StatefulWidget {
  final String verificationId;
  final String phoneNumber;

  const VerifyPhoneScreen({
    super.key,
    required this.verificationId,
    required this.phoneNumber,
  });

  @override
  _VerifyPhoneScreenState createState() => _VerifyPhoneScreenState();
}

class _VerifyPhoneScreenState extends State<VerifyPhoneScreen>
    with CodeAutoFill {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    listenForCode();
  }

  @override
  void dispose() {
    cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  void codeUpdated() {
    setState(() {
      _controller.text = code ?? '';
    });

    if (_controller.text.length == 6) {
      verifyCode();
    }
  }

  void verifyCode() async {
    try {
      final code = _controller.text.trim();
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId,
        smsCode: _controller.text.toString(),
      );

      // Sign in with the credential
      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ProfileSelectionScreen()),
              ));

      // Navigate to the profile selection screen on successful verification
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => const ProfileSelectionScreen()),
      // );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Verification Successful!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid Code! Please try again.')),
      );
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // Back icon
          onPressed: () {
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
              "Verify Phone",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              'Code is sent to ${widget.phoneNumber}',
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            PinFieldAutoFill(
              controller: _controller,
              codeLength: 6,
              decoration: UnderlineDecoration(
                textStyle: const TextStyle(fontSize: 24, color: Colors.black),
                colorBuilder: const FixedColorBuilder(Colors.black),
              ),
              onCodeSubmitted: (code) {
                verifyCode();
              },
            ),
            const SizedBox(height: 5),
            TextButton(
              onPressed: () {
                // Implement resend code functionality here
              },
              child: RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Didn’t receive the code? ',
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                    TextSpan(
                      text: 'Request Again',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Color(0xff2E3B62)),
              ),
              onPressed: verifyCode,
              child: const Text(
                'VERIFY AND CONTINUE',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
