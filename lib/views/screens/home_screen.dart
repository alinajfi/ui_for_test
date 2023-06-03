import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upwork_test/routes/route_names.dart';
import 'package:upwork_test/utils/extensions.dart';
import 'package:upwork_test/views/widgets/custom_textfield.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import '../../utils/text_styles.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.white,
          color: Colors.orange.shade900,
          height: 60.h,
          items: [
            const Icon(Icons.add, size: 30),
            GestureDetector(
                onTap: () =>
                    Navigator.of(context).pushNamed(RouteNames.locationScreen),
                child: const Icon(Icons.list, size: 30)),
            const Icon(Icons.compare_arrows, size: 30),
            const Icon(Icons.call_split, size: 30),
            const Icon(Icons.perm_identity, size: 30),
          ]),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            SizedBox(
                height: size.height,
                width: size.width,
                child: Image.asset(
                  r'assets/images/gogle maps.png',
                  fit: BoxFit.fill,
                )),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(10),
                height: size.height / 3,
                width: size.width,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: _content(size),
              ),
            ),
            const Positioned(
                left: 0,
                right: 0,
                top: 100,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: CustomTextField(leading: Icon(Icons.location_on)),
                )),
          ],
        ),
      ),
    );
  }

  Widget _content(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        10.h.spaceV,
        Flexible(
            child: Text(
          'Quick Sevice',
          style: TextStyles.inter(FontWeight.bold, 14.sp),
        )),
        9.h.spaceV,
        Flexible(
            child: Text(
          'Welcome\nPlease let us know what assisitanc you need',
          style: TextStyles.inter(FontWeight.normal, 14.sp),
        )),
        24.h.spaceV,
        Container(
          padding: const EdgeInsets.all(8),
          width: size.width,
          height: 140,
          child: _listView(),
        ),
      ],
    );
  }

  Widget _listView() {
    return ListView.separated(
      itemCount: 10,
      separatorBuilder: (context, index) => const SizedBox(
        width: 10,
      ),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r)),
          clipBehavior: Clip.hardEdge,
          elevation: 10,
          child: Container(
            height: 40,
            width: 190,
            decoration: const BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: Colors.black,
                offset: Offset(0, 200),
                blurRadius: 4,
              )
            ]),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                    flex: 3,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      width: 70,
                      height: 70,
                      child: Image.asset(
                        r'assets/images/truck.png',
                      ),
                    )),
                Flexible(
                  flex: 1,
                  child: Text(
                    'Tow Truck',
                    style: TextStyles.inter(FontWeight.bold, 12.sp),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: FittedBox(
                      child: Text(
                    'Request a tow truck service',
                    style: TextStyles.inter(FontWeight.normal, 10.sp),
                  )),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
