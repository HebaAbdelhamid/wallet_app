import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet_app/Screens/bottonNavigationBar.dart';
import 'package:wallet_app/Screens/category.dart';
import 'package:wallet_app/Screens/eachCategory_chart.dart';
import 'package:wallet_app/Screens/home.dart';
import 'package:wallet_app/Screens/login.dart';
import 'package:wallet_app/Screens/register.dart';
import 'package:wallet_app/cubit/login_cubit.dart';
import 'package:wallet_app/cubit/register_cubit.dart';
import 'package:wallet_app/data/remote/cache_helper.dart';
import 'package:wallet_app/data/remote/dio_helper.dart';
import 'package:wallet_app/screen/splach.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => RegisterCubit(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
