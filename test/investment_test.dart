import 'package:flutter_test/flutter_test.dart';
import 'package:my_portfolio/models/investment.dart';
import 'package:my_portfolio/providers/investment_provider.dart';

void main() {
  group('InvestmentProvider Tests', () {
    late InvestmentProvider investmentProvider;

    setUp(() {
      investmentProvider = InvestmentProvider();
    });

    test('Initial total portfolio value should be 0', () {
      expect(investmentProvider.totalPortfolioValue, 0.0);
    });

    test('Adding an investment updates the total portfolio value', () {
      // Create a test investment
      final investment = Investment(
        name: 'Test Investment',
        amountInvested: 100.0,
        currentValue: 150.0,
      );

      // Add the investment to the provider
      investmentProvider.addInvestment(investment);

      // Check if the total portfolio value is updated correctly
      expect(investmentProvider.totalPortfolioValue, 150.0);
    });

    test('Adding multiple investments updates the total portfolio value', () {
      // Create test investments
      final investment1 = Investment(
        name: 'Investment 1',
        amountInvested: 100.0,
        currentValue: 150.0,
      );

      final investment2 = Investment(
        name: 'Investment 2',
        amountInvested: 200.0,
        currentValue: 250.0,
      );

      // Add investments to the provider
      investmentProvider.addInvestment(investment1);
      investmentProvider.addInvestment(investment2);

      // Check the total portfolio value
      expect(investmentProvider.totalPortfolioValue, 400.0);
    });

    test(
        'Adding an investment with 0 current value does not affect total portfolio value',
        () {
      // Create an investment with current value of 0
      final investment = Investment(
        name: 'Zero Value Investment',
        amountInvested: 100.0,
        currentValue: 0.0,
      );

      // Add the investment to the provider
      investmentProvider.addInvestment(investment);

      // Check if the total portfolio value remains unchanged
      expect(investmentProvider.totalPortfolioValue, 0.0);
    });
  });
}
