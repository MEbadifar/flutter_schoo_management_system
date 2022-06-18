import 'package:flutter/material.dart';
import 'package:flutter_schoo_management_system/module/Theme.dart';
import 'package:flutter_schoo_management_system/module/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../module/extension.dart';
import '../Teachers/teachers.dart';
import './SideBar.dart';
import 'UserInfo.dart';

MBloc<int> _menu = MBloc<int>()..setValue(1);
MBloc<int> _dashmenu = MBloc<int>()..setValue(0);

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder<int>(
            stream: _menu.stream,
            builder: (context, snap) {
              if (!snap.hasData) {
                return MWaiting();
              }
              return Row(
                children: [
                  SideBar(
                      selectidx: _menu.value,
                      onChange: (val) => _menu.setValue(val)),
                  Container(
                    child: snap.data == 1
                        ? DashboardContent()
                        : 'somethingelse'.toLabel().center,
                  ).expand,
                  const UserInfo(),
                ],
              );
            }),
      ),
    );
  }
}

class DashboardContent extends StatelessWidget {
  const DashboardContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
        stream: _dashmenu.stream,
        builder: (context, snap) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //! Search box
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 300,
                    child: const MEdit(hint: 'search...'),
                  ).padding9,
                  const MDarkLightSwitch(),
                ],
              ),
              const SizedBox(
                height: 35,
              ),
              //!top menu teacher student class
              Row(
                children: [
                  GestureDetector(
                    onTap: () => _dashmenu.setValue(1),
                    child: Container(
                      width: 100,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              color: (snap.data ?? 0) == 1
                                  ? Colors.green.shade200
                                  : Colors.grey.shade200,
                              width: 1),
                        ),
                      ),
                      padding: const EdgeInsets.only(bottom: 15),
                      child: 'Teacher'
                          .toLabel(
                            color: (snap.data ?? 0) == 1
                                ? Colors.green.shade200
                                : Colors.grey,
                          )
                          .center,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _dashmenu.setValue(2),
                    child: Container(
                      width: 100,
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: (snap.data ?? 0) == 2
                                    ? Colors.green.shade200
                                    : Colors.grey.shade200,
                                width: 1)),
                      ),
                      padding: const EdgeInsets.only(bottom: 15),
                      child: 'Student'
                          .toLabel(
                            color: (snap.data ?? 0) == 2
                                ? Colors.green.shade200
                                : Colors.grey,
                          )
                          .center,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _dashmenu.setValue(3),
                    child: Container(
                      width: 100,
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: (snap.data ?? 0) == 3
                                    ? Colors.green.shade200
                                    : Colors.grey.shade200,
                                width: 1)),
                      ),
                      padding: const EdgeInsets.only(bottom: 15),
                      child: 'Class'
                          .toLabel(
                            color: (snap.data ?? 0) == 3
                                ? Colors.green.shade200
                                : Colors.grey,
                          )
                          .center,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Colors.grey.shade200, width: 1)),
                    ),
                    padding: const EdgeInsets.only(bottom: 15),
                    child: ''.toLabel(),
                  ).expand,
                ],
              ),
              (snap.data ?? 0) == 1
                  ? const Teachers()
                  : 'others'.toLabel().center
            ],
          );
        }).padding9.margin9;
  }
}
