import 'package:flutter/material.dart';
import 'package:wallet_app/Screens/login.dart';
import 'package:wallet_app/Screens/register.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome!',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'We are happy to see you here.',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return Log_In();
                }));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF294B29),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(
                      width: 2,
                      color: Color(0xFF294B29)), // Border color and width
                ),
                minimumSize: const Size(200, 0), // Fixed width
              ),
              child: const Text('Login'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return Register();
                }));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(
                      width: 2,
                      color: Color(0xFF294B29)), // Border color and width
                ),
                minimumSize: const Size(200, 0), // Fixed width
              ),
              child: const Text('Sign Up',style: TextStyle(color: Color(0xFF294B29)),),
            ),
          ],
        ),
      ),
    );
  }
}
