import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core_ui/constants/app_dimensions.dart';
import '../../../../../core_ui/constants/transparent_image.dart';
import '../../../../../data/data_providers/dtos/book_dto.dart';
import '../../../../../view_model/book_screen_cubit/book_list_cubit.dart';
import '../../../../../view_model/store_screen_cubit/store_screen_popup_cubit.dart';
import 'book_store_item_popup_widget.dart';

class BookStoreItemWidget extends StatelessWidget {
  final BookDto bookDto;
  BookStoreItemWidget({Key? key, required this.bookDto}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        showCupertinoModalPopup(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext buildContext) {
            return SizedBox(
              width: width > AppDimensions.maxWidthForMobileMode
                  ? 0.7 * AppDimensions.maxWidthForMobileMode
                  : 0.85 * width,
              child: BlocProvider<StoreScreenPopupCubit>(
                create: (context) =>
                    StoreScreenPopupCubit()..displayBookItemPopup(),
                child: Builder(builder: (contextBuilder) {
                  return CupertinoActionSheet(
                    title: Text(
                      bookDto.title,
                    ),
                    message: BlocProvider.value(
                      value: BlocProvider.of<BookListCubit>(context),
                      child: BookStoreItemPopupWidget(
                        title: bookDto.title,
                        bookNetworkObject: bookDto,
                        isBought: bookDto.isBought,
                      ),
                    ),
                    actions: [
                      BlocBuilder<StoreScreenPopupCubit, StoreScreenPopupState>(
                        builder: (context3, state) {
                          if (state is StoreScreenPopupItemDisplay) {
                            return CupertinoDialogAction(
                              onPressed: () {
                                BlocProvider.of<StoreScreenPopupCubit>(
                                        contextBuilder)
                                    .buyABookItem(bookDto);
                              },
                              child: Text('Get'),
                            );
                          } else if (state is StoreScreenPopupItemBuying) {
                            return CupertinoDialogAction(
                              onPressed: () {},
                              child: Text('Buying ...'),
                            );
                          } else if (state is StoreScreenPopupItemBuyFail) {
                            return CupertinoDialogAction(
                              onPressed: () {},
                              child: Text('Buy Fail'),
                            );
                          } else if (state is StoreScreenPopupItemBought) {
                            return CupertinoDialogAction(
                              onPressed: () {
                                BlocProvider.of<BookListCubit>(context)
                                    .getBookList();
                                Navigator.pop(contextBuilder);
                              },
                              child: Text('OK'),
                            );
                          }
                          return CupertinoDialogAction(
                            onPressed: () {},
                            child: Text('Should not return this'),
                          );
                        },
                      ),
                    ],
                    cancelButton: CupertinoDialogAction(
                      /// This parameter indicates the action would perform
                      /// a destructive action such as delete or exit and turns
                      /// the action's text color to red.
                      isDestructiveAction: true,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel'),
                    ),
                  );
                }),
              ),
            );
          },
        );
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
                  image: bookDto.full_cover_url,
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
                    bookDto.title,
                  ),
                  const SizedBox(height: AppDimensions.kPaddingDefault),
                  bookDto.price != ""
                      ? Text(
                          bookDto.price,
                        )
                      : Container(
                          decoration: const BoxDecoration(
                              color: Colors.green,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0))),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: bookDto.isBought
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
