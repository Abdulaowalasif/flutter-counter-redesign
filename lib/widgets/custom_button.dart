import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  final Color buttonColor;
  final Color textColor;
  final IconData iconData;

  const CustomButton({
    super.key,
    required this.title,
    required this.onPress,
    required this.buttonColor,
    required this.textColor,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: onPress,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Center(child: Icon(iconData, color: Colors.black)),
            ),
          ),
          Text(title, style: TextStyle(color: textColor)),
        ],
      ),
    );
  }
}
