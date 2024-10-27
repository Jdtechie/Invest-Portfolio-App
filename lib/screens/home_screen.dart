import 'package:flutter/material.dart';
import 'package:my_portfolio/screens/add_investment.dart';
import 'package:my_portfolio/screens/investment_details.dart';
import 'package:provider/provider.dart';
import '../providers/investment_provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final investmentProvider = Provider.of<InvestmentProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Portfolio',
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16.0),
              itemCount: investmentProvider.investments.length,
              itemBuilder: (context, index) {
                final investment = investmentProvider.investments[index];
                return Card(
                  elevation: 4,
                  margin: EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    title: Text(
                      investment.name,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Initial: \$${investment.amountInvested.toStringAsFixed(2)}'),
                        Text(
                            'Current: \$${investment.currentValue.toStringAsFixed(2)}'),
                      ],
                    ),
                    trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            InvestmentDetailsScreen(investment: investment),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Container(
              color: Colors.grey[200],
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              child: Text(
                'Total Portfolio Value: \$${investmentProvider.totalPortfolioValue.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 110.0), // Adjust for spacing
        child: FloatingActionButton(
          backgroundColor: Colors.blueAccent,
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => AddInvestmentScreen()),
          ),
          child: Icon(Icons.add, color: Colors.white),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerFloat, // Centered at the bottom
    );
  }
}
