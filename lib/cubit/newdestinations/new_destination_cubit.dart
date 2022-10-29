// ignore_for_file: use_rethrow_when_possible

import 'package:airplane_app/models/destination_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../services/new_destination_service.dart';

part 'new_destination_state.dart';

class NewDestinationCubit extends Cubit<NewDestinationState> {
  NewDestinationCubit() : super(NewDestinationInitial());

  Future<void> getNewDestinations() async {
    try {
      emit(NewDestinationLoading());

      List<DestinationModel> newDestinations =
          await NewDestinationService().getNewDestinations();

      emit(NewDestinationSuccess(newDestinations));
    } catch (e) {
      emit(NewDestinationFailed(e.toString()));
    }
  }
}
