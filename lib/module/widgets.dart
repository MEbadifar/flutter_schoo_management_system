import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rxdart/rxdart.dart';

import 'Theme.dart';
import 'extension.dart';

enum ButtonType { Save, Cancel, Delete, New }

class MBloc<t> {
  BehaviorSubject<t> _bloc = BehaviorSubject<t>();
  Stream<t> get stream => _bloc.stream;
  t get value => _bloc.value;
  void setValue(t val) => _bloc.add(val);
}

class MLabel extends StatelessWidget {
  final String? title;
  final double? fontSize;
  final Color? color;
  final bool bold;
  const MLabel(this.title,
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

class MButton extends StatelessWidget {
  final String? title;
  final VoidCallback onTap;
  final Icon? icon;
  final Color? color;
  final EdgeInsets? padding;
  final ButtonType? type;

  const MButton(
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

class MTextButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Color? color;

  const MTextButton({
    required this.title,
    required this.onPressed,
    this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onPressed, child: title.toLabel(color: color));
  }
}

class MEdit extends StatelessWidget {
  final String hint;
  final Function(String)? onChange;
  final bool autoFocus;
  final bool password;
  final bool notempty;
  final TextEditingController? controller;

  const MEdit({
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

class MSwitch extends StatelessWidget {
  final bool value;
  final Function(bool) onChanged;
  final String? hint;

  const MSwitch({
    Key? key,
    required this.value,
    required this.onChanged,
    this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MBloc<bool> _value = MBloc<bool>()..setValue(value);

    return StreamBuilder<bool>(
      stream: _value.stream,
      builder: (_, snap) {
        if (snap.hasData) {
          return hint != null
              ? Tooltip(
                  message: hint!,
                  child: Switch(
                    value: snap.data!,
                    onChanged: (val) {
                      onChanged(val);
                      _value.setValue(val);
                    },
                  ),
                )
              : Switch(
                  value: snap.data!,
                  onChanged: (val) {
                    onChanged(val);
                    _value.setValue(val);
                  },
                );
        }
        return Container();
      },
    );
  }
}

class MError extends StatelessWidget {
  final Exception exeption;
  const MError({
    Key? key,
    required this.exeption,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(25),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(12),
      ),
      child: exeption.toString().toLabel(color: Colors.white, bold: true),
    );
  }
}

class MWaiting extends StatelessWidget {
  const MWaiting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoActivityIndicator().center;
  }
}

class MSideBarItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final int value;
  final bool selected;

  const MSideBarItem({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.value = 0,
    this.selected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      selected: selected,
      selectedTileColor: context.bottomAppBarColor,
      title: title.toLabel(color: Colors.grey.shade500, fontsize: 13),
      leading: Icon(icon, size: 15, color: Colors.grey.shade500),
      onTap: onTap,
      trailing: value > 0
          ? CircleAvatar(
              backgroundColor: Colors.red.shade500,
              radius: 10,
              child: value.toString().toLabel(fontsize: 10))
          : null,
    );
  }
}

class MDarkLightSwitch extends StatelessWidget {
  const MDarkLightSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.themeBloc
          .setTheme(context.isDark ? AppTheme.Light : AppTheme.Dark),
      child: Container(
        width: 40,
        height: 25,
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
              height: 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.blueAccent.shade100,
              ),
            ),
            context.isDark
                ? Container()
                : Align(
                    alignment: Alignment.centerRight,
                    child: FaIcon(
                      FontAwesomeIcons.sun,
                      color: Colors.yellow.shade700,
                    ),
                  ),
            context.isDark
                ? Align(
                    alignment: Alignment.centerLeft,
                    child: FaIcon(
                      FontAwesomeIcons.moon,
                      color: Colors.blue.shade600,
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
