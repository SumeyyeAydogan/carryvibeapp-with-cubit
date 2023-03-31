import 'package:equatable/equatable.dart';

abstract class AddProductState extends Equatable {
  const AddProductState();

  @override
  List<Object> get props => [];
}

class AddProductInitial extends AddProductState {}

class AddProductLoading extends AddProductState {
  const AddProductLoading();
}

class AddProductCompleted extends AddProductState {
  final String message;
  const AddProductCompleted(this.message);
  @override
  List<Object> get props => [message];
}

class AddProductError extends AddProductState {
  final String message;
  const AddProductError(this.message);
  @override
  List<Object> get props => [message];
}