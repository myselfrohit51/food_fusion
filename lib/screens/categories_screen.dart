import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_fusion/dummy_data.dart';
import 'package:food_fusion/widgets/categoryItem.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(25),
        children: DUMMY_CATEGORIES.map((catData) =>
            CategoryItem(
              catData.id,
              catData.title,
              catData.color,

                ),
        ).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),

    );
  }
}
