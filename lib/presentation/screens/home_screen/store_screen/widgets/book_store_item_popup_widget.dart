import 'package:flutter/material.dart';

import '../../../../../core/constants/app_light_colors.dart';
import '../../../../../data/models/book_info_model.dart';
import '../../../widgets/neumorphism_button.dart';

class BookStoreItemPopupWidget extends StatefulWidget {
  BookStoreItemPopupWidget(
      {Key? key, required this.bookInfoModel, this.isBought = false})
      : super(key: key);
  BookInfoModel bookInfoModel;
  bool isBought;
  bool isBuying = false;

  @override
  State<BookStoreItemPopupWidget> createState() =>
      _BookStoreItemPopupWidgetState();
}

class _BookStoreItemPopupWidgetState extends State<BookStoreItemPopupWidget> {
  void boughtThisItem() async {
    // handle something here, payment or give for free
    setState(
      () {
        widget.isBuying = true;
      },
    );
    await Future.delayed(const Duration(milliseconds: 1000));
    setState(
      () {
        widget.isBought = true;
        widget.isBuying = false;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
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
                    widget.bookInfoModel.coverUrl,
                    fit: BoxFit.cover,
                    // loadingBuilder: (context, child, loadingProgress) {
                    //   if (loadingProgress == null) return child;
                    //   return child;
                    // },
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8.0),
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
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: widget.isBought
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
                Text(widget.bookInfoModel.author,
                    style: const TextStyle(
                        color: Color(0xff2a9d8f), fontWeight: FontWeight.bold)),
                const SizedBox(height: 8.0),
                Text(widget.bookInfoModel.des),
                const SizedBox(height: 16.0),
                widget.isBuying
                    ? const Center(
                        child: Text('Buying...'),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          NeumorphismButton(
                              boderRadius: 8.0,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                widget.isBought ? 'OK' : 'CANCEL',
                                style: const TextStyle(
                                    color: AppLightColors.kButtonPrimary),
                              )),
                          if (!widget.isBought)
                            NeumorphismButton(
                              boderRadius: 8.0,
                              onPressed: () {
                                boughtThisItem();
                              },
                              child: const Text('GET',
                                  style: TextStyle(
                                      color: AppLightColors.kButtonPrimary)),
                            ),
                        ],
                      )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
