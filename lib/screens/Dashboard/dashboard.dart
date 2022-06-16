import 'package:flutter/material.dart';
import 'package:flutter_schoo_management_system/module/widgets.dart';

import '../../module/extension.dart';
import './SideBar.dart';
import 'UserInfo.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            const SideBar(),
            Container(
              color: Colors.blue.shade100,
            ).expand,
            const UserInfo(),
          ],
        ),
      ),
    );
  }
}
