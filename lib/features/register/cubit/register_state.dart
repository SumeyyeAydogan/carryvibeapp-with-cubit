part of 'register_cubit.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {
  const RegisterLoading();
}

class RegisterCompleted extends RegisterState {
  final String message;
  const RegisterCompleted(this.message);
  @override
  List<Object> get props => [message];
}

class RegisterError extends RegisterState {
  final String message;
  const RegisterError(this.message);
  @override
  List<Object> get props => [message];
}
