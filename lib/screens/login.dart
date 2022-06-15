import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../block/block_state.dart';
import '../block/user_block.dart';
import '../module/extension.dart';
import '../module/widgets.dart';

TextEditingController _mobile = TextEditingController();
TextEditingController _pass = TextEditingController();

class Login extends StatelessWidget {
  final BlockState state;
  const Login({
    required this.state,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      // appBar: AppBar(),
      body: SafeArea(
        child: Container(
          width: context.width * 0.3 < 350 ? 350 : context.width * 0.3,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: context.height * 0.15,
                ),
                'Welcome to school Test'
                    .toLabel(bold: true, color: Colors.grey, fontsize: 22),
                Edit(hint: 'username', notempty: true, controller: _mobile)
                    .margin9,
                Edit(
                        password: true,
                        hint: 'password',
                        notempty: true,
                        controller: _pass)
                    .margin9,
                AbsorbPointer(
                  absorbing: state is Loading,
                  child: Row(
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      Button(
                        title: 'Register',
                        onTap: () {},
                        icon: const Icon(
                          Icons.edit,
                          size: 15,
                        ),
                        color: Colors.green,
                      ).margin9,
                      state is Loading
                          ? const CupertinoActivityIndicator()
                          : Container(),
                      Button(
                          title: 'Login',
                          icon: const Icon(
                            Icons.vpn_key,
                            size: 15,
                          ),
                          color: Colors.blue,
                          onTap: () {
                            if (_formKey.currentState!.validate())
                              context.userBlock
                                  .authenticate(_mobile.text, _pass.text);
                          }).margin9,
                    ],
                  ),
                ),
                state is Failed
                    ? Container(
                        margin: EdgeInsets.all(25),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: (state as Failed)
                            .exception
                            .toString()
                            .toLabel(color: Colors.white, bold: true),
                      )
                    : Container()
              ],
            ),
          ),
        ).padding9.card.center,
      ),
    );
  }
}
