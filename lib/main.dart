import 'package:first_project/pages/payments/payments.dart';
import 'package:first_project/pages/payments/widgets/payment_details.dart';
import 'package:first_project/pages/persons/persons.dart';
import 'package:first_project/services/isar_service.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final isarService = IsarService();

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
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

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
                child: const Text('Go To Persons')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/payments');
                },
                child: const Text('Go To Payments')),
          ],
        ),
      ),
    ));
  }
}
