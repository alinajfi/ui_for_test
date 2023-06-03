// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.leading,
  }) : super(key: key);
  final Widget leading;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.05,
      width: MediaQuery.of(context).size.width - 20,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0, 3.3),
              blurStyle: BlurStyle.normal,
              blurRadius: 3,
            )
          ]),
      child: TextFormField(
        decoration:
            InputDecoration(border: InputBorder.none, prefixIcon: leading),
      ),
    );
  }
}
