
import 'package:carryvibeapp/core/extension/context_extension.dart';
import 'package:carryvibeapp/features/Identification/cubit/identification_cubit.dart';
import 'package:carryvibeapp/features/Identification/cubit/identification_state.dart';
import 'package:carryvibeapp/product/widgets/button/custom_button.dart';
import 'package:carryvibeapp/product/widgets/functions/get_user_function.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';

import '../../../../product/widgets/button/constants.dart';
import '../../../core/constants/application_constants.dart';
import '../../../core/init/theme/carry_vibe_theme.dart';
import '../../../core/style.dart';
import '../../../product/enums/api_collection_enum.dart';
import '../../../product/widgets/button/custom_circular_button.dart';
import '../../../product/widgets/button/custom_elevated_button.dart';
import '../../../product/widgets/input/login_form_input.dart';
import '../../Identification/constants/identification_constants.dart';
import '../../Identification/view/identification_view.dart';
import '../../register/model/register_request_model.dart';
import '../constants/add_post_constants.dart';
import '../cubit/add_post_cubit.dart';
import '../cubit/add_product_cubit.dart';
import '../cubit/add_product_state.dart';
import '../cubit/add_travel_cubit.dart';
import '../cubit/add_travel_state.dart';
import '../model/carrier_orders_model.dart';
import '../model/sender_orders_model.dart';

class AddPostPage extends StatefulWidget {
  @override
  State<AddPostPage> createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage>
    with TickerProviderStateMixin {
  final TextEditingController _product = TextEditingController();
  final TextEditingController _detail = TextEditingController();
  final TextEditingController _date = TextEditingController();
  final TextEditingController _time = TextEditingController();
  final TextEditingController _startLocation = TextEditingController();
  final TextEditingController _finishLocation = TextEditingController();
  final TextEditingController _size = TextEditingController();
  final _addProductFormKey = GlobalKey<FormState>();
  final _addTravelFormKey = GlobalKey<FormState>();
  final FirebaseAuth user = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddPostCubit(TabController(length: 2, vsync: this)),
      child: BlocConsumer<AddPostCubit, AddPostState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is AddPostInitial) {
            return DefaultTabController(
              initialIndex: 0,
              length: 2,
              child: Column(
                children: [
                  const Expanded(flex: 1, child: SizedBox()),
                  Expanded(
                    flex: 5,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 0,
                            child: Padding(
                              padding: context.paddingMediumVertical,
                              child: TabBar(
                                  indicatorColor: Colors.transparent,
                                  controller: state.tabController,
                                  tabs: [
                                    CustomButton(
                                      isSelect: state.tabController?.index == 0
                                          ? true
                                          : false,
                                      onPressed: () {
                                        context
                                            .read<AddPostCubit>()
                                            .changeIndex(index: 0);
                                      },
                                      title: ButtonConstants.ADD_TRAVEL,
                                      width: context.width * 0.45,
                                    ),
                                    CustomButton(
                                      buttonColor: CarryVibeTheme
                                          .defaultTheme.colorScheme.primary,
                                      isSelect: state.tabController?.index == 0
                                          ? false
                                          : true,
                                      onPressed: () {
                                        context
                                            .read<AddPostCubit>()
                                            .changeIndex(index: 1);
                                      },
                                      title: ButtonConstants.ADD_PRODUCT,
                                      width: context.width * 0.45,
                                    ),
                                  ]),
                            ),
                          ),
                          Expanded(
                            child: TabBarView(
                                controller: state.tabController,
                                children: const [
                                  _AddTravelBuildList(),
                                  _AddProductBuildList(),
                                ]),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}

class _AddTravelBuildList extends StatefulWidget {
  const _AddTravelBuildList({Key? key}) : super(key: key);

  @override
  State<_AddTravelBuildList> createState() => _AddTravelBuildListState();
}

class _AddTravelBuildListState extends State<_AddTravelBuildList> {
  final TextEditingController _date = TextEditingController();
  final TextEditingController _time = TextEditingController();
  final TextEditingController _startLocation = TextEditingController();
  final TextEditingController _finishLocation = TextEditingController();
  final _addTravelFormKey = GlobalKey<FormState>();
  final FirebaseAuth user = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddTravelCubit>(
      create: (context) => AddTravelCubit(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _addTravelFormKey,
          child: ListView(
            children: [
              Padding(
                padding: context.paddingLowVertical,
                child: LoginInputFormField(
                  title: AddPostConstants.START_LOCATION,
                  controller: _startLocation,
                  onSaved: (value) {
                    _startLocation.text = value!;
                  },
                  validator: FormBuilderValidators.required(
                      errorText: ApplicationConstants.VALIDATE_FORM_ERROR),
                ),
              ),
              Padding(
                padding: context.paddingLowVertical,
                child: LoginInputFormField(
                  title: AddPostConstants.FINISH_LOCATION,
                  controller: _finishLocation,
                  onSaved: (value) {
                    _finishLocation.text = value!;
                  },
                  validator: FormBuilderValidators.required(
                      errorText: ApplicationConstants.VALIDATE_FORM_ERROR),
                ),
              ),
              Padding(
                padding: context.paddingLowVertical,
                child: LoginInputFormField(
                  title: AddPostConstants.DATE,
                  controller: _date,
                  /* onSaved: (value) {
                      _date.text = value!;
                    }, */
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2022),
                        lastDate: DateTime(2024));
                    if (pickedDate != null) {
                      setState(() {
                        _date.text =
                            DateFormat("dd.MM.yyyy").format(pickedDate);
                      });
                    }
                  },
                  validator: FormBuilderValidators.required(
                      errorText: ApplicationConstants.VALIDATE_FORM_ERROR),
                ),
              ),
              Padding(
                padding: context.paddingLowVertical,
                child: LoginInputFormField(
                  title: AddPostConstants.TIME,
                  controller: _time,
                  onTap: () async {
                    final pickedTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.fromDateTime(DateTime.now()));
                    if (_date != null) {
                      _time.text = pickedTime?.format(context) ?? "";
                    }
                  },
                  validator: FormBuilderValidators.required(
                      errorText: ApplicationConstants.VALIDATE_FORM_ERROR),
                ),
              ),
              BlocConsumer<AddTravelCubit, AddTravelState>(
                builder: (context, state) {
                  if (state is AddTravelLoading) {
                    return CustomCircularButton(
                      primaryColor: context.theme.colorScheme.primary,
                      minimumSize: Size(context.width * 0.9, 45),
                    );
                  } else {
                    return CustomElevationButton(
                        primaryColor: context.theme.colorScheme.secondary,
                        minimumSize: Size(context.width * 0.9, 45),
                        onPressed: () async {
                          if (_addTravelFormKey.currentState != null &&
                              _addTravelFormKey.currentState!.validate()) {
                            _addTravelFormKey.currentState!.save();
                            RegisterRequestModel? userModel = await getUser();
                            String isIdentity = userModel!.isIdentity;
                            String fullName = userModel.fullName;

                            print("isIdentity" + isIdentity);
                            if (isIdentity == "false") {
                              await showModalBottomSheet(
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (
                                    context,
                                  ) =>
                                      IdentificationPage());
                              userModel = await getUser();
                              isIdentity = userModel!.isIdentity;
                            }
                            print("identificationBuildList Çalıştı");
                            userModel = await getUser();
                            isIdentity = userModel!.isIdentity;

                            if (isIdentity == "true") {
                              await context
                                  .read<AddTravelCubit>()
                                  .createPostWithDateAndTime(CarrierOrdersModel(
                                    id: "${FirebaseFirestore.instance.collection(ApiCollectionEnum.carrierOrdersCollection.collectionName).doc()}",
                                    title: fullName,
                                    date: [_date.text, _time.text],
                                    deliveryLocation: _startLocation.text,
                                    depatureLocation: _finishLocation.text,
                                    status: 0,
                                    /* owner: Owner(
                                                  fullName: user
                                                      .currentUser!.displayName,
                                                  id: user.currentUser!.uid,
                                                ) */
                                  ));
                            }
                          }
                        },
                        title: Text(
                          ButtonConstants.SEND,
                          style: whiteBold15,
                        ));
                  }
                },
                listener: (context, state) {
                  //Navigator.pop(context);
                  //Navigator.of(context).pop();
                  if (state is AddTravelError) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        duration: Duration(seconds: 4),
                        content: Text(state.message)));
                    Navigator.of(context).pop();
                  }
                  if (state is AddTravelCompleted) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.greenAccent,
                        duration: Duration(seconds: 4),
                        content: Text(
                          state.message,
                          style: const TextStyle(color: Colors.white),
                        )));
                    Navigator.of(context).pop();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AddProductBuildList extends StatefulWidget {
  const _AddProductBuildList({Key? key}) : super(key: key);

  @override
  State<_AddProductBuildList> createState() => _AddProductBuildListState();
}

class _AddProductBuildListState extends State<_AddProductBuildList> {
  final TextEditingController _product = TextEditingController();
  final TextEditingController _detail = TextEditingController();
  final TextEditingController _startLocation = TextEditingController();
  final TextEditingController _finishLocation = TextEditingController();
  final TextEditingController _size = TextEditingController();
  final TextEditingController _productQuantity = TextEditingController();
  final TextEditingController _receiverNameSurname = TextEditingController();
  final TextEditingController _receiverNumber = TextEditingController();
  final _addProductFormKey = GlobalKey<FormState>();
  final FirebaseAuth user = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddProductCubit>(
      create: (context) => AddProductCubit(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _addProductFormKey,
          child: ListView(
            children: [
              Padding(
                padding: context.paddingLowVertical,
                child: LoginInputFormField(
                  title: AddPostConstants.PRODUCT,
                  controller: _product,
                  onSaved: (value) {
                    _product.text = value!;
                  },
                  validator: FormBuilderValidators.required(
                      errorText: ApplicationConstants.VALIDATE_FORM_ERROR),
                ),
              ),
              Padding(
                padding: context.paddingLowVertical,
                child: LoginInputFormField(
                  title: AddPostConstants.DETAIL,
                  controller: _detail,
                  onSaved: (value) {
                    _detail.text = value!;
                  },
                  validator: FormBuilderValidators.required(
                      errorText: ApplicationConstants.VALIDATE_FORM_ERROR),
                ),
              ),
              Padding(
                padding: context.paddingLowVertical,
                child: LoginInputFormField(
                  title: AddPostConstants.START_LOCATION,
                  controller: _startLocation,
                  onSaved: (value) {
                    _startLocation.text = value!;
                  },
                  validator: FormBuilderValidators.required(
                      errorText: ApplicationConstants.VALIDATE_FORM_ERROR),
                ),
              ),
              Padding(
                padding: context.paddingLowVertical,
                child: LoginInputFormField(
                  title: AddPostConstants.FINISH_LOCATION,
                  controller: _finishLocation,
                  onSaved: (value) {
                    _finishLocation.text = value!;
                  },
                  validator: FormBuilderValidators.required(
                      errorText: ApplicationConstants.VALIDATE_FORM_ERROR),
                ),
              ),
              Padding(
                padding: context.paddingLowVertical,
                child: LoginInputFormField(
                  title: AddPostConstants.SIZE,
                  controller: _size,
                  onSaved: (value) {
                    _size.text = value!;
                  },
                  validator: FormBuilderValidators.required(
                      errorText: ApplicationConstants.VALIDATE_FORM_ERROR),
                ),
              ),
              Padding(
                padding: context.paddingLowVertical,
                child: LoginInputFormField(
                  title: AddPostConstants.PRODUCT_QUANTITY,
                  controller: _productQuantity,
                  onSaved: (value) {
                    _productQuantity.text = value!;
                  },
                  validator: FormBuilderValidators.required(
                      errorText: ApplicationConstants.VALIDATE_FORM_ERROR),
                ),
              ),
              Padding(
                padding: context.paddingLowVertical,
                child: LoginInputFormField(
                  title: AddPostConstants.RECEIVER_NAME_SURNAME,
                  controller: _receiverNameSurname,
                  onSaved: (value) {
                    _receiverNameSurname.text = value!;
                  },
                  validator: FormBuilderValidators.required(
                      errorText: ApplicationConstants.VALIDATE_FORM_ERROR),
                ),
              ),
              Padding(
                padding: context.paddingLowVertical,
                child: LoginInputFormField(
                  title: AddPostConstants.RECEIVER_NUMBER,
                  controller: _receiverNumber,
                  onSaved: (value) {
                    _receiverNumber.text = value!;
                  },
                  validator: FormBuilderValidators.required(
                      errorText: ApplicationConstants.VALIDATE_FORM_ERROR),
                ),
              ),
              BlocConsumer<AddProductCubit, AddProductState>(
                builder: (context, state) {
                  if (state is AddProductLoading) {
                    return CustomCircularButton(
                      primaryColor: context.theme.colorScheme.primary,
                      minimumSize: Size(context.width * 0.9, 45),
                    );
                  } else {
                    return CustomElevationButton(
                        primaryColor: context.theme.colorScheme.primary,
                        minimumSize: Size(context.width * 0.9, 45),
                        onPressed: () async {
                          if (_addProductFormKey.currentState != null &&
                              _addProductFormKey.currentState!.validate()) {
                            _addProductFormKey.currentState!.save();

                            RegisterRequestModel? userModel = await getUser();
                            String isIdentity = userModel!.isIdentity;
                            String fullName = userModel.fullName;
                            if (isIdentity == "false") {
                              await showModalBottomSheet(
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (
                                    context,
                                  ) =>
                                      IdentificationPage());
                              userModel = await getUser();
                              isIdentity = userModel!.isIdentity;
                            }
                            print("identificationBuildList Çalıştı");
                            userModel = await getUser();
                            fullName = userModel!.fullName;
                            isIdentity = userModel.isIdentity;
                            //Owner owner = Owner(fullName: fullName, id: userModel.id);
                            //problemi tırnakla çözdüm**************************
                            if (isIdentity == "true") {
                              await context
                                  .read<AddProductCubit>()
                                  .createPostWithDetailAndProduct(
                                      SenderOrdersModel(
                                    //idyi çekemiyorum :/
                                    id: "${FirebaseFirestore.instance.collection(ApiCollectionEnum.senderOrdersCollection.collectionName).doc()}",
                                    description: _detail.text,
                                    title: _product.text,
                                    deliveryLocation: _startLocation.text,
                                    depatureLocation: _finishLocation.text,
                                    sizeType: 0,
                                  ));
                            }
                          }
                        },
                        title: Text(
                          ButtonConstants.SEND,
                          style: whiteBold15,
                        ));
                  }
                },
                listener: (context, state) {
                  if (state is AddProductError) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(state.message)));
                    Navigator.of(context).pop();
                  }
                  if (state is AddProductCompleted) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.greenAccent,
                        content: Text(
                          state.message,
                          style: const TextStyle(color: Colors.white),
                        )));
                    Navigator.of(context).pop();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _IdentificationBuildList extends StatefulWidget {
  const _IdentificationBuildList({Key? key}) : super(key: key);
  @override
  State<_IdentificationBuildList> createState() =>
      _IdentificationBuildListState();
}

class _IdentificationBuildListState extends State<_IdentificationBuildList> {
  final TextEditingController _number = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _surname = TextEditingController();
  final TextEditingController _birthYear = TextEditingController();
  final _authenticationFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<IdentificationCubit>(
      create: (context) => IdentificationCubit(),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Form(
            key: _authenticationFormKey,
            child: ListView(
              shrinkWrap: true,
              children: [
                Padding(
                  padding: context.paddingLowVertical,
                  child: LoginInputFormField(
                    title: IdentificationConstants.NUMBER,
                    controller: _number,
                    onSaved: (value) {
                      _number.text = value!;
                    },
                    validator: FormBuilderValidators.required(
                        errorText: ApplicationConstants.VALIDATE_FORM_ERROR),
                  ),
                ),
                Padding(
                  padding: context.paddingLowVertical,
                  child: LoginInputFormField(
                    title: IdentificationConstants.NAME,
                    controller: _name,
                    onSaved: (value) {
                      _name.text = value!;
                    },
                    validator: FormBuilderValidators.required(
                        errorText: ApplicationConstants.VALIDATE_FORM_ERROR),
                  ),
                ),
                Padding(
                  padding: context.paddingLowVertical,
                  child: LoginInputFormField(
                    title: IdentificationConstants.SURNAME,
                    controller: _surname,
                    onSaved: (value) {
                      _surname.text = value!;
                    },
                    validator: FormBuilderValidators.required(
                        errorText: ApplicationConstants.VALIDATE_FORM_ERROR),
                  ),
                ),
                Padding(
                  padding: context.paddingLowVertical,
                  child: LoginInputFormField(
                    title: IdentificationConstants.BIRTH_YEAR,
                    controller: _birthYear,
                    onSaved: (value) {
                      _birthYear.text = value!;
                    },
                    validator: FormBuilderValidators.required(
                        errorText: ApplicationConstants.VALIDATE_FORM_ERROR),
                  ),
                ),
                BlocConsumer<IdentificationCubit, IdentificationState>(
                  builder: (context, state) {
                    if (state is IdentificationLoading) {
                      return CustomCircularButton(
                        primaryColor: context.theme.colorScheme.primary,
                        minimumSize: Size(context.width * 0.9, 45),
                      );
                    } else {
                      return Padding(
                        padding: context.paddingLowVertical,
                        child: CustomElevationButton(
                            primaryColor: context.theme.colorScheme.secondary,
                            minimumSize: Size(context.width * 0.9, 45),
                            onPressed: () async {
                              if (_authenticationFormKey.currentState != null &&
                                  _authenticationFormKey.currentState!
                                      .validate()) {
                                _authenticationFormKey.currentState!.save();
                                RegisterRequestModel? userModel =
                                    await getUser();
                                await context
                                    .read<IdentificationCubit>()
                                    .verify(
                                        model: RegisterRequestModel(
                                      id: userModel!.id,
                                      email: userModel.email,
                                      password: userModel.password,
                                      fullName: userModel.fullName,
                                      gainTotalNumber:
                                          userModel.gainTotalNumber,
                                      identityBirthDay: _birthYear.text,
                                      identityFirstName: _name.text,
                                      identityLastName: _surname.text,
                                      identityNumber: _number.text,
                                      isIdentity: userModel.isIdentity,
                                      phone: userModel.phone,
                                      phoneAuth: userModel.phoneAuth,
                                      profileImage: userModel.profileImage,
                                      senderTotalNumber:
                                          userModel.senderTotalNumber,
                                      transportTotalNumber:
                                          userModel.transportTotalNumber,
                                    ));
                                RegisterRequestModel? userModel1 =
                                    await getUser();
                              }
                            },
                            title: Text(
                              ButtonConstants.VERIFY,
                              style: whiteBold15,
                            )),
                      );
                    }
                  },
                  listener: (context, state) {
                    if (state is IdentificationError) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(state.message)));
                    }
                    if (state is IdentificationCompleted) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.greenAccent,
                          content: Text(
                            state.message,
                            style: const TextStyle(color: Colors.white),
                          )));
                    }
                  },
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
