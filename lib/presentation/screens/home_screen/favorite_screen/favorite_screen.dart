import 'package:flutter/material.dart';

import 'widgets/favorite_item_widget.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Favorite'.toUpperCase())),
      body: Center(
        child: Column(
          children: [
            FavoriteItemWidget(),
            FavoriteItemWidget(),
          ],
        ),
      ),
    );
  }
}
