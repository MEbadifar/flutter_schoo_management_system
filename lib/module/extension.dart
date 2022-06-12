import 'package:flutter/material.dart';
import 'package:flutter_schoo_management_system/module/widgets.dart';

extension ContextExtension on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
  void showForm(Widget child) =>
      Navigator.of(this).push(MaterialPageRoute(builder: (_) => child));
}

extension StringExtension on String {
  Widget toLabel({double? fontsize, Color? color, bool bold = false}) => Label(
        this,
        bold: bold,
        fontSize: fontsize,
        color: color,
      );
}

extension WidgetExtension on Widget {
  Widget get vMargin3 =>
      Container(margin: const EdgeInsets.symmetric(vertical: 3), child: this);
  Widget get vMargin6 =>
      Container(margin: const EdgeInsets.symmetric(vertical: 6), child: this);
  Widget get vMargin9 =>
      Container(margin: const EdgeInsets.symmetric(vertical: 9), child: this);
  Widget get hMargin3 =>
      Container(margin: const EdgeInsets.symmetric(horizontal: 3), child: this);
  Widget get hMargin6 =>
      Container(margin: const EdgeInsets.symmetric(horizontal: 6), child: this);
  Widget get hMargin9 =>
      Container(margin: const EdgeInsets.symmetric(horizontal: 9), child: this);
  Widget get margin3 => Container(margin: const EdgeInsets.all(3), child: this);
  Widget get margin6 => Container(margin: const EdgeInsets.all(6), child: this);
  Widget get margin9 => Container(margin: const EdgeInsets.all(9), child: this);

  Widget get vPadding3 =>
      Container(padding: const EdgeInsets.symmetric(vertical: 3), child: this);
  Widget get vPadding6 =>
      Container(padding: const EdgeInsets.symmetric(vertical: 6), child: this);
  Widget get vPadding9 =>
      Container(padding: const EdgeInsets.symmetric(vertical: 9), child: this);
  Widget get hPadding3 => Container(
      padding: const EdgeInsets.symmetric(horizontal: 3), child: this);
  Widget get hPadding6 => Container(
      padding: const EdgeInsets.symmetric(horizontal: 6), child: this);
  Widget get hPadding9 => Container(
      padding: const EdgeInsets.symmetric(horizontal: 9), child: this);
  Widget get padding3 =>
      Container(padding: const EdgeInsets.all(3), child: this);
  Widget get padding6 =>
      Container(padding: const EdgeInsets.all(6), child: this);
  Widget get padding9 =>
      Container(padding: const EdgeInsets.all(9), child: this);

  Widget get card => Card(child: this);
  Widget get expand => Expanded(child: this);
  Widget get center => Center(child: this);
}