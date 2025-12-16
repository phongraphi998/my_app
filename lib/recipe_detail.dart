import 'package:flutter/material.dart';
import 'package:my_app/model/recipe.dart';

class RecipeDetail extends StatelessWidget {
  final Recipe recipe;

  const RecipeDetail({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recipe Detail')),
      body: Column(
        children: [
          Image.asset(
            recipe.imgUrl,
            // height: 180,
            // width: double.infinity,
            // fit: BoxFit.cover,
            // errorBuilder: (context, error, stackTrace) {
            //   return const Text('Image not found');
            // },
          ),
          Text(recipe.imgTitle),
        ],
      ),
    );
  }
}
