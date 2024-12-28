import 'package:flutter/material.dart';

class SocialLoginButton extends StatelessWidget {
  final String text;
  final String? iconPath;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onPressed;
  final bool isOutlined;

  const SocialLoginButton({
    super.key,
    required this.text,
    this.iconPath,
    required this.backgroundColor,
    required this.textColor,
    required this.onPressed,
    this.isOutlined = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: isOutlined ? Colors.transparent : backgroundColor,
          side: BorderSide(
            color: isOutlined ? backgroundColor : Colors.transparent,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (iconPath != null) ...[
              Image.asset(
                iconPath!,
                height: 24,
                width: 24,
              ),
              const SizedBox(width: 12),
            ],
            Text(
              text,
              style: TextStyle(
                color: isOutlined ? backgroundColor : textColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
