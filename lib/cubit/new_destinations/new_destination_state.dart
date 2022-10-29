part of 'new_destination_cubit.dart';

abstract class NewDestinationState extends Equatable {
  const NewDestinationState();

  @override
  List<Object> get props => [];
}

class NewDestinationInitial extends NewDestinationState {}

class NewDestinationLoading extends NewDestinationState {}

class NewDestinationSuccess extends NewDestinationState {
  final List<DestinationModel> newDestinations;

  const NewDestinationSuccess(this.newDestinations);

  @override
  List<Object> get props => [newDestinations];
}

class NewDestinationFailed extends NewDestinationState {
  final String error;

  const NewDestinationFailed(this.error);

  @override
  List<Object> get props => [error];
}
