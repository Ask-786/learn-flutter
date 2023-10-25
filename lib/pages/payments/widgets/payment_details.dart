import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;

import 'details_values.dart';

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
                  DetailsValuesWidget(
                    type: DetailsValueType.date,
                    value: formControls.values.toList()[i].text,
                    additionalValue: formControls['time'].text,
                  )
                ] else if (formControls.keys.toList()[i] == 'source') ...[
                  DetailsValuesWidget(
                      type: DetailsValueType.source,
                      value: formControls.values.toList()[i].text,
                      additionalValue: '*******3433')
                ] else if (formControls.keys.toList()[i] == 'amount') ...[
                  DetailsValuesWidget(
                      type: DetailsValueType.amount,
                      value: formControls.values.toList()[i].text)
                ] else if (formControls.keys.toList()[i] == 'status') ...[
                  DetailsValuesWidget(
                      type: DetailsValueType.status,
                      value: formControls.values.toList()[i].text)
                ] else if (formControls.keys.toList()[i] == 'type') ...[
                  DetailsValuesWidget(
                      type: DetailsValueType.type,
                      value: formControls.values.toList()[i].text)
                ] else if (formControls.keys.toList()[i] == 'from') ...[
                  DetailsValuesWidget(
                      type: DetailsValueType.from,
                      value: formControls.values.toList()[i].text)
                ] else ...[
                  DetailsValuesWidget(
                      type: DetailsValueType.normal,
                      value: formControls.values.toList()[i].text)
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
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: SvgPicture.asset('assets/svg/arrow_back.svg'),
                  ),
                  const SizedBox(width: 15),
                  const Text(
                    "Pay Details",
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      fontFamily: 'Manrope',
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/svg/green_check.svg'),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '\$${formControls['amount'].text}',
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontFamily: 'Manrope',
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 15),
                child: const Text(
                  "Success",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF31C64F),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 36),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Column(
                  children: boxChildres,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  color: const Color(0xFF478DF6),
                  borderRadius: BorderRadius.circular(25),
                ),
                width: 64.5,
                height: 51.9,
                padding: const EdgeInsets.all(15),
                child: SvgPicture.asset(
                  'assets/svg/share_button.svg',
                  height: 17.5,
                  width: 17,
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
