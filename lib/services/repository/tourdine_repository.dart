import 'package:tourdine/services/auth/save_local.dart';

import '../../models/restaurant.dart';
import '../../models/review.dart';

abstract class TourdineServices {
  Future<List<Restaurant>> getRestaurantList();

  Future<void> addRestaurantToFavorite(
      {required User user, required String restaurantId});

  Future<void> addReview(
      {required String restaurantId,
      required String userId,
      required Review review});
}
