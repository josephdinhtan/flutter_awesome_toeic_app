import 'package:flutter/material.dart';

import '../../../../../data/models/book_info_model.dart';

class BookStoreItemPopupWidget extends StatelessWidget {
  BookStoreItemPopupWidget({Key? key, required this.bookInfoModel})
      : super(key: key);
  BookInfoModel bookInfoModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              child: Image.network(
                bookInfoModel.coverUrl,
                fit: BoxFit.cover,
                // loadingBuilder: (context, child, loadingProgress) {
                //   if (loadingProgress == null) return child;
                //   return child;
                // },
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8.0),
                const SizedBox(height: 8.0),
                bookInfoModel.price != 0
                    ? Text(
                        "${bookInfoModel.price}K",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0),
                      )
                    : Container(
                        decoration: const BoxDecoration(
                            color: Colors.green,
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0))),
                        child: const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Text(
                            'Free',
                            style:
                                TextStyle(fontSize: 16.0, color: Colors.white),
                          ),
                        ),
                      ),
                const SizedBox(height: 8.0),
                Text(bookInfoModel.author,
                    style: const TextStyle(
                        color: Color(0xff2a9d8f), fontWeight: FontWeight.bold)),
                const SizedBox(height: 8.0),
                Text(bookInfoModel.des),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
