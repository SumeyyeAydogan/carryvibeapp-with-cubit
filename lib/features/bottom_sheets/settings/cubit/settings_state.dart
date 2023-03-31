part of 'settings_cubit.dart';

abstract class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object> get props => [];
}

class SettingsInitial extends SettingsState {}

class SettingsLoading extends SettingsState {
  const SettingsLoading();
}

class SettingsCompleted extends SettingsState {
  final UserProfileResponseModel model;
  const SettingsCompleted(this.model);
  @override
  List<Object> get props => [model];
}

class SettingsError extends SettingsState {
  final String errorMessage;
  const SettingsError(this.errorMessage);
}