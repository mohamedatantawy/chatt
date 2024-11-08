import 'package:flutter/material.dart';

class Textfieldbody extends StatefulWidget {
  Textfieldbody(
      {super.key,
      required this.hint,
      required this.onsave,
      this.ontap,
      this.obscure = false});
  final String hint;
  final bool obscure;
  final void Function(String?)? onsave;
  void Function()? ontap;

  @override
  State<Textfieldbody> createState() => _TextfieldbodyState();
}

class _TextfieldbodyState extends State<Textfieldbody> {
  
    bool obscure =false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.obscure,
      validator: (value) {
        if (value!.isEmpty) {
          return 'this field required';
        }
      },
      onChanged: widget.onsave,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () {
            obscure = false;
            setState(() {
              
            });
          },
          icon: Icon(widget.obscure
              ? Icons.visibility_off_rounded
              : Icons.visibility_rounded),
        ),
        hintText: widget.hint,
        hintStyle: const TextStyle(
          fontSize: 22,
        ),
        border: basicoutline(),
        enabledBorder: basicoutline(),
        focusedBorder: basicoutline(),
      ),
    );
  }

  OutlineInputBorder basicoutline() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Colors.white),
    );
  }
}
