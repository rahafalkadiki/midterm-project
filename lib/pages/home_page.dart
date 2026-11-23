
import 'package:material_ui/material_ui.dart';
import 'package:easy_localization/easy_localization.dart';

import '../models/coffee.dart';
import '../theme/app_theme.dart';
import '../widgets/coffee_card.dart';
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
              itemCount: coffees.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                childAspectRatio: 0.68,
              ),
              itemBuilder: (context, index) {
                final coffee = coffees[index];

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
