import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackBtn extends StatelessWidget {
  const BackBtn({
    Key? key,
    this.onTap,
  }) : super(key: key);
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: const [
        BoxShadow(offset: Offset(0, 3), color: Colors.grey, blurRadius: 2)
      ], color: Colors.pink[50], borderRadius: BorderRadius.circular(8.r)),
      height: 40.h,
      width: 40.h,
      child: GestureDetector(
        onTap: onTap,
        child: const Icon(
          Icons.arrow_back,
          color: Colors.blueAccent,
        ),
      ),
    );
  }
}
