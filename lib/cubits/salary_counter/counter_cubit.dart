import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mohamed_ali/configs/configs.dart';

/// {@template counter_cubit}
/// A [Cubit] which manages an [int] as its state.
/// {@endtemplate}
class CounterCubit extends Cubit<int> {
  /// {@macro counter_cubit}
  CounterCubit() : super(1000);

  /// Add 100 to the current state.
  void increment(BuildContext context) => state < 1000
      ? emit(state + 100)
      : ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(seconds: 1),
            content: Text(
              "Maximum Salary is 1000 SAR",
              style: AppText.b1b?.copyWith(color: Colors.red),
            ),
          ),
        );

  /// Subtract 100 from the current state.
  void decrement(BuildContext context) {
    state > 100
        ? emit(state - 100)
        : ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: const Duration(seconds: 1),
              content: Text(
                "Minimum Salary is 100 SAR",
                style: AppText.b1b?.copyWith(color: Colors.red),
              ),
            ),
          );
  }
}
