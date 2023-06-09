import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_fusion/screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  final String pag='/category-meals';

  CategoryItem( this.id,this.title, this.color,);

  void selectCategory(BuildContext ctx)
  {
    Navigator.of(ctx).pushNamed(
        pag,
      arguments: {
        'id':id,
        'title':title,
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>selectCategory(context),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(title,style: Theme.of(context).textTheme.titleMedium,),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
