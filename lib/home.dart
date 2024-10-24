import 'package:counter_app/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counterCubit = BlocProvider.of<CounterCubit>(context);
    return Scaffold(
      body: Center(
        child: Container(
          width: 250,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.grey.shade900,
            borderRadius: BorderRadius.circular(100),
          ),
          child: BlocBuilder<CounterCubit, int>(
            bloc: counterCubit,
            builder: (context, counter) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () => counterCubit.decrement(),
                    icon: const Icon(Icons.remove, size: 40),
                  ),
                  const SizedBox(width: 5),
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey.shade800,
                    child: Text(
                      '$counter',
                      style: const TextStyle(
                        fontSize: 40,
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  IconButton(
                    onPressed: () => counterCubit.increment(),
                    icon: const Icon(Icons.add, size: 40),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
