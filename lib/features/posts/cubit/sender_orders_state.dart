part of 'sender_orders_cubit.dart';

abstract class SenderOrdersState extends Equatable {
  const SenderOrdersState();

  @override
  List<Object> get props => [];
}

class SenderOrdersInitial extends SenderOrdersState {
  const SenderOrdersInitial();
}

class SenderOrdersLoading extends SenderOrdersState {
  const SenderOrdersLoading();
}

class SenderOrdersCompleted extends SenderOrdersState {
  final List<SenderOrdersModel> senderOrdersModel;
  const SenderOrdersCompleted(this.senderOrdersModel);
  @override
  List<Object> get props => [senderOrdersModel];
}

class SenderOrdersError extends SenderOrdersState {
  final String message;
  const SenderOrdersError(this.message);
}
