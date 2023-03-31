import 'package:bloc/bloc.dart';
import 'package:carryvibeapp/features/posts/constants/add_post_constants.dart';
import 'package:carryvibeapp/features/posts/cubit/add_product_state.dart';
import 'package:carryvibeapp/features/posts/model/add_product_request_model.dart';
import 'package:carryvibeapp/features/posts/model/sender_orders_model.dart';
import 'package:carryvibeapp/product/enums/api_collection_enum.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit() : super(AddProductInitial());

  Future<void> createPostWithDetailAndProduct(
      SenderOrdersModel model) async {
    final FirebaseAuth user = FirebaseAuth.instance;
    emit(const AddProductLoading());
    try {
      await FirebaseFirestore.instance
          .collection(ApiCollectionEnum.senderOrdersCollection.collectionName)
          .doc()
          .set(
            SenderOrdersModel(
              id: model.id,
              title: model.title,
              description: model.description,
              sizeType: model.sizeType,
              deliveryLocation: model.deliveryLocation,
              depatureLocation: model.depatureLocation,
              isActive: true,
            ).toJson(),
            SetOptions(merge: true),
          );
          
      emit(const AddProductCompleted(AddPostConstants.SUCCESS));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'empty-input') {
        emit(const AddProductError(AddPostConstants.EMPTY_INPUT));
      }
    } catch (e) {
      emit(const AddProductError(AddPostConstants.ERROR_EXCEPTION));
    }
  }
}


/**************************
  //Add product cubit için firebase_auth.dart dosyasına bu şekilde mi yazılmalı?
  Future<dynamic> createPostWithDetailAndProduct({
    required String detail,
    required String product,
    required String startLocation,
    required String finishLocation,
    required double size,
  }) async {
    return dynamic._(
      this,
      await _delegate.createPostWithDetailAndProduct(detail, product, startLocation, finishLocation, size),
    );
  }
  */

  /* .createPostWithDetailAndProduct(
        detail: model.description,
        product: model.title,
        startLocation: model.deliveryLocation,
        finishLocation: model.depatureLocation,
        size: model.sizeType,
      ) 
      
      
      .then((product) {
        FirebaseFirestore.instance
            .collection('products')
            .doc(product.product?.uid)
            .set({
          'id': product.product?.uid,
          'detail': product.product?.detail,
          'product': model.product,
          'startLocation': model.startLocation,
          'finishLocation': model.finishLocation,
          'size': 0
        });
      });*/