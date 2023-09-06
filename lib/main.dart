import 'package:flutter/material.dart';
import 'package:foodpanda_ui/screens/cart_modal.dart';
import 'package:foodpanda_ui/screens/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartModal(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 236, 59, 157)),

          //useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
