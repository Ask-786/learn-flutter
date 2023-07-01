import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;

class PaymentDetailsWidget extends StatelessWidget {
  const PaymentDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final formControls = (ModalRoute.of(context)!.settings.arguments ??
        <String, TextEditingController>{}) as Map;

    final List<Widget> boxChildres = [];

    for (int i = 0; i < formControls.keys.length; i++) {
      if (formControls.keys.toList()[i] != 'time') {
        boxChildres.add(
          Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(toBeginningOfSentenceCase(formControls.keys.toList()[i]) ??
                    ''),
                if (formControls.keys.toList()[i] == 'date') ...[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(formControls.values.toList()[i].text),
                      Text(
                        formControls['time'].text,
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                    ],
                  )
                ] else if (formControls.keys.toList()[i] == 'source') ...[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(formControls.values.toList()[i].text),
                      const Text(
                        '*******4479',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w400),
                      )
                    ],
                  )
                ] else ...[
                  Text(formControls.keys.toList()[i] == 'amount'
                      ? '\$${formControls.values.toList()[i].text}'
                      : formControls.values.toList()[i].text),
                ],
              ],
            ),
            const SizedBox(
              height: 20,
            )
          ]),
        );
      }
    }

    return SafeArea(
      child: Scaffold(
        body: Center(
            child: Container(
          color: const Color(0xFF434D91),
          height: double.infinity,
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    "Pay Details",
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontFamily: 'Manrope'),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 97),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(width: 0),
                          color: Colors.white),
                      child: const Icon(
                        Icons.check_circle,
                        color: Color(0xFF2ECC77),
                        size: 48,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '\$${formControls['amount'].text}',
                      style: const TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontFamily: 'Manrope'),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 15),
                child: const Text(
                  "Success",
                  style: TextStyle(fontSize: 16, color: Color(0xFF31C64F)),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 36),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Column(children: boxChildres),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                    color: const Color(0xFF478DF6),
                    borderRadius: BorderRadius.circular(25)),
                width: 64.5,
                height: 51.9,
                padding: const EdgeInsets.all(15),
                child: const Icon(
                  Icons.share,
                  color: Colors.white,
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
