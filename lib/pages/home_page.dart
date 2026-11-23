
import 'package:material_ui/material_ui.dart';
import 'package:easy_localization/easy_localization.dart';

import '../models/coffee.dart';
import '../theme/app_theme.dart';
import '../widgets/coffee_card.dart';
import '../widgets/category_item.dart';
import '../widgets/section_title.dart';
import 'product_details_page.dart';
import 'settings_page.dart';

class HomePage extends StatefulWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;

  const HomePage({
    super.key,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCategory = 'All';

  final List<String> categories = [
    'All',
    'Hot Coffee',
    'Cold Coffee',
   
  ];

  final List<Coffee> coffees = const [
    Coffee(
      name: 'Cappuccino',
      category: 'Hot Coffee',
      description:
          'A classic Italian coffee with rich espresso, steamed milk and a smooth layer of foam.',
      imageUrl:
          'https://images.unsplash.com/photo-1572442388796-11668a67e53d?w=600',
      price: 4.50,
    ),
    Coffee(
      name: 'Iced Latte',
      category: 'Cold Coffee',
      description:
          'A refreshing combination of espresso, cold milk and ice.',
      imageUrl:
          'https://images.unsplash.com/photo-1461023058943-07fcbe16d735?w=600',
      price: 5.00,
    ),
    Coffee(
      name: 'Americano',
      category: 'Hot Coffee',
      description:
          'A smooth and bold espresso diluted with hot water.',
      imageUrl:
          'https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?w=600',
      price: 3.50,
    ),
    Coffee(
      name: 'Caramel Latte',
      category: 'Cold Coffee',
      description:
          'A creamy latte with espresso, milk and sweet caramel flavor.',
      imageUrl:
          'https://images.unsplash.com/photo-1485808191679-5f86510681a2?w=600',
      price: 5.50,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final filteredCoffees = selectedCategory == 'All'
        ? coffees
        : coffees.where((coffee) {
            return coffee.category == selectedCategory;
          }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Brew & Bean ☕',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingsPage(
                    isDarkMode: widget.isDarkMode,
                    onThemeChanged: widget.onThemeChanged,
                  ),
                ),
              );
            },
          ),
          const SizedBox(width: 8),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Good coffee, good mood!',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: AppTheme.espresso,
              ),
            ),

            const SizedBox(height: 6),

            const Text(
              'Find your perfect cup today.',
              style: TextStyle(
                color: AppTheme.coffee,
                fontSize: 15,
              ),
            ),

            const SizedBox(height: 22),

            TextField(
              decoration: InputDecoration(
                hintText: 'search_coffee'.tr(),
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 28),

            SectionTitle(title: 'categories'.tr()),

            const SizedBox(height: 14),

            SizedBox(
              height: 48,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(width: 10),
                itemBuilder: (context, index) {
                  final category = categories[index];

                  return CategoryItem(
                    title: category == 'All'
                        ? 'all'.tr()
                        : category == 'Hot Coffee'
                            ? 'hot_coffee'.tr()
                            : category == 'Cold Coffee'
                                ? 'iced_coffee'.tr()
                                : category,
                    icon: category == 'All'
                        ? Icons.grid_view_rounded
                        : category == 'Hot Coffee'
                            ? Icons.coffee
                            : category == 'Cold Coffee'
                                ? Icons.local_drink
                                : Icons.cake,
                    isSelected: selectedCategory == category,
                    onTap: () {
                      setState(() {
                        selectedCategory = category;
                      });
                    },
                  );
                },
              ),
            ),

            const SizedBox(height: 28),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppTheme.espresso,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'A perfect coffee break',
                    style: TextStyle(
                      color: AppTheme.cream,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Freshly brewed, just for you.',
                    style: TextStyle(
                      color: AppTheme.caramel,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            SectionTitle(title: 'popular_coffee'.tr()),

            const SizedBox(height: 15),

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: filteredCoffees.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                childAspectRatio: 0.68,
              ),
              itemBuilder: (context, index) {
                final coffee = filteredCoffees[index];

                return CoffeeCard(
                  coffee: coffee,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProductDetailsPage(coffee: coffee),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
