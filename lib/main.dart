import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bloc_project/injection/injection_container.dart'
    as dependency_injection;
import 'package:my_bloc_project/presentation/home/view.dart';
import 'package:my_bloc_project/presentation/login/bloc.dart';
import 'package:my_bloc_project/presentation/login/view.dart';

import 'injection/injection_container.dart';

void main() async {
  //使用async 需加入這段
  WidgetsFlutterBinding.ensureInitialized();
  await dependency_injection.setup();
  await runZonedGuarded(() async {
    runApp(MyApp());
  }, (error, stackTrace) {});
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (BuildContext context) => LoginBloc(getIt()))
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          debugShowCheckedModeBanner: false,
          routes: <String, WidgetBuilder>{
            "/": (_) => LoginPage(),
            "/home": (_) => HomePage(),
          },
          initialRoute: "/",
        ));
  }
}
