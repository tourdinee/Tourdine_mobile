import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tourdine/models/restaurant.dart';
import 'package:tourdine/services/cloud/constants.dart';

import 'cloud_exception.dart';

class CloudStore {
  final users = FirebaseFirestore.instance.collection("users");
  final restaurants = FirebaseFirestore.instance.collection("restaurant");

  final List<Restaurant> _restaurants = [];

  Future<void> addUser({
    required email,
    required name,
    required id,
    picture = "",
  }) async {
    try {
      users.add({
        userEmail: email,
        displayName: name,
        userId: id,
        userPicture: picture ?? ""
      });
    } catch (e) {
      print("addUser cloudStore error: $e");
      throw CouldNotAddUserException();
    }
  }

  Future<void> deleteUser({required id}) async {
    try {
      await users.doc(id).delete();
    } catch (e) {
      print("deleteUserError: $e");
    }
  }

  // Future<Restaurant?> getRestaurantList() async {
  //   try {
  //     final restaurantMap =await restaurants.get();
  //     _restaurants = restaurantMap.docs.map((restaurant) => Restaurant.)
  //   } catch (e) {}
  // }

  // List<Restaurant?> filterRestaurant() {}
}
