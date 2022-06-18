import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../data/business_models/book_model.dart';
import '../../../../router/app_router.dart';
import '../../../../router/screen_arguments.dart';

import '../../../../../core_ui/constants/app_dimensions.dart';
import '../../../../../core_utils/core_utils.dart';

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
            //id: widget.bookInfoModel.boxId!,
          ),
        );
        // Navigator.push(
        //     context,
        //     CupertinoPageRoute(
        //       builder: (context) =>
        //           TestScreen(bookId: toeicBook.id, bookTitle: toeicBook.title),
        //     ));
      },
      child: Center(
        child: SizedBox(
          height: 150,
          width: width > AppDimensions.maxWidthForMobileMode
              ? AppDimensions.maxWidthForMobileMode
              : null,
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Card(
                child: Container(
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // SizedBox(width: kPaddingDefault),
                        // ClipRRect(
                        //   borderRadius: BorderRadius.all(
                        //       Radius.circular(kCardRadiusDefault / 2)),
                        //   child: Image.asset(
                        //     'assets/images/ets_book_cover.png',
                        //     fit: BoxFit.cover,
                        //     width: 80.0,
                        //     height: 100.0,
                        //   ),
                        // ),
                        Padding(
                          padding: const EdgeInsets.only(left: 130.0),
                          child: Container(
                            height: 100.0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('${bookInfoModel.title}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3),
                                    Text('${bookInfoModel.des}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5),
                                    Text('5% 887 B',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4),
                                  ],
                                ),
                                Container(
                                  decoration: const BoxDecoration(
                                      color: Colors.black45,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0))),
                                  child: const Padding(
                                    padding: EdgeInsets.all(4.0),
                                    child: Text(
                                      'Toeic practice book',
                                      style: TextStyle(
                                          fontSize: 10.0, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 16.0,
                left: 16.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                      Radius.circular(AppDimensions.kCardRadiusDefault)),
                  child: Image.file(
                    File(_bookCoverPath),
                    fit: BoxFit.cover,
                    width: 100.0,
                    height: 120.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
