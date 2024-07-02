import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:gomoon/dropdown.dart';
import './backgroundimage.dart';

class HomePage extends StatelessWidget {
  late double _devheigt, _devwid;
  @override
  Widget build(BuildContext context) {
    _devheigt = MediaQuery.of(context).size.height;
    _devwid = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SafeArea(
            child: Container(
                height: _devheigt,
                width: _devwid,
                // color: Colors.red,
                padding: EdgeInsets.symmetric(horizontal: _devwid * 0.05),
                child: Stack(
                  children: [
                    ImageBack(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _Title(),
                        Booking(_devheigt, _devwid),
                      ],
                    ),
                  ],
                ))));
  }
}

Widget _Title() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0.0, 60.0, 0.0, 0.0),
    child: Center(
      child: (Container(
        child: Text(
          "Hello_MoooN",
          style: TextStyle(
            color: Colors.white,
            fontSize: 50,
            fontWeight: FontWeight.w500,
          ),
        ),
      )),
    ),
  );
}

Widget _Dropdown({required double devWidth}) {
  return CustomDropdown(
      values: const ["NaSSa", "JWTS", "Rockeet"], width: devWidth);

  // String selectedValue =
  //  items.first; // Initialize selected value with the first item
}

Widget _DropdownR({required double devWidth}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    mainAxisSize: MainAxisSize.max,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      CustomDropdown(
        values: const ["1", "2", "3", '4'],
        width: devWidth * 0.45,
      ),
      CustomDropdown(
        values: const ['Bussines', "economy", "privet"],
        width: devWidth * 0.40,
      ),
    ],
  );
}

Widget RideButt(_devwdit) {
  return Container(
    width: _devwdit,
    color: Colors.white,
    child: MaterialButton(
      onPressed: () {},
      child: Text(
        "BOOOK NOW",
        style: TextStyle(color: Colors.red),
      ),
    ),
  );
}

Widget Booking(double devheight, double devwidth) {
  return Container(
    height: devheight * 0.25,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _Dropdown(devWidth: devwidth),
        _DropdownR(devWidth: devwidth),
        RideButt(devheight),
      ],
    ),
  );
}
