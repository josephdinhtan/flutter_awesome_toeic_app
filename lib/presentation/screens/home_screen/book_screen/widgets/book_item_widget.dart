import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../../core_ui/constants/app_dimensions.dart';
import '../../../../../core_ui/extensions/extensions.dart';
import '../../../../../core_utils/core_utils.dart';
import '../../../../../data/business_models/book_model.dart';
import '../../../../router/app_router.dart';
import '../../../../router/screen_arguments.dart';

// ignore: must_be_immutable
class BookItemWidget extends StatelessWidget {
  BookItemWidget({
    Key? key,
    required this.bookInfoModel,
  }) : super(key: key);

  BookModel bookInfoModel;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final colors = context.theme.colorScheme;
    final _bookCoverPath =
        getApplicationDirectory() + '/' + bookInfoModel.coverPath;
    //print("BookItem widget rebuild $height, $width");
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRouter.test,
          arguments: ScreenArguments(
            title: bookInfoModel.title,
            id: bookInfoModel.id,
            childIds: bookInfoModel.testIds,
            otherInfo: bookInfoModel,
          ),
        );
      },
      child: SizedBox(
        //height: 130.sp,
        width: width > AppDimensions.maxWidthForMobileMode
            ? AppDimensions.maxWidthForMobileMode
            : null,
        child: Card(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 8.w),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.sp),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(8.r)),
                  child: Image.file(
                    File(_bookCoverPath),
                    fit: BoxFit.cover,
                    width: 80.sp,
                    height: 100.sp,
                  ),
                ),
              ),
              SizedBox(
                width: 8.w,
              ),
              Flexible(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      bookInfoModel.title,
                      style: context.titleLarge!.copyWith(
                          color: colors.primary, fontWeight: FontWeight.w600),
                      // style: AppTextStyles.kOnSurfaceTextPrimary.copyWith(
                      //     color: Theme.of(context).colorScheme.onSurface),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      bookInfoModel.des,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: context.titleMedium!.copyWith(
                          color: colors.secondary, fontWeight: FontWeight.w600),
                      maxLines: 20,
                    ),
                    SizedBox(height: 4.h),
                    // Text(
                    //   '5% 887 M',
                    //   style: context.titleSmall!
                    //       .copyWith(color: colors.onBackground),
                    //   // style: AppTextStyles.kOnSurfaceTextSecondary.copyWith(
                    //   //     color: Theme.of(context).colorScheme.onSurfaceVariant),
                    // ),
                    // SizedBox(height: 4.h),
                    Text(
                      'Toeic practice book',
                      style:
                          context.titleSmall!.copyWith(color: colors.tertiary),
                      // style: TextStyle(
                      //   fontSize: 10.sp,
                      //   color: context.colors.tertiary,
                      // ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
