import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_cubit.dart';
import 'theme_cubit.dart';
import 'home_screen.dart';

// Main function
void main() {
  runApp(MyApp());
}

// MyApp widget sets up the BLoC providers and theme
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CounterCubit(),
        ), // CounterCubit for managing counter state
        BlocProvider(
          create: (_) => ThemeCubit(),
        ), // ThemeCubit for managing theme state
      ],
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, themeState) {
          return MaterialApp(
            theme: themeState, // Apply theme dynamically
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}
