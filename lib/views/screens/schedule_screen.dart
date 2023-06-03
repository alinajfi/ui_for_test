import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upwork_test/utils/extensions.dart';

import '../../routes/route_names.dart';
import '../../utils/text_styles.dart';
import '../widgets/app_button.dart';
import '../widgets/custom_backbtn.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildScheduleScreenBody(context),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      systemOverlayStyle:
          const SystemUiOverlayStyle(statusBarColor: Colors.white),
      centerTitle: true,
      title: const Text(
        'Schedule',
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

  Widget _buildScheduleScreenBody(BuildContext context) {
    return SizedBox(
      height: ScreenUtil().screenHeight,
      width: ScreenUtil().screenWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          20.h.spaceV,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text('enter your location' * 5,
                style: TextStyles.inter(FontWeight.w400, 14.sp,
                    color: Colors.grey[400])),
          ),
          30.h.spaceV,
          _datesSelection(),
          20.h.spaceV,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              'Time',
              style: TextStyles.inter(FontWeight.w500, 15.sp),
            ),
          ),
          10.h.spaceV,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: _timeSlots(),
          ),
          100.h.spaceV,
          _button(context),
        ],
      ),
    );
  }

  Widget _button(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: AppButton(
          onTap: () =>
              Navigator.of(context).pushNamed(RouteNames.nearyouScreen),
          radius: 13.r,
          color: Colors.orange.shade900,
          height: 35.h,
          width: 250.w,
          child: const Text(
            'Proceed',
            style: TextStyle(color: Colors.white),
          )),
    );
  }

  Widget _datesSelection() {
    return SizedBox(
        height: 100.h,
        width: ScreenUtil().screenWidth,
        child: CalendarTimeline(
          initialDate: DateTime(2020, 4, 20),
          firstDate: DateTime(2019, 1, 15),
          lastDate: DateTime(2020, 11, 20),
          onDateSelected: (date) => print(date),
          leftMargin: 20,
          monthColor: Colors.blueGrey,
          dayColor: Colors.teal[200],
          activeDayColor: Colors.white,
          activeBackgroundDayColor: Colors.grey[900]!.withOpacity(0.4),
          dotsColor: const Color(0xFF333A47),
          selectableDayPredicate: (date) => date.day != 23,
          locale: 'en_ISO',
        ));
  }

  Widget _timeSlots() {
    return SizedBox(
      height: 250.h,
      width: 170.w,
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => Container(
            alignment: Alignment.center,
            height: 30.h,
            width: 160.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Colors.grey[900]!.withOpacity(0.4)),
            margin: const EdgeInsets.all(8),
            child: const Text('4:00 pm - 5:00 pm')),
      ),
    );
  }
}
