import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final String text;
  final TextInputType textInputType;
  final bool obscureText;
  final Function validator;
  final Function onSaved;
  // final Function showPassword;

  AuthTextField(
      {@required this.text,
      @required this.textInputType,
      this.validator,
      this.onSaved,
      // this.showPassword,
      this.obscureText = false});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, top: 24),
      child: TextFormField(
        style: TextStyle(fontSize: 18),
        keyboardType: textInputType,
        obscureText: obscureText,
        decoration: InputDecoration(
          // suffixIcon: textInputType == TextInputType.visiblePassword
          //     ? IconButton(
          //         icon: Icon(
          //           obscureText ? Icons.visibility_off : Icons.visibility,
          //           color: obscureText ? Colors.grey : Colors.green,
          //         ),
          // onPressed: showPassword,
          //   )
          // : null,
          hintText: text,
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.red)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.red)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey)),
        ),
        validator: (String val) => validator(val),
        onSaved: (String val) => onSaved(val),
      ),
    );
  }
}
