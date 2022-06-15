import 'package:flutter/material.dart';

import 'extension.dart';

enum ButtonType { Save, Cancel, Delete, New }

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
  final String? title;
  final VoidCallback onTap;
  final Icon? icon;
  final Color? color;
  final EdgeInsets? padding;
  final ButtonType? type;

  const Button(
      {Key? key,
      this.title,
      required this.onTap,
      this.icon,
      this.type,
      this.color,
      this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          // ignore: prefer_if_null_operators
          color != null
              ? color
              : type == ButtonType.Save
                  ? Colors.green
                  : type == ButtonType.Cancel
                      ? Colors.deepOrangeAccent
                      : type == ButtonType.Delete
                          ? Colors.redAccent
                          : type == ButtonType.New
                              ? Colors.blue
                              : null,
        ),
        padding: MaterialStateProperty.all(padding ?? const EdgeInsets.all(22)),
      ),
      child: type != null
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                icon ??
                    Icon(type == ButtonType.Save
                        ? Icons.save
                        : type == ButtonType.Cancel
                            ? Icons.cancel
                            : type == ButtonType.Delete
                                ? Icons.delete
                                : type == ButtonType.New
                                    ? Icons.add_box
                                    : Icons.help_center),
                const SizedBox(width: 5),
                title != null
                    ? title!.toLabel()
                    : type == ButtonType.Save
                        ? 'Save'.toLabel()
                        : type == ButtonType.Cancel
                            ? 'Cancel'.toLabel()
                            : type == ButtonType.Delete
                                ? 'Delete'.toLabel()
                                : type == ButtonType.New
                                    ? 'New'.toLabel()
                                    : title!.toLabel(),
              ],
            )
          : icon != null
              ? Row(
                  children: [
                    icon!,
                    const SizedBox(width: 5),
                    title!.toLabel(),
                  ],
                )
              : title!.toLabel(),
    );
  }
}

class Edit extends StatelessWidget {
  final String hint;
  final Function(String)? onChange;
  final bool autoFocus;
  final bool password;
  final bool notempty;
  final TextEditingController? controller;

  const Edit({
    Key? key,
    required this.hint,
    this.onChange,
    this.notempty = false,
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
      validator: (val) {
        if ((val ?? '').isEmpty && this.notempty) {
          return "connot be empty";
        }
      },
    );
  }
}
