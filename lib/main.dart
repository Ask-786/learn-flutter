import 'package:first_project/pages/api_integration/api.dart';
import 'package:first_project/pages/api_integration/todos.dart';
import 'package:first_project/pages/payments/payments.dart';
import 'package:first_project/pages/payments/widgets/payment_details.dart';
import 'package:first_project/pages/persons/persons.dart';
import 'package:first_project/services/isar_service.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';

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
        useMaterial3: false,
      ),
      home: const LoaderOverlay(child: MyHomePage(title: 'Home Page')),
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
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/apis');
                },
                child: const Text('Go To Api')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/todos');
                },
                child: const Text('Todos')),
          ],
        ),
      ),
    ));
  }
}
