import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizizz/global/data/route_names.dart';
import 'package:quizizz/quiz_page/business_logic/cubits/quiz_cubit/quiz_cubit.dart';
import 'package:quizizz/router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => QuizCubit()),
        ],
        child: MaterialApp(
          initialRoute: RouteNames.SPLASH_SCREEN,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          onGenerateRoute: AppRouter.generateRoute,
        ));
  }
}
