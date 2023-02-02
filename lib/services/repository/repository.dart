import 'package:tourdine/models/restaurant.dart';
import 'package:tourdine/services/auth/save_local.dart';
import 'package:tourdine/services/repository/tourdine_repository.dart';

import '../../models/review.dart';
import 'dummy_repsitory.dart';

class ServiceRepository extends TourdineServices {
  final TourdineServices _services;
  late List<Restaurant> _restaurants;

  ServiceRepository({TourdineServices? services})
      : _services = services ?? DummyService();

  factory ServiceRepository.fromDummy() =>
      ServiceRepository(services: DummyService());

  @override
  Future<List<Restaurant>> getRestaurantList() {
    return _services.getRestaurantList();
  }

  @override
  Future<void> addRestaurantToFavorite(
      {required User user, required String restaurantId}) {
    return _services.addRestaurantToFavorite(
        user: user, restaurantId: restaurantId);
  }

  @override
  Future<void> addReview(
      {required String restaurantId,
      required String userId,
      required Review review}) {
    return _services.addReview(
        restaurantId: restaurantId, userId: userId, review: review);
  }
}
