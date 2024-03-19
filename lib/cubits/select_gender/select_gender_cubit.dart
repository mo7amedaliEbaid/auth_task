import 'package:flutter_bloc/flutter_bloc.dart';

part 'select_gender_state.dart';

class SelectGenderCubit extends Cubit<SelectGenderState> {
  SelectGenderCubit() : super(GenderSelected(0)); // Default to male

  void selectGender(int genderType) {
    emit(GenderSelected(genderType));
  }
}
