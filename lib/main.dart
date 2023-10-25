import 'package:flutter/material.dart';

import 'pages/api_integration/api.dart';
import 'pages/api_integration/todos.dart';
import 'pages/payments/payments.dart';
import 'pages/payments/widgets/payment_details.dart';
import 'pages/persons/persons.dart';
import 'services/isar_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final isarService = IsarService();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Home Page'),
      routes: {
        '/persons': (context) => const PersonsWidget(),
        '/payments': (context) => const PaymentsWidget(),
        '/payments/payments-details': (context) => const PaymentDetailsWidget(),
        '/apis': (context) => const ApiIntegrationWidget(),
        '/todos': (context) => const TodosWidget(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/persons');
                },
                child: const Text('Go To Persons'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/payments');
                },
                child: const Text('Go To Payments'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/apis');
                },
                child: const Text('Go To Api'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/todos');
                },
                child: const Text('Todos'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
