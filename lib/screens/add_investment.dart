import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/investment.dart';
import '../providers/investment_provider.dart';

class AddInvestmentScreen extends StatefulWidget {
  @override
  _AddInvestmentScreenState createState() => _AddInvestmentScreenState();
}

class _AddInvestmentScreenState extends State<AddInvestmentScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  double _amountInvested = 0;
  double _currentValue = 0;

  void _saveInvestment() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final newInvestment = Investment(
        name: _name,
        amountInvested: _amountInvested,
        currentValue: _currentValue,
      );

      Provider.of<InvestmentProvider>(context, listen: false)
          .addInvestment(newInvestment);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Investment',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Investment Name',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a name' : null,
                onSaved: (value) => _name = value!,
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Amount Invested (USD)',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value!.isEmpty ? 'Please enter an amount' : null,
                onSaved: (value) => _amountInvested = double.parse(value!),
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Current Value (USD)',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a value' : null,
                onSaved: (value) => _currentValue = double.parse(value!),
              ),
              SizedBox(height: 24),
              Center(
                child: ElevatedButton(
                  onPressed: _saveInvestment,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueAccent,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    textStyle: TextStyle(fontSize: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Save',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
