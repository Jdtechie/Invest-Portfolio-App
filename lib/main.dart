import 'package:flutter/material.dart';
import 'package:my_portfolio/providers/investment_provider.dart';
import 'package:my_portfolio/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => InvestmentProvider()..loadInvestments(),
      child: MaterialApp(
        title: 'My Portfolio',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Color.fromARGB(255, 61, 187, 225)),
          appBarTheme: AppBarTheme(
            backgroundColor:
                Color.fromARGB(255, 61, 187, 225), // AppBar background
            titleTextStyle: TextStyle(
              color: Colors.white, // Title text color
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
            iconTheme: IconThemeData(color: Colors.white), // Back arrow color
          ),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
