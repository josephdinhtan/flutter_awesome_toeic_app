import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core_ui/constants/app_dimensions.dart';
import '../../../../../core_ui/constants/transparent_image.dart';
import '../../../../../data/data_providers/dtos/book_dto.dart';
import '../../../../../view_model/book_screen_cubit/book_list_cubit.dart';
import '../../../../../view_model/store_screen_cubit/store_screen_popup_cubit.dart';
import 'book_store_item_popup_widget.dart';

class BookStoreItemWidget extends StatelessWidget {
  final BookDto bookNetworkObject;
  bool isBought;
  BookStoreItemWidget(
      {Key? key, required this.bookNetworkObject, this.isBought = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext buildContext) {
              return AlertDialog(
                scrollable: true,
                title: Center(child: Text(bookNetworkObject.title)),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 6.0, vertical: 16.0),
                content: BlocProvider.value(
                  value: StoreScreenPopupCubit()..displayBookItemPopup(),
                  child: BlocProvider.value(
                    value: BlocProvider.of<BookListCubit>(context),
                    child: BookStoreItemPopupWidget(
                      bookNetworkObject: bookNetworkObject,
                      isBought: bookNetworkObject.isBought,
                    ),
                  ),
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
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: bookNetworkObject.full_cover_url,
                ),

                // child: Image.network(
                //   widget.bookNetworkObject.full_cover_url,
                //   fit: BoxFit.cover,
                //   loadingBuilder: (BuildContext context, Widget child,
                //       ImageChunkEvent? loadingProgress) {
                //     if (loadingProgress == null) return child;
                //     return const Center(
                //         child: Padding(
                //       padding: EdgeInsets.all(8.0),
                //       child: SizedBox(
                //           height: 200,
                //           child: Center(child: Text('Loading...'))),
                //     ));
                //   },
                // ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: AppDimensions.kPaddingDefault),
                  Text(
                    bookNetworkObject.title,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  const SizedBox(height: AppDimensions.kPaddingDefault),
                  bookNetworkObject.price != ""
                      ? Text(
                          "${bookNetworkObject.price}K",
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
