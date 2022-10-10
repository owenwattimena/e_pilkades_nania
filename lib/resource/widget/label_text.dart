import 'package:flutter/material.dart';

import '../../config/theme.dart';

class LabelText extends StatelessWidget {
  final String label;
  final String teks;
  const LabelText({Key? key, required this.label, required this.teks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: primaryStyle.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            teks,
            style: primaryStyle.copyWith(color: greyColor),
          ),
        ],
      ),
    );
  }
}
