import 'package:flutter/material.dart';
class ForgotPasswordPage extends StatefulWidget {
const ForgotPasswordPage({Key? key}) : super(key: key);
@override
State<ForgotPasswordPage> createState() => ForgotPasswordPageState();
}
class ForgotPasswordPageState extends State<ForgotPasswordPage> {
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(title: Text("forgot password"),),

);
}
}