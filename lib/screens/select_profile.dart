import 'package:flutter/material.dart';

class ProfileSelectionScreen extends StatefulWidget {
  const ProfileSelectionScreen({super.key});

  @override
  _ProfileSelectionScreenState createState() => _ProfileSelectionScreenState();
}

class _ProfileSelectionScreenState extends State<ProfileSelectionScreen> {
  String? _selectedProfile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Please select your profile',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            RadioListTile<String>(
              shape: Border.all(color: Colors.black),
              value: 'Shipper',
              groupValue: _selectedProfile,
              onChanged: (value) {
                setState(() {
                  _selectedProfile = value;
                });
              },
              title: const Row(
                children: [
                  Icon(
                    Icons.warehouse_outlined,
                    size: 40,
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Shipper',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Text(
                          'Lorem ipsum dolor sit amet, \nconsectetur adipiscing'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            RadioListTile<String>(
              shape: Border.all(color: Colors.black),
              value: 'Transporter',
              groupValue: _selectedProfile,
              onChanged: (value) {
                setState(() {
                  _selectedProfile = value;
                });
              },
              title: const Row(
                children: [
                  Icon(
                    Icons.local_shipping_outlined,
                    size: 40,
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Transporter',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Text(
                          'Lorem ipsum dolor sit amet, \nconsectetur adipiscing'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Color(0xff2E3B62))),
              onPressed: () {
                // Handle continue action
                if (_selectedProfile != null) {
                  // Proceed with the selected profile
                  print('Selected profile: $_selectedProfile');
                } else {
                  // Show a message to select a profile
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please select a profile')),
                  );
                }
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
