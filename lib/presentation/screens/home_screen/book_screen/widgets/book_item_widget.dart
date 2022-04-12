import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toeic_quiz2/core/constants/app_dimensions.dart';
import 'package:flutter_toeic_quiz2/data/models/book_infor.dart';
import 'package:flutter_toeic_quiz2/presentation/router/app_router.dart';
import 'package:flutter_toeic_quiz2/presentation/router/screen_arguments.dart';
import 'package:flutter_toeic_quiz2/presentation/screens/test_screen/test_screen.dart';

class BookItem extends StatelessWidget {
  BookItem({
    Key? key,
    required this.toeicBook,
  }) : super(key: key);

  BookInfor toeicBook;
  final planetCard = new Container(
    height: 124.0,
    margin: new EdgeInsets.only(left: 46.0),
    decoration: new BoxDecoration(
      color: new Color(0xFF333366),
      shape: BoxShape.rectangle,
      borderRadius: new BorderRadius.circular(8.0),
      boxShadow: <BoxShadow>[
        new BoxShadow(
          color: Colors.black12,
          blurRadius: 10.0,
          offset: new Offset(0.0, 10.0),
        ),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    //print("BookItem widget rebuild $height, $width");
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRouter.test,
          arguments: ScreenArguments(
            title: toeicBook.title,
            id: toeicBook.id,
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
        child: Container(
          height: 150,
          width: width > 600 ? 600 : null,
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(AppDimensions.kCardRadiusDefault),
                ),
                elevation: AppDimensions.kCardElevationDefaut,
                child: Container(
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
                    child: Stack(
                      children: [
                        Row(
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('${toeicBook.title}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline3),
                                        Text('${toeicBook.des}',
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
                                      decoration: BoxDecoration(
                                          color: Colors.black45,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5.0))),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(
                                          'Toeic practice book',
                                          style: TextStyle(
                                              fontSize: 10.0,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
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
                  child: Image.asset(
                    'assets/images/ets_book_cover.png',
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
