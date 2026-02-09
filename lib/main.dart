import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foods_app/bloc/button/bottomnav_bloc.dart';
import 'package:foods_app/bloc/cart/cart_bloc.dart';
import 'package:foods_app/data/notifier.dart';
import 'package:foods_app/view/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: darkmode,
      builder: (context, themes, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => BottomNavBloc()),
            BlocProvider(create: (context) => CartBloc()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.red,
                brightness: (themes) ? Brightness.light : Brightness.dark,
              ),
            ),
            home: Splashscreen(),
          ),
        );
      },
    );
  }
}
