import 'package:flutter/material.dart';
import 'package:password_generator/src/pages/password_generator_page.dart';

void main()=> runApp(MyApp());


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: PasswordGeneratorPage(),
    );
  }
}
