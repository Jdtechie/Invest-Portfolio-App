import 'package:flutter/material.dart';
import '../models/investment.dart';

class InvestmentDetailsScreen extends StatelessWidget {
  final Investment investment;

  const InvestmentDetailsScreen({required this.investment});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(investment.name),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Amount Invested: \$${investment.amountInvested.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 10),
            Text(
              'Current Value: \$${investment.currentValue.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 10),
            Text(
              'Growth: ${investment.percentageGrowth.toStringAsFixed(2)}%',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: investment.percentageGrowth >= 0
                    ? Colors.green
                    : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
