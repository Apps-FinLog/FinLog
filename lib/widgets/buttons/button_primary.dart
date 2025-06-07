import 'package:flutter/material.dart';
import 'package:finlog/styles/colors.dart'; 
import 'package:finlog/screens/utility_page/under_development.dart';
class ButtonPrimary extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  const ButtonPrimary({
    super.key,
    required this.text,
    this.onPressed,

  });
  @override
  State<ButtonPrimary> createState()=> _ButtonPrimaryState();
}

class _ButtonPrimaryState extends State<ButtonPrimary>{
  @override
  Widget build(BuildContext context){
    return (
      Center(
              child: ElevatedButton(
                onPressed: widget.onPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: finlogButtonDark,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: Text(widget.text, style: const TextStyle(color: Colors.white, fontSize: 14)),
              ),
            )
        );
  }
}
