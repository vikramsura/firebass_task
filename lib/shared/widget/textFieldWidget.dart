import 'package:flutter/material.dart';
import 'package:task_firebase/shared/constant/colors.dart';
import 'package:task_firebase/shared/constant/font_size.dart';

class TextFieldFieldWidget extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final bool isSuffixIcon;
  final IconData icon;
  final VoidCallback? onPressed;

  const TextFieldFieldWidget({
    Key? key,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
    this.isSuffixIcon = false,
    this.icon = Icons.check, // Provide a default icon if not specified
    this.onPressed,
  }) : super(key: key);

  @override
  State<TextFieldFieldWidget> createState() => _TextFieldFieldWidgetState();
}

class _TextFieldFieldWidgetState extends State<TextFieldFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
          // contentPadding: EdgeInsets.all(AppFontSize.font10),
          suffixIcon: Align(
            alignment: Alignment.center,
            widthFactor: 1,
            heightFactor: 1,
            child: widget.isSuffixIcon
                ? InkWell(
                    onTap: widget.onPressed,
                    child: Icon(widget.icon, size: AppFontSize.font22),
                  )
                : const SizedBox(),
          ),
          hintText: widget.hintText,
          hintStyle: TextStyle(
            // color: const Color(0xff000000).withOpacity(0.5),
            fontSize: MediaQuery.of(context).size.height * 0.019,
          ),enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.fieldBorderColor(context),),
          borderRadius: BorderRadius.circular(AppFontSize.font14)
      ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.fieldBorderColor(context),),
              borderRadius: BorderRadius.circular(AppFontSize.font14)),
      ),
    );
  }
}
