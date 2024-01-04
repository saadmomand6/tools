import 'package:bet_for_big/constant/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class searchTextFeild extends StatelessWidget {
  const searchTextFeild({
    super.key,
    required FocusNode searchFocusNode,
    required this.searchController,
    this.onTap,
    this.height, this.FontSize,
  }) : _searchFocusNode = searchFocusNode;
  final Function()? onTap;
  final FocusNode _searchFocusNode;
  final TextEditingController searchController;
  final double? height;
  final double? FontSize;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeHelper>(builder: (themecontroller) {
      return Container(
        height: height ?? 45.sp,
        decoration: BoxDecoration(
          color: themecontroller.cardcolor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10.0,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(children: [
          SizedBox(
            width: 10.sp,
          ),
          Expanded(
            flex: 3,
            child: TextFormField(
              focusNode: _searchFocusNode,
              controller: searchController,
              style: TextStyle(
                
                color: themecontroller.textcolor,
                fontSize: FontSize??12.sp,
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 2,
                      color: themecontroller.cardcolor.withOpacity(0.4)),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 2,
                      color: themecontroller.cardcolor.withOpacity(0.4)),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 2,
                      color: themecontroller.cardcolor.withOpacity(0.4)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 2,
                      color: themecontroller.cardcolor.withOpacity(0.4)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 2,
                      color: themecontroller.cardcolor.withOpacity(0.4)),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 2,
                      color: themecontroller.cardcolor.withOpacity(0.4)),
                ),
                counterStyle: TextStyle(
                  color: themecontroller.textcolor,
                ),
                hintText: 'Saerch By Name',
                hintStyle: TextStyle(
                  fontSize: FontSize??12.sp,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                height: 45.sp,
                child: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                decoration: BoxDecoration(
                  color: themecontroller.cardcolor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10.0,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
              ),
            ),
          )
        ]),
      );
    });
  }
}
