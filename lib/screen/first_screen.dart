import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Greeting App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Text(
              'Hello, World!',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),

            const SizedBox(height: 16),

            const Text(
                'Welcome to Flutter!',
              style: TextStyle(
              fontSize: 20,
              ),
            ),
            const SizedBox(height: 5),
            Image.network('https://logowik.com/content/uploads/images/flutter5786.jpg'),
            const SizedBox(height: 5),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Button Pressed!'),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Button color
              ),
              child: const Text('Press Me'),
            ),
          ],
        ),
      ),
    );
  }
}
