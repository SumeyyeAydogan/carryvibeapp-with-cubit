part of 'profile_cubit.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {
  const ProfileLoading();
}

class ProfileCompleted extends ProfileState {
  final UserProfileResponseModel model;
  const ProfileCompleted(this.model);
  @override
  List<Object> get props => [model];
}

class ProfileError extends ProfileState {
  final String errorMessage;
  const ProfileError(this.errorMessage);
}
