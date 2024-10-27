# my_portfolio

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.



Here's a brief README file that explains the app's structure, libraries used, and instructions for running the app:

My Portfolio App
Overview
The My Portfolio App is a Flutter application designed to help users manage and visualize their investments. It allows users to add investments, view investment details, and monitor the overall portfolio value.

Project Structure

lib:
 models:
  -investment.dart          # Investment model class
 providers:
  -investment_provider.dart  # Investment provider for state management
 screens:
  - add_investment.dart      # Screen for adding a new investment
  - home_screen.dart          # Main screen showing the portfolio and investments
  - investment_details.dart    # Screen for viewing details of a specific investment
 main.dart                     # Entry point of the application

Libraries Used
Flutter: The framework used for building the app.
Provider: A state management library used to manage and share the state of investments across the app.
shared_preferences: A package for storing and retrieving simple data persistently.

Installation
Clone the repository:
(https://github.com/Jdtechie/Invest-Portfolio-App.git)
[git clone https://github.com/your-username/my_portfolio.git]

cd my_portfolio
Install dependencies: Ensure you have Flutter installed on your machine. Then, run:

flutter pub get
Run the app: You can run the app on an emulator or a physical device using:

flutter run

Usage
Add Investment: Tap the floating action button to add a new investment.
View Investments: See the list of investments along with their details and current values.
Investment Details: Tap on any investment to view more detailed information.
