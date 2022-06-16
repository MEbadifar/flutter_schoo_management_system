import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_schoo_management_system/module/extension.dart';
import 'package:flutter_schoo_management_system/module/widgets.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MBloc<int> _selidx = MBloc<int>()..setValue(1);
    return Container(
      width: context.widthResponse(0.23, 180, 250),
      child: StreamBuilder<int>(
          stream: _selidx.stream,
          builder: (context, snap) {
            if (!snap.hasData) return Container();
            return Column(
              children: [
                const SizedBox(
                  height: 35,
                ),
                'School'.toLabel(
                    fontsize: 22, color: Colors.grey.shade600, bold: true),
                const SizedBox(height: 75),
                MSideBarItem(
                  title: 'Dashboard',
                  icon: Icons.dashboard,
                  selected: snap.data == 1,
                  onTap: () => _selidx.setValue(1),
                ),
                MSideBarItem(
                  title: 'Messages',
                  icon: Icons.messenger,
                  selected: snap.data == 2,
                  onTap: () => _selidx.setValue(2),
                  value: 6,
                ),
                MSideBarItem(
                  title: 'Students',
                  icon: Icons.people,
                  selected: snap.data == 3,
                  onTap: () => _selidx.setValue(3),
                ),
                MSideBarItem(
                  title: 'classes',
                  icon: Icons.home_outlined,
                  selected: snap.data == 4,
                  onTap: () => _selidx.setValue(4),
                ),
                const SizedBox(
                  height: 50,
                ),
                MSideBarItem(
                  title: 'Setting',
                  icon: Icons.settings,
                  selected: snap.data == 5,
                  onTap: () => _selidx.setValue(5),
                ),
              ],
            );
          }),
    );
  }
}
