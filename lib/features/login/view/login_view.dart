import 'package:auto_route/auto_route.dart';
import 'package:carryvibeapp/core/constants/application_constants.dart';
import 'package:carryvibeapp/core/constants/image_manager.dart';
import 'package:carryvibeapp/core/extension/context_extension.dart';
import 'package:carryvibeapp/features/login/constants/login_constants.dart';
import 'package:carryvibeapp/features/login/cubit/login_cubit.dart';
import 'package:carryvibeapp/features/login/model/login_model.dart';
import 'package:carryvibeapp/product/router/app_router.dart';
import 'package:carryvibeapp/product/widgets/button/custom_circular_button.dart';
import 'package:carryvibeapp/product/widgets/button/custom_elevated_button.dart';
import 'package:carryvibeapp/product/widgets/input/custom_form_input.dart';
import 'package:carryvibeapp/product/widgets/input/login_form_input.dart';
import 'package:carryvibeapp/product/widgets/input/login_password_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailText = TextEditingController();
  final TextEditingController _passwordText = TextEditingController();
  final _loginFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailText.dispose();
    _passwordText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(),
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
                flex: 1,
                child: Text(
                  LoginConstants.LOGIN_TITLE,
                  style: context.textTheme.headline5,
                ),
              ),
              Expanded(
                flex: 3,
                child: Form(
                  key: _loginFormKey,
                  child: ListView(
                    children: [
                      Padding(
                        padding: context.paddingMediumVertical,
                        child: LoginInputFormField(
                          controller: _emailText,
                          onSaved: (value) {
                            _emailText.text = value!;
                          },
                          validator: FormBuilderValidators.required(
                              errorText:
                                  ApplicationConstants.VALIDATE_FORM_ERROR),
                        ),
                      ),
                      LoginPasswordCustomField(
                        controller: _passwordText,
                        onSaved: (value) {
                          _passwordText.text = value!;
                        },
                        validator: FormBuilderValidators.required(
                            errorText:
                                ApplicationConstants.VALIDATE_FORM_ERROR),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: (() {
                            context.pushRoute(const ForgotPasswordRoute());
                          }),
                          child: Text(
                            LoginConstants.FORGOT_PASSWORD,
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        ),
                      ),
                      BlocConsumer<LoginCubit, LoginState>(
                        listener: (context, state) {
                          if (state is LoginError) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(state.message)));
                          }
                        },
                        builder: (context, state) {
                          if (state is LoginLoading) {
                            return CustomCircularButton(
                              primaryColor: context.theme.colorScheme.secondary,
                              minimumSize: Size(context.width, 45),
                            );
                          } else {
                            return CustomElevationButton(
                                primaryColor:
                                    context.theme.colorScheme.secondary,
                                minimumSize: Size(context.width, 45),
                                onPressed: () async {
                                  if (_loginFormKey.currentState != null &&
                                      _loginFormKey.currentState!.validate()) {
                                    _loginFormKey.currentState!.save();
                                    await context
                                        .read<LoginCubit>()
                                        .signInWithEmailAndPassword(
                                            model: LoginResponseModel(
                                                email: _emailText.text,
                                                password: _passwordText.text));
                                    _passwordText.clear();
                                  }

                                  // final response = await IdentityManager.instance.getCheck(
                                  //     tcKimlik: tcKimlik,
                                  //     name: name,
                                  //     lastName: lastName,
                                  //     dogumYili: dogumYili);
                                },
                                title: Text(LoginConstants.LOGIN));
                          }
                        },
                      ),
                      Padding(
                        padding: context.paddingHighVertical,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            LoginConstants.SIGNIN_OR,
                            style: TextStyle(color: Colors.grey[800]),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () {
                              googleSignIn();
                            },
                            icon: SvgPicture.asset(
                                ImageManager.instance.googleIcon),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                                ImageManager.instance.facebookIcon),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                                ImageManager.instance.appleIcon),
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

void googleSignIn() {
  GoogleSignIn();
}
