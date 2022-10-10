// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

import '../../config/theme.dart';

class CalkadesCard extends StatelessWidget {
  final String nama;
  final String nomor;
  final String moto;
  final Function()? onButtonPressed;
  final Function()? onButtonPilihPressed;
  const CalkadesCard(
      {Key? key,
      required this.nama,
      required this.nomor,
      required this.moto,
      this.onButtonPressed,
      this.onButtonPilihPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 48,
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.25,
              height: 136,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              decoration: const BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(3),
                      bottomLeft: Radius.circular(3))),
              child: Column(children: [
                Text("NO.", style: primaryStyle.copyWith(color: whiteColor)),
                const SizedBox(height: 26),
                Text(nomor, style: titleStyle1.copyWith(color: whiteColor)),
              ]),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.75 - 48 - 8,
              height: 136,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 18),
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      nama,
                      style: titleStyle2,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.only(left: 18),
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      "\"$moto\"",
                      style: primaryStyle.copyWith(color: Colors.grey),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Divider(
                    color: Color.fromARGB(255, 190, 190, 190),
                    height: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18),
                    child: onButtonPressed != null
                        ? TextButton(
                            onPressed: onButtonPressed,
                            child: const Text("Selengkapnya"),
                          )
                        : ElevatedButton(
                            onPressed: onButtonPilihPressed,
                            child: const Text("Pilih"),
                            style: ElevatedButton.styleFrom(
                              primary: primaryColor,
                            ),
                          ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
