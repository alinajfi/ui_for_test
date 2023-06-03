import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upwork_test/utils/extensions.dart';
import 'package:upwork_test/views/widgets/app_button.dart';

import '../../routes/route_names.dart';
import '../../utils/text_styles.dart';
import '../widgets/custom_backbtn.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(context),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: _buildLocationScreenBody(context)),
    );
  }

  Widget _buildLocationScreenBody(BuildContext context) {
    return SizedBox(
      height: ScreenUtil().screenHeight,
      width: ScreenUtil().screenWidth,
      child: Column(
        children: [
          20.h.spaceV,
          Text(
            'Enter your location enter your location enter your location',
            style: TextStyles.inter(FontWeight.w400, 14.sp,
                color: Colors.grey[400]),
          ),
          20.h.spaceV,
          _selectCarType(),
          30.h.spaceV,
          _currentLocation(),
          Flexible(child: _selectedAddress()),
          200.h.spaceV,
          _button(context),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      systemOverlayStyle:
          const SystemUiOverlayStyle(statusBarColor: Colors.white),
      centerTitle: true,
      title: const Text(
        'Location',
        style: TextStyle(color: Colors.black),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      leading: Padding(
          padding: const EdgeInsets.all(12),
          child: BackBtn(
            onTap: () => Navigator.of(context).pop(),
          )),
    );
  }

  Widget _selectCarType() {
    const List<String> list = <String>[
      'Select Car Type',
      'Two',
      'Three',
      'Four'
    ];
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(width: 1, color: Colors.grey)),
      height: 40.h,
      width: double.infinity,
      padding: const EdgeInsets.only(left: 10, right: 20),
      child: DropdownButton(
        isExpanded: true,
        underline: const SizedBox(),
        value: list.first,
        items: list
            .map<DropdownMenuItem<String>>((value) => DropdownMenuItem(
                  value: value,
                  child: Text(value),
                ))
            .toList(),
        onChanged: (value) {},
      ),
    );
  }

  Widget _currentLocation() {
    return ListTile(
      title: Text(
        'Current Location',
        style: TextStyles.inter(FontWeight.w400, 15.sp),
      ),
      trailing: const Icon(Icons.note_alt_sharp),
    );
  }

  Widget _selectedAddress() {
    return SizedBox(
      height: 40.h,
      width: ScreenUtil().screenWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Icon(Icons.radio_button_checked),
          Container(
            padding: const EdgeInsets.only(left: 10),
            alignment: Alignment.centerLeft,
            height: 40.h,
            width: 300.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(width: 0.5, color: Colors.grey)),
            child: const Text('13th Street. 47 W 13th St, New York'),
          ),
        ],
      ),
    );
  }

  Widget _button(BuildContext context) {
    return AppButton(
        onTap: () => Navigator.of(context).pushNamed(RouteNames.scheduleSceen),
        radius: 13.r,
        color: Colors.orange.shade900,
        height: 35.h,
        width: 250.w,
        child: const Text(
          'Proceed',
          style: TextStyle(color: Colors.white),
        ));
  }
}
