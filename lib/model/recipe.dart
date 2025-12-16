import 'package:my_app/model/ingredient.dart';

class Recipe {
  final String imgUrl;
  final String imgTitle;
  final List<Ingredient> ingredients;

  Recipe(this.imgUrl, this.imgTitle, this.ingredients);

  static List<Recipe> samples = [
    Recipe(
      'assets/images/200304_Olive_PadThai-ebe0f22-scaled.webp',
      'Pad Thai Food',
      [
        Ingredient(name: 'Aubergins', quantity:'2', unit: ''),
      ],
    ),
    Recipe(
      'assets/images/OLI-0519-Healthy_GreenThaiFishCurry_32208-c3cee9a.webp',
      'Green Curry',
      [],
    ),
    Recipe(
      'assets/images/p110-20250121rps2352pumpkincurrypreview-8534543.webp',
      'Pa-nang',
      [],
    ),
  ];
}
