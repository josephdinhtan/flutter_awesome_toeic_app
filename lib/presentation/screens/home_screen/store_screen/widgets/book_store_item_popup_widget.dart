// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../../../../core_ui/extensions/extensions.dart';
import '../../../../../data/data_providers/dtos/book_dto.dart';

class BookStoreItemPopupWidget extends StatelessWidget {
  BookStoreItemPopupWidget(
      {Key? key,
      required this.bookNetworkObject,
      this.isBought = false,
      required this.title})
      : super(key: key);
  final BookDto bookNetworkObject;
  bool isBought;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(8.r)),
                child: Image.network(
                  bookNetworkObject.fullCoverUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              bookNetworkObject.price != ""
                  ? Text(
                      bookNetworkObject.price,
                      style: context.labelLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                          color: Colors.grey),
                    )
                  : Container(
                      decoration: BoxDecoration(
                          color: isBought ? Colors.grey : Colors.green,
                          borderRadius: BorderRadius.all(Radius.circular(5.r))),
                      child: Padding(
                        padding: EdgeInsets.all(4.r),
                        child: isBought
                            ? Text(
                                'You already get it',
                                style: TextStyle(
                                    fontSize: 16.sp, color: Colors.white),
                              )
                            : Text(
                                'Free',
                                style: TextStyle(
                                    fontSize: 16.sp, color: Colors.white),
                              ),
                      ),
                    ),
              SizedBox(height: 8.h),
              Text(
                bookNetworkObject.author,
                style:
                    context.labelLarge!.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.h),
              Text(
                bookNetworkObject.des,
                style: context.labelMedium!.copyWith(color: Colors.blueGrey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
