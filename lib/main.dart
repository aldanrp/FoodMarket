import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_food/UI/pages/splashscreen.dart';
import 'package:get/get.dart';
import 'package:restaurant_food/cubit/cubit.dart';
import 'package:restaurant_food/cubit/user_cubit.dart';
import 'UI/pages/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => UserCubit()),
        BlocProvider(create: (_) => FoodCubit()),
        BlocProvider(create: (_) => TransactionsCubit()),
      ],
      child: const GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: SignInpage(),
      ),
    );
  }
}
