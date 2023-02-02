import 'package:tourdine/constants/dummy_data.dart';
import 'package:tourdine/services/auth/save_local.dart';
import 'package:tourdine/services/repository/tourdine_repository.dart';

import '../../models/restaurant.dart';
import '../../models/review.dart';

class DummyService extends TourdineServices {
  final List<Restaurant> _restaurants = restaurantList;

  List<Restaurant> get restaurants => _restaurants;

  @override
  Future<List<Restaurant>> getRestaurantList() {
    return Future.delayed(
      const Duration(seconds: 1),
      () => restaurantList,
    );
  }

  @override
  Future<void> addReview(
      {required String restaurantId,
      required String userId,
      required Review review}) async {
    Future.delayed(
      const Duration(seconds: 100),
      () => {
        _restaurants
            .where((element) => element.id == restaurantId)
            .first
            .reviews
            .add(review)
      },
    );
  }

  @override
  Future<void> addRestaurantToFavorite(
      {required User user, required String restaurantId}) async {
    if (!user.favorite.contains(restaurantId)) {
      user.favorite.add(restaurantId);
    }
  }
}
