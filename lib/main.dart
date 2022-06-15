import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'block/block_state.dart';
import 'block/user_block.dart';
import 'screens/dashboard.dart';
import 'screens/login.dart';


void main() => runApp(MultiBlocProvider(
    providers: [BlocProvider<UserBlock>(create: (_) => UserBlock())],
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
      home: BlocBuilder<UserBlock, BlockState>(
        builder: (context, state) {
          if (state is Authenticated) return const Dashboard();
          return Login(state: state);
        },
      ),
    );
  }
}
