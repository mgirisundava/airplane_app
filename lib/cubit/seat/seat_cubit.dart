import 'package:bloc/bloc.dart';

class SeatCubit extends Cubit<List<String>> {
  SeatCubit() : super([]);

  void selectSeat(String id) {
    if (!isSelected(id)) {
      state.add(id);
    } else {
      state.remove(id);
    }
    emit(List.from(state));
  }

  isSelected(String id) {
    int currentIndex = state.indexOf(id);
    if (currentIndex == -1) {
      return false;
    } else {
      return true;
    }
  }

  removeAllSeat() {
    state.clear();
   }
}
