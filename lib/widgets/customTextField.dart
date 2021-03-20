import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    @required this.controller,
    @required this.onChanged,
    @required this.labelText,
    @required this.keyboardType,
  });

  final TextEditingController controller;
  final Function onChanged;
  final String labelText;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15))),
        child: TextFormField(
          controller: controller,
          onChanged: onChanged,
          keyboardType: keyboardType,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(8.0),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.amber.withOpacity(0.75)),
                borderRadius: BorderRadius.circular(15),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(15),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.amber.withOpacity(0.75)),
                borderRadius: BorderRadius.circular(15),
              ),
              labelText: labelText,
              labelStyle: TextStyle(fontSize: 15)),
        ),
      ),
    );
  }
}
