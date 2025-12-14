import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/presentaion/auth/bloc/auth_bloc.dart';
import 'package:quiz_app/presentaion/history/bloc/attempt_bloc.dart';
import 'package:quiz_app/presentaion/home/bloc/home_bloc.dart';
import 'core/di/init_dependencies.dart';
import 'core/palletes/themes/themes.dart';

class MyApp extends StatelessWidget {
  final Widget intialPage;
  const MyApp({super.key, required this.intialPage});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Builder(
          builder: (context) {
            final m = MediaQuery.of(context);
            return MediaQuery(
              data: m.copyWith(textScaler: const TextScaler.linear(1)),
              child: MultiBlocProvider(
                providers: [
                  BlocProvider<AuthBloc>(create: (context) => sl<AuthBloc>()),
                  BlocProvider<HomeBloc>(create: (context) => sl<HomeBloc>()),
                  BlocProvider<AttemptBloc>(create: (context) => sl<AttemptBloc>()),
                ],
                child: MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: themeData,
                  home: intialPage,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
