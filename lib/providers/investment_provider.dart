import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/investment.dart';

class InvestmentProvider with ChangeNotifier {
  List<Investment> _investments = [];

  List<Investment> get investments => _investments;

  double get totalPortfolioValue {
    return _investments.fold(0.0, (sum, item) => sum + item.currentValue);
  }

  void addInvestment(Investment investment) {
    _investments.add(investment);
    saveInvestments();
    notifyListeners();
  }

  Future<List<Investment>> loadInvestments() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? investmentsString = prefs.getString('investments');
    if (investmentsString != null) {
      List decoded = jsonDecode(investmentsString);
      _investments = decoded.map((item) => Investment.fromJson(item)).toList();
    }
    notifyListeners();
    return _investments; // Return the investments
  }

  Future<void> saveInvestments() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String investmentsString = jsonEncode(
      _investments.map((investment) => investment.toJson()).toList(),
    );
    prefs.setString('investments', investmentsString);
  }
}
