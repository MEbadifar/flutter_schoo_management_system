import 'package:flutter/material.dart';

import '../module/extension.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            'Dashboard'.toLabel(),
          ],
        ), 
      ),
    );
  }
}
