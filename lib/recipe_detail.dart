import 'package:flutter/material.dart';
import 'package:my_app/model/recipe.dart';

class RecipeDetail extends StatefulWidget {
  final Recipe recipe;

  const RecipeDetail({super.key, required this.recipe});

  @override
  State<RecipeDetail> createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  int _sliderVal = 1; // จำนวนเสิร์ฟ

  @override
  Widget build(BuildContext context) {
    final recipe = widget.recipe;

    return Scaffold(
      appBar: AppBar(title: const Text('Recipe Detail')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // รูปอาหาร
          Image.asset(
            recipe.imgUrl,
            height: 180,
            width: double.infinity,
            fit: BoxFit.cover,
          ),

          const SizedBox(height: 12),

          // ชื่อเมนู
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              recipe.imgTitle,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 8),

          // แสดงจำนวนเสิร์ฟ
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Servings: $_sliderVal',
              style: const TextStyle(fontSize: 16),
            ),
          ),

          // ✅ Serving Slider
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Slider(
              min: 1,
              max: 10,
              divisions: 9,
              label: '$_sliderVal servings',
              value: _sliderVal.toDouble(),
              onChanged: (newValue) {
                setState(() {
                  _sliderVal = newValue.round();
                });
              },
            ),
          ),

          const SizedBox(height: 8),

          // หัวข้อ Ingredients
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Ingredients',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),

          const SizedBox(height: 6),

          // ListView อยู่ใน Column ต้องห่อ Expanded
          Expanded(
            child: ListView.builder(
              itemCount: recipe.ingredients.length,
              itemBuilder: (BuildContext context, int index) {
                final ingredient = recipe.ingredients[index];

                // quantity ของคุณเป็น String -> แปลงเป็น int
                final baseQty = int.tryParse(ingredient.quantity) ?? 1;
                final adjustedQty = baseQty * _sliderVal;

                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 6,
                  ),
                  child: Text(
                    '$adjustedQty ${ingredient.unit} ${ingredient.name}',
                    style: const TextStyle(fontSize: 16.0),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
