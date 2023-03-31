import 'package:bloc/bloc.dart';
import 'package:carryvibeapp/features/posts/constants/add_post_constants.dart';
import 'package:carryvibeapp/features/posts/cubit/add_travel_state.dart';
import 'package:carryvibeapp/features/posts/model/add_travel_request_model.dart';
import 'package:carryvibeapp/features/posts/model/carrier_orders_model.dart';
import 'package:carryvibeapp/product/enums/api_collection_enum.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddTravelCubit extends Cubit<AddTravelState> {
  Owner owner = Owner();
  AddTravelCubit() : super(AddTravelInitial());

  Future<void> createPostWithDateAndTime(
      CarrierOrdersModel /* AddTravelRequestModel */ model) async {
    final FirebaseAuth user = FirebaseAuth.instance;
    emit(const AddTravelLoading());
    try {
      await FirebaseFirestore.instance
          .collection(ApiCollectionEnum.carrierOrdersCollection.collectionName)
          .doc()
          .set(
            CarrierOrdersModel(
              id: "",
              title: model.title,
              isActive: true,
              picture: "",
              owner: model
                  .owner, //Owner(fullName: user.currentUser!.displayName, id: user.currentUser!.uid,),
              date: model.date,
              status: model.status,
              deliveryLocation: model.deliveryLocation,
              depatureLocation: model.depatureLocation,
            ).toJson(),
            SetOptions(merge: true),
          );
      emit(AddTravelCompleted(
        AddPostConstants.SUCCESS,
      ));
    } catch (e) {
      emit(AddTravelError(e.toString()));
    }

    /* final FirebaseAuth user = FirebaseAuth.instance;
    emit(const AddTravelLoading());
    var information = await FirebaseFirestore.instance
        .collection("/Users")
        .doc("/gu3rHxRd6Uc2b10CkefDPgIOahe2")
        .get()
        .toString(); 
        
        
        collection(ApiCollectionEnum.carrierOrdersCollection.collectionName)
          .doc(user.currentUser?.uid)
          .set(
            AddTravelRequestModel(
              id: user.user!.uid,
            
            
            )
          );*/
  }
}
/* 
AddTravelRequestModel(
                    id: user.currentUser!.uid,
                    date: model.date,
                    time: model.time,
                    startLocation: model.startLocation,
                    finishLocation: model.finishLocation)
                    
    CarrierOrdersModel(
              id: "",
              title: user.currentUser?.uid,
              isActive: true,
              picture: "",
              owner: model.owner,
              date: model.date,
              status: model.status,
              deliveryLocation: model.deliveryLocation,
              depatureLocation: model.depatureLocation,
            )                 */