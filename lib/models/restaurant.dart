class Restaurant {
  final int id;
  final String name;
  final String address;
  final String email;
  final String city;
  final int hours;
  final String photos;
  final int reviewCount;
  final int contact;
  final String website;

  Restaurant(
    this.id,
    this.name,
    this.address,
    this.email,
    this.city,
    this.hours,
    this.photos,
    this.reviewCount,
    this.contact,
    this.website,
  );
}

class Review {
  final String id;
  final String userId;
  final String restaurantId;
  final int stars;
  final String text;
  final DateTime date;

  Review(
    this.id,
    this.userId,
    this.restaurantId,
    this.stars,
    this.text,
    this.date,
  );
}

class User {
  final String id;
  final String name;
  final Gender gender;
  final String email;
  final String password;

  User(
    this.id,
    this.name,
    this.gender,
    this.email,
    this.password,
  );
}

enum Gender { male, female }
