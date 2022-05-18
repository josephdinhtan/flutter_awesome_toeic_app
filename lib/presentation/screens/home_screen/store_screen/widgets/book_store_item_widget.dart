import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toeic_quiz2/presentation/screens/widgets/neumorphism_button.dart';

import '../../../../../data/models/book_info_model.dart';
import 'book_store_item_popup_widget.dart';

class BookStoreItemWidget extends StatefulWidget {
  BookStoreItemWidget({Key? key, required this.bookInfoModel})
      : super(key: key);

  BookInfoModel bookInfoModel;
  bool bought = false;

  @override
  State<BookStoreItemWidget> createState() => _BookStoreItemWidgetState();
}

class _BookStoreItemWidgetState extends State<BookStoreItemWidget> {
  String bookCoverLink = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateImageCover();
  }

  void updateImageCover() async {
    // print('fullUrl: bookCoverPathUrl ${widget.toeicBook.coverUrl}');
    // final fullUrl = await FirebaseApi.getDownloadUrl(widget.toeicBook.coverUrl);
    // print('tandq FirebaseApi get fullUrl done!');
    //
    // // check this item already in DB or not
    // final toeicBook = BookHiveApi.instance.getByID(widget.toeicBook.id);
    // widget.bought = toeicBook == null ? false : true;
    //
    // print('tandq bookInfoDb check exist done');
    // setState(() {
    //   bookCoverLink = fullUrl;
    // });
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      bookCoverLink = widget.bookInfoModel.coverUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //     context,
        //     CupertinoPageRoute(
        //       builder: (context) => BookDetailScreen(
        //         toeicBook: widget.toeicBook,
        //         bookCoverLink: bookCoverLink,
        //         bought: widget.bought,
        //       ),
        //     ));
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext buildContext) {
              return AlertDialog(
                scrollable: true,
                actions: [
                  NeumorphismButton(
                      onPressed: () {
                        Navigator.pop(buildContext);
                      },
                      child: const Text('CANCEL')),
                  NeumorphismButton(onPressed: () {}, child: const Text('GET'),),
                ],
                title: Center(child: Text(widget.bookInfoModel.title)),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 6.0, vertical: 16.0),
                content: BookStoreItemPopupWidget(
                  bookInfoModel: widget.bookInfoModel,
                ),
              );
            });
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                child: bookCoverLink == ''
                    ? const Center(
                        child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(
                          color: Colors.blue,
                        ),
                      ))
                    : Image.network(
                        bookCoverLink,
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
                  SizedBox(height: 8.0),
                  Text(
                    widget.bookInfoModel.title,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  const SizedBox(height: 8.0),
                  widget.bookInfoModel.price != 0
                      ? Text(
                          "${widget.bookInfoModel.price}K",
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
                              style: TextStyle(
                                  fontSize: 16.0, color: Colors.white),
                            ),
                          ),
                        ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
