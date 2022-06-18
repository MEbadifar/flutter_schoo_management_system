import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_strategy/url_strategy.dart';

import 'bloc/ThemeBloc.dart';
import 'bloc/bloc_state.dart';
import 'bloc/user_bloc.dart';
import 'module/Theme.dart';
import 'screens/Dashboard/dashboard.dart';

void main() {
  setPathUrlStrategy();
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider<ThemeBloc>(create: (_) => ThemeBloc()),
      BlocProvider<UserBloc>(create: (_) => UserBloc())
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, BlocState>(
      builder: (_, state) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'school Management',
        theme: appThemeData[state is ThemeState ? state.theme : AppTheme.Light],
        home: const Dashboard(),
        // home: BlocBuilder<UserBloc, BlocState>(
        //   builder: (context, state) {
        //     if (state is Authenticated) return Dashboard();
        //     return Login(state: state);
        //   },
        // ),
      ),
    );
  }
}
