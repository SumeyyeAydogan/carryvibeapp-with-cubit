import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'add_post_state.dart';

class AddPostCubit extends Cubit<AddPostState> {
  TabController? tabController;
  AddPostCubit(this.tabController)
      : super(AddPostInitial(tabController));
  void changeIndex({required int index}) {
    emit(AddPostLoading());
    tabController?.index = index;
    print(tabController?.index);
    emit(AddPostInitial(tabController));
  }
}
