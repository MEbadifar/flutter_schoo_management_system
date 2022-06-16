import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc_state.dart';
import '../module/extension.dart';
import '../module/widgets.dart';

TextEditingController _mobile = TextEditingController();
TextEditingController _pass = TextEditingController();
bool _remember = false;  

class Login extends StatelessWidget {
  final BlocState state;
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
                MEdit(hint: 'username', notempty: true, controller: _mobile)
                    .margin9,
                MEdit(
                        password: true,
                        hint: 'password',
                        notempty: true,
                        controller: _pass)
                    .margin9,
                AbsorbPointer(
                  absorbing: state is Loading,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          MSwitch(
                              value: _remember,
                              hint: 'Remmember me',
                              onChanged: (val) => _remember = val),
                          'Remmember me!'.toLabel(),
                          Spacer(),
                          MTextButton(title: 'Regester', onPressed: () {})
                        ],
                      ),
                      Row(
                        // mainAxisSize: MainAxisSize.min,
                        children: [
                          MButton(
                              title: 'Login',
                              icon: const Icon(
                                Icons.vpn_key,
                                size: 15,
                              ),
                              color: Colors.blue,
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  context.userBloc.authenticate(
                                      _mobile.text, _pass.text, _remember);
                                }
                              }).margin9,
                          state is Loading ? const MWaiting() : Container(),
                          const Spacer(),
                          MTextButton(
                              title: 'forgot my password !', onPressed: () {})
                        ],
                      ),
                    ],
                  ),
                ),
                state is Failed
                    ? MError(exeption: (state as Failed).exception)
                    : Container()
              ],
            ),
          ),
        ).padding9.card.center,
      ),
    );
  }
}
