import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum DetailsValueType { normal, from, date, source, status, type, amount }

class DetailsValuesWidget extends StatelessWidget {
  const DetailsValuesWidget(
      {super.key,
      required this.type,
      required this.value,
      this.additionalValue});

  final DetailsValueType type;
  final String value;
  final String? additionalValue;

  @override
  Widget build(BuildContext context) {
    if (type == DetailsValueType.status) {
      return Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 3),
            decoration: BoxDecoration(
                color: const Color(0xFF478DF6),
                borderRadius: BorderRadius.circular(100)),
            height: 10,
            width: 10,
          ),
          Text(
            value,
            style: const TextStyle(color: Color(0xFF6F6F6F)),
          )
        ],
      );
    }
    if (type == DetailsValueType.amount) {
      return Text('\$$value');
    }
    if (type == DetailsValueType.from) {
      return Row(
        children: [
          SvgPicture.asset('assets/svg/bank.svg'),
          const SizedBox(
            width: 4,
          ),
          Text(value)
        ],
      );
    }
    if (type == DetailsValueType.date || type == DetailsValueType.source) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(value),
          Text(
            additionalValue ?? '',
            style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Color(0xFF6F6F6F)),
          ),
        ],
      );
    }
    if (type == DetailsValueType.type) {
      return Container(
        height: 23,
        decoration: BoxDecoration(
            color: const Color(0xFFE0EDFF),
            borderRadius: BorderRadius.circular(3)),
        width: 50,
        child: Center(
          child: Text(
            value,
            style: const TextStyle(
                color: Color(0xFF4560BE),
                fontWeight: FontWeight.w600,
                fontSize: 14),
          ),
        ),
      );
    }
    return Text(value);
  }
}
