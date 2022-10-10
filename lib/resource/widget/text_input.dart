import 'package:flutter/material.dart';

import '../../config/theme.dart';

class InputText extends StatefulWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hintText;
  final bool obsecureText;
  const InputText({Key? key, this.controller, this.label, this.hintText, this.obsecureText = false}) : super(key: key);

  @override
  State<InputText> createState() => InputTextState();
}

class InputTextState extends State<InputText> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical:6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.label != null
              ? Text("${widget.label}",
                  style: primaryStyle.copyWith(fontWeight: FontWeight.bold))
              : const SizedBox(),
          const SizedBox(height: 7),
          TextFormField(
            obscureText: widget.obsecureText,
            controller: widget.controller,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                hintText: widget.hintText ?? ''),
          )
        ],
      ),
    );
  }
}
