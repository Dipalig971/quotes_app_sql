import 'package:get/get.dart';

import '../helper/sql_helper.dart';
import '../modal/api_modal.dart';

class FavoritesController extends GetxController {
  RxMap<String, List<Quote>> categorizedFavorites = <String, List<Quote>>{}.obs;

  @override
  void onInit() {
    super.onInit();
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    final List<Map<String, dynamic>> favorites = await DatabaseService.instance.getFavorites();
    final quotes = favorites.map((data) => Quote.fromMap(data)).toList();

    final Map<String, List<Quote>> categoryMap = {};
    for (var quote in quotes) {
      if (categoryMap.containsKey(quote.category)) {
        categoryMap[quote.category]!.add(quote);
      } else {
        categoryMap[quote.category!] = [quote];
      }
    }

    categorizedFavorites.value = categoryMap;
  }

  void addFavorite(String quote, String author, String category, String image) {
    final newQuote = Quote(quote: quote, author: author, category: category, image: image, isLiked: true);
    DatabaseService.instance.addFavorite(quote, author, true, category, image);
    if (categorizedFavorites.value.containsKey(category)) {
      categorizedFavorites.value[category]!.add(newQuote);
    } else {
      categorizedFavorites.value[category] = [newQuote];
    }
    categorizedFavorites.refresh();
  }

  void removeFavorite(String quote) {
    final removedQuote = categorizedFavorites.value.values.expand((list) => list).firstWhere((item) => item.quote == quote);
    DatabaseService.instance.deleteFavorite(quote);
    categorizedFavorites.value[removedQuote.category]?.removeWhere((item) => item.quote == quote);
    categorizedFavorites.refresh();
  }

  bool isFavorite(String quote) {
    return categorizedFavorites.value.values.expand((list) => list).any((item) => item.quote == quote);
  }
}
