part of 'add_post_cubit.dart';

abstract class AddPostState extends Equatable {
  const AddPostState();

  @override
  List<Object> get props => [];

}

class AddPostInitial extends AddPostState {
  final TabController? tabController;
  const AddPostInitial(this.tabController);
}

class AddPostLoading extends AddPostState {}