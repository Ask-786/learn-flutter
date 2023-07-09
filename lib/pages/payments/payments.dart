import 'package:flutter/material.dart';

import 'widgets/form.dart';

class PaymentsWidget extends StatelessWidget {
  const PaymentsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Create Payment'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [PaymentsFormWidget()],
      ),
    );
  }
}
