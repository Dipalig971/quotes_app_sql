import 'package:get/get.dart';

import '../helper/sql_helper.dart';
import '../modal/api_modal.dart';

class FavoritesController extends GetxController {
  RxList<Quote> favoritesList = <Quote>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    final List<Map<String, dynamic>> favorites = await DatabaseService.instance.getFavorites();
    favoritesList.value = favorites.map((data) => Quote.fromMap(data)).toList();
  }

  void addFavorite(String quote, String author, String category, String image) {
    final newQuote = Quote(quote: quote, author: author, category: category, image: image, isLiked: true);
    DatabaseService.instance.addFavorite(quote, author, true, category, image);
    favoritesList.add(newQuote);
    favoritesList.refresh();
  }

  void removeFavorite(String quote) {
    DatabaseService.instance.deleteFavorite(quote);
    favoritesList.removeWhere((item) => item.quote == quote);
    favoritesList.refresh();
  }

  bool isFavorite(String quote) {
    return favoritesList.any((item) => item.quote == quote);
  }
}
