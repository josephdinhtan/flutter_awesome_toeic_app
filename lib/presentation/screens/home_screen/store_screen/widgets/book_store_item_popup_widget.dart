import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                child: Image.network(
                  bookNetworkObject.full_cover_url,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8.0),
              const SizedBox(height: 8.0),
              bookNetworkObject.price != ""
                  ? Text(
                      bookNetworkObject.price,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: Colors.grey),
                    )
                  : Container(
                      decoration: BoxDecoration(
                          color: isBought ? Colors.grey : Colors.green,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5.0))),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: isBought
                            ? const Text(
                                'You already get it',
                                style: TextStyle(
                                    fontSize: 16.0, color: Colors.white),
                              )
                            : const Text(
                                'Free',
                                style: TextStyle(
                                    fontSize: 16.0, color: Colors.white),
                              ),
                      ),
                    ),
              const SizedBox(height: 8.0),
              Text(bookNetworkObject.author,
                  style: const TextStyle(
                      color: Color(0xff2a9d8f), fontWeight: FontWeight.bold)),
              const SizedBox(height: 8.0),
              Text(
                bookNetworkObject.des,
                style: const TextStyle(color: Colors.blueGrey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
