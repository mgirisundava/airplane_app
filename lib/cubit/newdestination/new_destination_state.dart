part of 'new_destination_cubit.dart';

abstract class NewDestinationState extends Equatable {
  const NewDestinationState();

  @override
  List<Object> get props => [];
}

class NewDestinationInitial extends NewDestinationState {}

class NewDestinationLoading extends NewDestinationState {}

class NewDestinationSuccess extends NewDestinationState {
  final List<DestinationModel> newDestination;

  const NewDestinationSuccess(this.newDestination);

  @override
  List<Object> get props => [newDestination];
}

class NewDestinationFailed extends NewDestinationState {
  final String error;

  const NewDestinationFailed(this.error);

  @override
  List<Object> get props => [error];
}
