import 'package:flutter/material.dart';

import 'package:flutter_schoo_management_system/module/extension.dart';

class Label extends StatelessWidget {
  final String? title;
  final double? fontSize;
  final Color? color;
  final bool bold;
  const Label(this.title,
      {this.fontSize, this.color, this.bold = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title!,
      style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: bold ? FontWeight.bold : FontWeight.normal),
    );
  }
}

class Button extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Icon? icon;
  final Color? color;
  final EdgeInsets? padding;

  const Button(
      {Key? key,
      required this.title,
      required this.onTap,
      this.icon,
      this.color,
      this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(color),
            padding: MaterialStateProperty.all(padding)),
        onPressed: onTap,
        child: icon != null
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    icon!.icon,
                    size: 17,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  title.toLabel(),
                ],
              )
            : title.toLabel());
  }
}

class Edit extends StatelessWidget {
  final String hint;
  final Function(String)? onChange;
  final bool autoFocus;
  final bool password;
  final TextEditingController? controller;

  const Edit({
    Key? key,
    required this.hint,
    this.onChange,
    this.autoFocus = false,
    this.password = false,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          gapPadding: 20,
        ),
        labelText: hint,
        labelStyle: TextStyle(color: Colors.grey.shade500, fontSize: 14),
      ),
      obscureText: password,
      controller: controller,
      onChanged: onChange,
    );
  }
}
