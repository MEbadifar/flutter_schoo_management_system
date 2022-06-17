import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter_schoo_management_system/module/extension.dart';
import 'package:flutter_schoo_management_system/module/widgets.dart';

class SideBar extends StatelessWidget {
  final Function(int) onChange;
  final int selectidx;
  const SideBar({
    Key? key,
    required this.onChange,
    required this.selectidx,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.widthResponse(0.23, 180, 250),
      child: Column(
        children: [
          const SizedBox(
            height: 35,
          ),
          'School'
              .toLabel(fontsize: 22, color: Colors.grey.shade600, bold: true),
          const SizedBox(height: 75),
          MSideBarItem(
            title: 'Dashboard',
            icon: Icons.dashboard,
            selected: selectidx == 1,
            onTap: () => onChange(1),
          ),
          MSideBarItem(
            title: 'Messages',
            icon: Icons.messenger,
            selected: selectidx == 2,
            onTap: () => onChange(2),
            value: 6,
          ),
          // MSideBarItem(
          //   title: 'Students',
          //   icon: Icons.people,
          //   selected: selectidx == 3,
          //   onTap: () => onChange(3),
          // ),
          // MSideBarItem(
          //   title: 'classes',
          //   icon: Icons.home_outlined,
          //   selected: selectidx == 4,
          //   onTap: () => onChange(4),
          // ),
          const SizedBox(
            height: 50,
          ),
          MSideBarItem(
            title: 'Setting',
            icon: Icons.settings,
            selected: selectidx == 5,
            onTap: () => onChange(5),
          ),
        ],
      ),
    );
  }
}
