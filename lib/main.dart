
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/screen/res_screen.dart';


void main() => runApp(
  DevicePreview(
    enabled: true,
    builder: (context) => MyApp(), // Wrap your app
  ),
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      // theme: ThemeData.light(),
      theme: ThemeData(
        useMaterial3: true,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Color.fromRGBO(26, 231, 148, 1.0), // Background color
            onPrimary: Colors.white, // Text color
            padding:
            const EdgeInsets.symmetric(horizontal: 70.0, vertical: 10.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ),
      darkTheme: ThemeData.dark(),
      home: const ResScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}