
import 'package:material_ui/material_ui.dart';

import '../models/coffee.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_button.dart';

class ProductDetailsPage extends StatelessWidget {
  final Coffee coffee;

  const ProductDetailsPage({
    super.key,
    required this.coffee,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coffee Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: Image.network(
                coffee.imageUrl,
                width: double.infinity,
                height: 280,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 280,
                    color: AppTheme.cream,
                    child: const Center(
                      child: Icon(
                        Icons.coffee,
                        size: 90,
                        color: AppTheme.coffee,
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 25),

            Text(
              coffee.name,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppTheme.espresso,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              coffee.category,
              style: const TextStyle(
                fontSize: 16,
                color: AppTheme.coffee,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              coffee.description,
              style: const TextStyle(
                fontSize: 16,
                height: 1.6,
              ),
            ),

            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Price',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  '\$${coffee.price.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.coffee,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),

            CustomButton(
              text: 'Add to Cart',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Added to cart!'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
