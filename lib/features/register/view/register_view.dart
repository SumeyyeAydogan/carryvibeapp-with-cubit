import 'package:carryvibeapp/core/constants/application_constants.dart';
import 'package:carryvibeapp/core/constants/image_manager.dart';
import 'package:carryvibeapp/core/extension/context_extension.dart';
import 'package:carryvibeapp/features/register/constants/register_constants.dart';
import 'package:carryvibeapp/features/register/cubit/register_cubit.dart';
import 'package:carryvibeapp/features/register/model/register_request_model.dart';
import 'package:carryvibeapp/product/widgets/button/custom_circular_button.dart';
import 'package:carryvibeapp/product/widgets/button/custom_elevated_button.dart';
import 'package:carryvibeapp/product/widgets/input/custom_form_input.dart';
import 'package:carryvibeapp/product/widgets/input/login_form_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _emailText = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _passwordText = TextEditingController();
  final TextEditingController _passwordTextRepeat = TextEditingController();
  final _registerFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterCubit>(
      create: (context) => RegisterCubit(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: context.paddingMediumHorizontal,
          child: Column(
            children: [
              Expanded(
                flex: 0,
                child: Text(
                  RegisterConstants.TITLE,
                  style: context.textTheme.headline5,
                ),
              ),
              Expanded(
                flex: 7,
                child: Form(
                  key: _registerFormKey,
                  child: ListView(
                    children: [
                      Padding(
                        padding: context.paddingLowVertical,
                        child: LoginInputFormField(
                          title: RegisterConstants.FULL_NAME,
                          controller: _fullName,
                          onSaved: (value) {
                            _fullName.text = value!;
                          },
                          validator: FormBuilderValidators.required(
                              errorText: ApplicationConstants.VALIDATE_FORM_ERROR),
                        ),
                      ),
                      Padding(
                        padding: context.paddingLowVertical,
                        child: LoginInputFormField(
                          controller: _emailText,
                          onSaved: (value) {
                            _emailText.text = value!;
                          },
                          validator: FormBuilderValidators.required(
                              errorText: ApplicationConstants.VALIDATE_FORM_ERROR),
                        ),
                      ),
                      Padding(
                        padding: context.paddingLowVertical,
                        child: LoginInputFormField(
                          title: RegisterConstants.PHONE_NUMBER,
                          controller: _phoneNumber,
                          onSaved: (value) {
                            _phoneNumber.text = value!;
                          },
                          validator: FormBuilderValidators.required(
                              errorText: ApplicationConstants.VALIDATE_FORM_ERROR),
                        ),
                      ),
                      Padding(
                        padding: context.paddingLowVertical,
                        child: LoginPasswordCustomField(
                          controller: _passwordText,
                          title: RegisterConstants.PASSWORD,
                          onSaved: (value) {
                            _passwordText.text = value!;
                          },
                          validator: FormBuilderValidators.required(
                              errorText: ApplicationConstants.VALIDATE_FORM_ERROR),
                        ),
                      ),
                      Padding(
                        padding: context.paddingLowVertical,
                        child: LoginPasswordCustomField(
                          controller: _passwordTextRepeat,
                          title: RegisterConstants.PASSWORD_REPEAT,
                          onSaved: (value) {
                            _passwordText.text = value!;
                          },
                          validator: FormBuilderValidators.required(
                              errorText: ApplicationConstants.VALIDATE_FORM_ERROR),
                        ),
                      ),
                      BlocConsumer<RegisterCubit, RegisterState>(
                        listener: (context, state) {
                          if (state is RegisterError) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(content: Text(state.message)));
                          }
                          if (state is RegisterCompleted) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                backgroundColor: Colors.greenAccent,
                                content: Text(
                                  state.message,
                                  style: const TextStyle(color: Colors.white),
                                )));
                          }
                        },
                        builder: (context, state) {
                          if (state is RegisterLoading) {
                            return CustomCircularButton(
                              primaryColor: context.theme.colorScheme.primary,
                              minimumSize: Size(context.width, 45),
                            );
                          } else {
                            return CustomElevationButton(
                                primaryColor: context.theme.colorScheme.primary,
                                minimumSize: Size(context.width, 45),
                                onPressed: () async {
                                  if (_registerFormKey.currentState != null &&
                                      _registerFormKey.currentState!.validate()) {
                                    _registerFormKey.currentState!.save();
                                    await context.read<RegisterCubit>().createUserWithEmailAndPassword(
                                        RegisterRequestModel(
                                            id: "",
                                            email: _emailText.text,
                                            password: _passwordText.text,
                                            fullName: _fullName.text,
                                            gainTotalNumber: 0,
                                            identityBirthDay: "",
                                            identityFirstName: "",
                                            identityLastName: "",
                                            identityNumber: "",
                                            isIdentity: "false",
                                            phone: _phoneNumber.text,
                                            phoneAuth: false,
                                            profileImage: "",
                                            senderTotalNumber: 0,
                                            transportTotalNumber: 0));
                                  }
                                },
                                title: Text(RegisterConstants.REGISTER));
                          }
                        },
                      ),
                      Padding(
                        padding: context.paddingMediumVertical,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            RegisterConstants.REGISTER_OR,
                            style: TextStyle(color: Colors.grey[800]),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(ImageManager.instance.googleIcon),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(ImageManager.instance.facebookIcon),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(ImageManager.instance.appleIcon),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
