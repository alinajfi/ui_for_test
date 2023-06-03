import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upwork_test/utils/extensions.dart';
import 'package:upwork_test/views/widgets/custom_textfield.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../utils/text_styles.dart';
import '../widgets/custom_backbtn.dart';

class NearyouScreen extends StatelessWidget {
  const NearyouScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3),
        child: _buildNearyouScreenBody(),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white, statusBarBrightness: Brightness.dark),
      elevation: 0,
      backgroundColor: Colors.white,
      leading: Padding(
          padding: const EdgeInsets.all(12),
          child: BackBtn(
            onTap: () => Navigator.of(context).pop(),
          )),
    );
  }

  Widget _buildNearyouScreenBody() {
    return SizedBox(
      height: ScreenUtil().screenHeight,
      width: ScreenUtil().screenWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          20.h.spaceV,
          _searchBar(),
          20.h.spaceV,
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'Avaible Providers Near You',
              style: TextStyles.inter(FontWeight.w500, 15.sp),
            ),
          ),
          30.h.spaceV,
          _serviceProviders(),
        ],
      ),
    );
  }

  Widget _searchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Flexible(
              flex: 4,
              child: CustomTextField(
                leading: Icon(Icons.search),
              )),
          Flexible(
            flex: 1,
            child: Container(
              width: 50,
              padding: EdgeInsets.all(6.h),
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
              child: const Icon(Icons.filter_list),
            ),
          ),
        ],
      ),
    );
  }

  Widget _serviceProviders() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: ScreenUtil().screenHeight * 0.60,
        width: ScreenUtil().screenWidth,
        child: ListView.builder(
          itemCount: 40,
          itemBuilder: (context, index) => itemBuilder(context, index),
        ),
      ),
    );
  }

  Widget? itemBuilder(BuildContext context, int index) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[50], borderRadius: BorderRadius.circular(10.r)),
      height: 80.h,
      width: 100.w,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _serviceProviderRowItem(),
      ),
    );
  }

  Widget _serviceProviderRowItem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Flexible(child: Text('Ali')),
              Flexible(
                flex: 4,
                child: RatingBarIndicator(
                  unratedColor: Colors.yellow,
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                ),
              ),
            ],
          ),
        ),
        Flexible(
            child: Text('Vehicle Type : Mercedes Two Trucks',
                style: TextStyles.inter(
                  FontWeight.w500,
                  10.sp,
                ))),
        Flexible(
            child: Row(
          children: [
            Text('40 Minutes',
                style: TextStyles.inter(FontWeight.w500, 12.sp,
                    color: Colors.red)),
            3.w.spaceH,
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 6),
              child: VerticalDivider(
                width: 2,
                color: Colors.black,
              ),
            ),
            3.w.spaceH,
            Text('7,000 BHD',
                style: TextStyles.inter(
                  FontWeight.w500,
                  12.sp,
                )),
            const Spacer(),
            _bookNowButton(),
          ],
        )),
      ],
    );
  }

  Widget _bookNowButton() {
    return Container(
      alignment: Alignment.center,
      width: 80.w,
      height: 30.h,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.red, width: 1),
          borderRadius: BorderRadius.circular(10.r)),
      child: const Text(
        'Book Now',
        style: TextStyle(color: Colors.red),
      ),
    );
  }
}
