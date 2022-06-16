import 'package:flutter/material.dart';
import 'package:flutter_schoo_management_system/module/widgets.dart';

import '../module/extension.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            'Hello ${context.user!.family}'.toLabel(),
            MButton(
              onTap: () => context.userBlock.signOut(),
              type: ButtonType.Cancel,
              title: 'SignOut',
            )
          ],
        ).center,
      ),
    );
  }
}
