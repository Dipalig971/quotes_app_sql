import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/sql_controller.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final FavoritesController favoritesController = Get.put(FavoritesController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: Obx(() {
        if (favoritesController.favoritesList.isEmpty) {
          return const Center(child: Text('No favorites added yet.'));
        } else {
          return ListView.builder(
            itemCount: favoritesController.favoritesList.length,
            itemBuilder: (context, index) {
              final quote = favoritesController.favoritesList[index];
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
            },
          );
        }
      }),
    );
  }
}
