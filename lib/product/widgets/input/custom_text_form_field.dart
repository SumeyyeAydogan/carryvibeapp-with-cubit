import 'package:flutter/material.dart';
class CustomTextFormField extends StatefulWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String labelText;
  final TextInputType textInputType;
  bool isObsecure;
   CustomTextFormField({
    Key? key,
    required this.textEditingController,
    this.isPass = false,
    required this.labelText,
    required this.textInputType,
    this.isObsecure=false
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderSide: Divider.createBorderSide(context),
      borderRadius: BorderRadius.circular(10),
    );

    return TextFormField(
      controller: widget.textEditingController,
      decoration: InputDecoration(
       
        contentPadding:
                  EdgeInsets.symmetric(horizontal: 10),
        label: Text(widget.labelText),
        labelStyle: TextStyle(fontFamily: 'Urbanist'),
        border: inputBorder,
        enabledBorder: inputBorder,
        fillColor: const Color(0xffB4B4B4).withOpacity(0.2),
        suffixIcon: widget.labelText == "Password"
              ? widget.isObsecure!=false
                  ? IconButton(
                      onPressed: changeObsecure,
                      icon: const Icon(Icons.visibility_off_rounded,color: Colors.grey,),
                    )
                  : IconButton(
                      onPressed: changeObsecure,
                      icon: const Icon(Icons.visibility,color: Colors.grey,),
                    )
              : const SizedBox(),
        
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color:Colors.black,
            
          ),
          borderRadius: BorderRadius.circular(10),
          
        ),
        
      ),
      style: TextStyle(
        color: Colors.black,
      ),
      keyboardType: widget.textInputType,
      obscureText: widget.isObsecure,
    );
  }
    void changeObsecure() {
    setState(() {
      widget.isObsecure = !widget.isObsecure;
      
    });
  }
}

/* class Input extends StatelessWidget {
  String text;
  Input({required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      height: deviceHeight * 0.09,
      width: deviceWidth * 0.90,
      decoration: BoxDecoration(
        color: Color(0xffB4B4B4).withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      // ignore: prefer_const_constructors
      child: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Center(
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: text,
            ),
          ),
        ),
      ),
    );
  }
} */