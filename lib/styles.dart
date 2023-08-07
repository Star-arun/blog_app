import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const fontNormal = "Montserrat";
const fontNormalBold = "Montserrat";

class ABC {
  
}

abstract class Styles {
  static final medium = TextStyle(
    fontSize: 13.sp,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    fontFamily: fontNormal,

  );
   static final normal = TextStyle(
    fontSize: 12.sp,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w300,
    fontFamily: fontNormal,
    color: Colors.grey

  );

   static final medium15Bld = TextStyle(
    fontSize: 15.sp,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w700,
    
    color: Colors.black,
      fontFamily: fontNormalBold,

  );
   static final recommended = TextStyle(
    fontSize: 14.sp,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
  
    color: Colors.black,
      fontFamily: fontNormalBold,

  );
}