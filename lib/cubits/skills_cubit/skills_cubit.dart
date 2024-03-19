import 'package:flutter_bloc/flutter_bloc.dart';

part 'skills_state.dart';

class SkillsCubit extends Cubit<SkillsState> {
  SkillsCubit() : super(SkillsState([]));

  // Function to add a skill to the list
  void addSkill(String skill) {
    List<String> updatedSkills = List.from(state.skills);
    updatedSkills.add(skill);
    emit(SkillsState(updatedSkills));
  }

  // Function to delete a skill from the list
  void deleteSkill(int index) {
    List<String> updatedSkills = List.from(state.skills);
    updatedSkills.removeAt(index);
    emit(SkillsState(updatedSkills));
  }
}
