import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../controller/sql_controller.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FavoritesController favoritesController = Get.put(
        FavoritesController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: Obx(() {
        if (favoritesController.categorizedFavorites.isEmpty) {
          return const Center(child: Text('No favorites added yet.'));
        } else {
          return ListView(
            children: favoritesController.categorizedFavorites.entries.map((
                entry) {
              final category = entry.key;
              final quotes = entry.value;

              return ExpansionTile(
                title: Text(category),
                children: quotes.map((quote) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      tileColor: const Color(0xffC4EDDB),
                      title: Text('${quote.quote}'),
                      subtitle: Text('${quote.author}'),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.green),
                        onPressed: () {
                          favoritesController.removeFavorite('${quote.quote}');
                        },
                      ),
                    ),
                  );
                }).toList(),
              );
            }).toList(),
          );
        }
      }),
    );
  }
}
