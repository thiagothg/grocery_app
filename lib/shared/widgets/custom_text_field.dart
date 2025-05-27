import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final IconData prefixIcon;
  final String labelText;
  final TextInputType keyboardType;
  final bool isSecret;

  const CustomTextField({
    super.key,
    required this.prefixIcon,
    required this.labelText,
    this.isSecret = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscure = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        obscureText: isObscure,
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
          suffixIcon: widget.isSecret
              ? IconButton(
                  icon: Icon(
                    isObscure ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    // Logic to toggle visibility can be added here
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                )
              : null,
          prefix: Icon(widget.prefixIcon),
          labelText: widget.labelText,
          isDense: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
        ),
      ),
    );
  }
}
