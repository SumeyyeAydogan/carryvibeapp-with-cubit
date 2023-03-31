import 'package:flutter/material.dart';

class CustomCircularButton extends StatefulWidget {
  final bool isCircle;
  final Color? primaryColor;
  final Size? minimumSize;
  const CustomCircularButton({Key? key, this.isCircle = false, this.primaryColor, this.minimumSize})
      : super(key: key);

  @override
  State<CustomCircularButton> createState() => _CustomCircularButtonState();
}

class _CustomCircularButtonState extends State<CustomCircularButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: null,
      style: ElevatedButton.styleFrom(
          minimumSize: widget.minimumSize,
          primary: widget.primaryColor,
          shape: widget.isCircle ? const CircleBorder() : null),
      child: const Center(child: CircularProgressIndicator()),
    );
  }
}
