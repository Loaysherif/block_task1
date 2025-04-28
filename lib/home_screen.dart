import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_cubit.dart';
import 'theme_cubit.dart';

// HomeScreen widget displays the counter and theme toggle
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BLoC Counter App')),
      body: Center(
        child: BlocConsumer<CounterCubit, int>(
          listener: (context, state) {
            // Show a dialog when the counter reaches a negative value
            if (state < 0) {
              showDialog(
                context: context,
                builder:
                    (context) => AlertDialog(
                      title: Text('Counter is negative'),
                      content: Text('The counter value is negative: $state'),
                    ),
              );
            }
            // Show a SnackBar when the counter reaches 10 or -10
            if (state == 10) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('Counter reached 10!')));
            } else if (state == -10) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('Counter reached -10!')));
            }
          },
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Counter: $state',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        // Increment the counter
                        context.read<CounterCubit>().increment();
                      },
                      icon: Icon(Icons.add),
                    ),
                    IconButton(
                      onPressed: () {
                        // Decrement the counter
                        context.read<CounterCubit>().decrement();
                      },
                      icon: Icon(Icons.remove),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    // Toggle the theme
                    context.read<ThemeCubit>().toggleTheme();
                  },
                  child: const Text('Toggle Theme'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
