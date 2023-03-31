import 'package:carryvibeapp/core/extension/context_extension.dart';
import 'package:carryvibeapp/core/style.dart';
import 'package:carryvibeapp/features/Identification/identification_manager.dart';
import 'package:carryvibeapp/features/posts/constants/add_post_constants.dart';
import 'package:carryvibeapp/features/Identification/constants/identification_constants.dart';
import 'package:carryvibeapp/features/Identification/cubit/identification_cubit.dart';
import 'package:carryvibeapp/features/Identification/cubit/identification_state.dart';
import 'package:carryvibeapp/features/posts/model/authentication_request_model.dart';
import 'package:carryvibeapp/features/register/model/register_request_model.dart';
import 'package:carryvibeapp/product/widgets/button/constants.dart';
import 'package:carryvibeapp/product/widgets/button/custom_circular_button.dart';
import 'package:carryvibeapp/product/widgets/button/custom_elevated_button.dart';
import 'package:carryvibeapp/product/widgets/custom_page.dart';
import 'package:carryvibeapp/product/widgets/functions/get_user_function.dart';
import 'package:carryvibeapp/product/widgets/input/login_form_input.dart';
import 'package:flutter/material.dart';
import 'package:carryvibeapp/core/constants/application_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../identification_manager.dart';
import '../model/identification_request_model.dart';

class IdentificationPage extends StatefulWidget {
  const IdentificationPage({Key? key}) : super(key: key);
  @override
  State<IdentificationPage> createState() => _IdentificationPageState();
}

class _IdentificationPageState extends State<IdentificationPage> {
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
                                RegisterRequestModel? userModel = await getUser();
                                await context
                                    .read<IdentificationCubit>()
                                    .verify(model: RegisterRequestModel(
                                        id: userModel!.id,
                                        email: userModel.email,
                                        password: userModel.password,
                                        fullName: userModel.fullName,
                                        gainTotalNumber: userModel.gainTotalNumber,
                                        identityBirthDay: _birthYear.text,
                                        identityFirstName: _name.text,
                                        identityLastName: _surname.text,
                                        identityNumber: _number.text,
                                        isIdentity: userModel.isIdentity,
                                        phone: userModel.phone,
                                        phoneAuth: userModel.phoneAuth,
                                        profileImage: userModel.profileImage,
                                        senderTotalNumber: userModel.senderTotalNumber,
                                        transportTotalNumber: userModel.transportTotalNumber,
                                        ));
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
                    Navigator.pop(context);
                    Navigator.of(context).pop();
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
