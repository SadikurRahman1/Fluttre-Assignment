import 'package:flutter/material.dart';

class SecendAssignment extends StatelessWidget {
  const SecendAssignment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Styling app'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Flutter Text Styling',
                style: TextStyle(
                  fontSize: 28, // Large Text
                  fontWeight: FontWeight.bold, // Bold Style
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              // Subtitle Text
              const Text(
                'Experiment with text styles',
                style: TextStyle(
                  fontSize: 18, // Smaller Text
                  fontStyle: FontStyle.italic, // Italic Style
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('You clicked the button!'),
                    ),
                  );
                },
                child: const Text(
                  'Click Me!',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue, // TextButton color
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      'Welcome to ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                    ),
                  ),
                  Text(
                    'Flutter!',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.blue
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}