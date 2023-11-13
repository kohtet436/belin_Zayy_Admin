import 'package:flutter/material.dart';
import 'package:belin_zayy_admin/consts/constants.dart';

class ButtonsWidget extends StatelessWidget {
  const ButtonsWidget({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.icon,
    required this.backgroundColor,
  }) : super(key: key);
  // You can use Function instead of VoidCallback
  final VoidCallback onPressed;
  final String text;
  final IconData icon;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: const EdgeInsets.symmetric(
            horizontal: defaultPadding * 1.5, vertical: defaultPadding / 2
            //  (Responsive.isDesktop(context) ? 1 :
            // 2),
            ),
      ),
      onPressed: () {
        onPressed();
      },
      icon: Icon(
        icon,
        size: 20,
      ),
      label: Text(text),
    );
  }
}
