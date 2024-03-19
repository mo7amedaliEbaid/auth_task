part of 'select_gender_cubit.dart';

abstract class SelectGenderState {}

class GenderSelected extends SelectGenderState {
  final int genderType;

  GenderSelected(this.genderType);
}