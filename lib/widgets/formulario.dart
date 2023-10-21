import 'package:flutter/material.dart';

class Formulario extends StatelessWidget {
  final String labelText;
  final TextEditingController? controller;

  const Formulario({super.key, required this.labelText, this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 100, maxWidth: 100),
      margin: const EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  focusColor: Colors.black,
                  suffixIconColor: Colors.black,
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.black,
                          width: 10,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  labelText: labelText,
                  labelStyle: const TextStyle(color: Colors.black)),
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black, fontSize: 25.0),
              controller: controller,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Insira seus dados!";
                }
                return null;
              },
            ),
          )
        ],
      ),
    );
  }
}
