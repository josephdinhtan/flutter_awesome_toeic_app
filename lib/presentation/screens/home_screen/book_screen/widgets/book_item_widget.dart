import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core_ui/constants/app_dimensions.dart';
import '../../../../../core_ui/extensions/typography_utils.dart';
import '../../../../../core_utils/core_utils.dart';
import '../../../../../data/business_models/book_model.dart';
import '../../../../router/app_router.dart';
import '../../../../router/screen_arguments.dart';

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
      child: Center(
        child: SizedBox(
          height: 130,
          width: width > AppDimensions.maxWidthForMobileMode
              ? AppDimensions.maxWidthForMobileMode
              : null,
          child: Card(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 16.0),
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  child: Image.file(
                    File(_bookCoverPath),
                    fit: BoxFit.cover,
                    width: 80.0,
                    height: 100.0,
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                SizedBox(
                  height: 120.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        bookInfoModel.title,
                        style: context.titleMedium!.copyWith(
                            color: colors.primary, fontWeight: FontWeight.w600),
                        // style: AppTextStyles.kOnSurfaceTextPrimary.copyWith(
                        //     color: Theme.of(context).colorScheme.onSurface),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        bookInfoModel.des,
                        style: context.titleSmall!
                            .copyWith(color: colors.secondary),
                        // style: AppTextStyles.kOnSurfaceTextSecondary.copyWith(
                        //     color: Theme.of(context).colorScheme.onSurfaceVariant),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        '5% 887 M',
                        style: context.titleSmall!
                            .copyWith(color: colors.onBackground),
                        // style: AppTextStyles.kOnSurfaceTextSecondary.copyWith(
                        //     color: Theme.of(context).colorScheme.onSurfaceVariant),
                      ),
                      const SizedBox(height: 4.0),
                      Container(
                        decoration: const BoxDecoration(
                            color: Colors.black45,
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0))),
                        child: const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Text(
                            'Toeic practice book',
                            style:
                                TextStyle(fontSize: 10.0, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
