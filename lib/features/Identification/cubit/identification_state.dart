import 'package:equatable/equatable.dart';

abstract class IdentificationState extends Equatable {
  const IdentificationState();

  @override
  List<Object> get props => [];
}

class IdentificationInitial extends IdentificationState {}

class IdentificationLoading extends IdentificationState {
  const IdentificationLoading();
}

class IdentificationCompleted extends IdentificationState {
  final String message;
  const IdentificationCompleted(this.message);
  @override
  List<Object> get props => [message];
}

class IdentificationError extends IdentificationState {
  final String message;
  const IdentificationError(this.message);
  @override
  List<Object> get props => [message];
}
