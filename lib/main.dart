import 'package:flutter/material.dart';
import 'package:flutter_schoo_management_system/module/widgets.dart';
import 'package:flutter_schoo_management_system/screens/dashboard.dart';
import 'module/extension.dart';

void main() => runApp(const MyApp());

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
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SafeArea(
        child: Container(
          width: context.width * 0.3 < 350 ? 350 : context.width * 0.3,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: context.height * 0.15,
              ),
              'Welcome to school Test'
                  .toLabel(bold: true, color: Colors.grey, fontsize: 22),
              const Edit(
                hint: 'username',
              ).margin9,
              const Edit(
                hint: 'password',
                password: true,
              ).margin9,
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Button(
                    title: 'Register',
                    onTap: () => {print('clicked')},
                    icon: const Icon(Icons.edit),
                    padding: const EdgeInsets.all(22),
                    color: Colors.green,
                  ).margin9,
                  Button(
                    title: 'login',
                    icon: const Icon(Icons.key),
                    padding: const EdgeInsets.all(22),
                    color: Colors.blue,
                    onTap: () => context.showForm(const Dashboard()),
                  ).margin9,
                ],
              )
            ],
          ),
        ).padding9.card.center,
      ),
    );
  }
}
