import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bloc_state.dart';
import 'bloc/user_bloc.dart';
import 'screens/Dashboard/dashboard.dart';
import 'screens/login.dart';

void main() => runApp(MultiBlocProvider(
    providers: [BlocProvider<UserBloc>(create: (_) => UserBloc())],
    child: const MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'school Management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Dashboard(),
      // home: BlocBuilder<UserBloc, BlocState>(
      // builder: (context, state) {
      //   if (state is Authenticated) return const Dashboard();
      //   return Login(state: state);
      // },
      // ),
    );
  }
}
