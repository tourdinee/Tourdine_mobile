// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'restaurant_category.dart';
import 'review.dart';

class Restaurant {
  final String id;
  final String name;
  final String address;
  final String email;
  final String city;
  final int openHour;
  final String photos;
  final int reviewCount;
  final int contact;
  final String website;
  final RestaurantCategory category;
  List<Review> reviews = [];

  Restaurant({
    required this.id,
    required this.name,
    required this.address,
    required this.email,
    required this.city,
    required this.openHour,
    required this.photos,
    required this.reviewCount,
    required this.contact,
    required this.website,
    required this.category,
    reviews,
  });

  factory Restaurant.fromFirebase(Map<String, dynamic> map) => Restaurant(
        id: map["id"],
        name: map["name"],
        address: map["address"],
        email: map["email"],
        city: map["city"],
        openHour: map["openHour"],
        photos: map["photos"],
        reviewCount: map["reviewCount"],
        contact: map["contact"],
        website: map["website"],
        category: (map["category"] as String).returnCategory(),
      );

  Restaurant copyWith({
    String? id,
    String? name,
    String? address,
    String? email,
    String? city,
    int? openHour,
    String? photos,
    int? reviewCount,
    int? contact,
    String? website,
    RestaurantCategory? category,
    List<Review>? reviews,
  }) {
    return Restaurant(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      email: email ?? this.email,
      city: city ?? this.city,
      openHour: openHour ?? this.openHour,
      photos: photos ?? this.photos,
      reviewCount: reviewCount ?? this.reviewCount,
      contact: contact ?? this.contact,
      website: website ?? this.website,
      category: category ?? this.category,
      reviews: reviews ?? this.reviews,
    );
  }
}

enum Gender { male, female, other }
