import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToastMessage(
  BuildContext context,
  String message,
  String iconPath, {
  bool isError = true,
}) {
  FToast fToast = FToast();
  final theme = Theme.of(context);
  final isDarkMode = theme.brightness == Brightness.dark;

  fToast.init(context);

  final Color backgroundColor =
      isDarkMode
          ? (isError
              ? theme.colorScheme.error.withOpacity(0.2)
              : theme.colorScheme.primary.withOpacity(0.2))
          : (isError
              ? theme.colorScheme.error.withOpacity(0.1)
              : theme.colorScheme.primary.withOpacity(0.1));

  final Color textColor = theme.colorScheme.onSurface;

  final Color borderColor =
      isDarkMode
          ? (isError
              ? theme.colorScheme.error.withOpacity(0.5)
              : theme.colorScheme.primary.withOpacity(0.5))
          : (isError
              ? theme.colorScheme.error.withOpacity(0.3)
              : theme.colorScheme.primary.withOpacity(0.3));

  Widget toast = FadeInUp(
    from: 20,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.sp),
        gradient: LinearGradient(
          colors: [
            backgroundColor.withOpacity(0.9),
            backgroundColor.withOpacity(0.8),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
            offset: Offset(0, 4),
          ),
        ],
        border: Border.all(color: borderColor, width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(iconPath, width: 24.w, height: 24.h),
          SizedBox(width: 16.w),
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                color: textColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(width: 16.w),
          GestureDetector(
            onTap: () {
              fToast.removeCustomToast();
            },
            child: Icon(Icons.close, size: 20.w),
          ),
        ],
      ),
    ),
  );

  // Show the toast
  fToast.showToast(
    child: toast,
    gravity: ToastGravity.TOP,
    toastDuration: const Duration(seconds: 3),
  );
}
