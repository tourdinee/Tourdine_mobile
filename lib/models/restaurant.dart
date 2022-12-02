class Restaurant {
  final String id;
  final String name;
  final String address;
  final String email;
  final String city;
  final int hours;
  final String photos;
  final int reviewCount;
  final int contact;
  final String website;
  final String category;

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
    this.category,
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

List<Restaurant> restaurantList = [
  Restaurant(
      "1",
      "Browns Café & Restaurant",
      "Ikeja and Victoria Island neighbourhood of Lagos",
      "browncafe@gmail.com",
      "lagos",
      24,
      "http://www.travelstart.com.ng/blog/wp-content/uploads/2014/06/Browns-Cafe-and-Restaurant.jpg",
      263,
      08021626324,
      "browncafe.dine.ng",
      "fine dining"),
  Restaurant(
      "2",
      "Ocean Basket & Restaurant",
      "Victoria Island, Lagos",
      "Ocean Basket@gmail.com",
      "lagos",
      24,
      "http://www.travelstart.com.ng/blog/wp-content/uploads/2014/09/ocean-basket-Lagos.png",
      263,
      08021626324,
      "Ocean Basket.dine.ng",
      "budget friendly"),
  Restaurant(
      "3",
      "The Bungalow & Restaurant",
      "Victoria Island Lagos",
      "TheBungalow@gmail.com",
      "https://www.travelstart.com.ng/blog/wp-content/uploads/2014/09/Bungalow-restaurant.jpg",
      24,
      "photos",
      263,
      08021626324,
      "TheBungalow.dine.ng",
      "fast food"),
  Restaurant(
      "4",
      "Terra Kulture Food Lounge & Restaurant",
      " Plot 1376, Tiamiyu Savage, Off Ahmadu Bello Way, Victoria Island, Lagos",
      "TerraKultureFoodLounge@gmail.com",
      "lagos",
      24,
      "http://www.travelstart.com.ng/blog/wp-content/uploads/2014/08/Terra-Kulture.jpg",
      263,
      08021626324,
      "TerraKultureFoodLounge.dine.ng",
      "budget friendly"),
  Restaurant(
      "5",
      "Metisse Restaurant",
      "Etim Inyang Crescent, AIM Plaza,Victoria Island, Lagos",
      "Metisse@gmail.com",
      "lagos",
      24,
      "http://www.travelstart.com.ng/blog/wp-content/uploads/2014/09/Metisse.jpg",
      263,
      08021626324,
      "Metisse.dine.ng",
      "fine dining"),
  Restaurant(
      "6",
      "BluCabana Restaurant & Cafe",
      "Mabushi, Abuja",
      "BluCabanaRestaurant&Cafe@gmail.com",
      "lagos",
      24,
      "https://www.travelstart.com.ng/blog/wp-content/uploads/2014/09/blucabana-restaurant-Abuja.jpg",
      263,
      08021626324,
      "BluCabanaRestaurant&Cafe.dine.ng",
      "fast food"),
  Restaurant(
      "7",
      "Nkoyo Restaurant",
      "Bathurst Street, K-city Plaza, Off Aminu Kano Crescent, Wuse II, Abuja",
      "NkoyoRestaurant@gmail.com",
      "lagos",
      24,
      "http://www.travelstart.com.ng/blog/wp-content/uploads/2014/09/Nkoyo-Restaurant.jpg",
      263,
      08021626324,
      "NkoyoRestaurant.dine.ng",
      "budget friendly"),
  Restaurant(
      "8",
      "Jevinik Restaurant",
      "Located in Lagos, Abuja, Port Harcourt, Aba and Owerri",
      "JevinikRestaurant@gmail.com",
      "lagos",
      24,
      "https://www.travelstart.com.ng/blog/wp-content/uploads/2014/04/Jevinik-Restaurant-Abuja-1024x768.jpg",
      263,
      08021626324,
      "JevinikRestaurant.dine.ng",
      "fast food"),
  Restaurant(
      "9",
      "Fulani Pool Bar and Restaurant",
      "Transcorp Hilton Hotel, Abuja",
      "FulaniPoolBarandRestaurant@gmail.com",
      "lagos",
      24,
      "http://www.travelstart.com.ng/blog/wp-content/uploads/2014/04/Fulani-Pool-Bar-and-Restaurant.jpg",
      263,
      08021626324,
      "FulaniPoolBarandRestaurant.dine.ng",
      "fine dining"),
  Restaurant(
      "10",
      "Elephant Bar & Restaurant",
      "Sheraton Hotel, Abuja",
      "ElephantBar@gmail.com",
      "lagos",
      24,
      "http://www.travelstart.com.ng/blog/wp-content/uploads/2014/09/ElephantBar_inside1.jpg",
      263,
      08021626324,
      "ElephantBar.dine.ng",
      "budget friendly"),
  Restaurant(
      "11",
      "Kilimanjaro Restaurant",
      "Lagos, Owerri, Enugu, Uyo, Port Harcourt Abuja",
      "KilimanjaroRestaurant@gmail.com",
      "lagos",
      24,
      "https://www.travelstart.com.ng/blog/wp-content/uploads/2014/09/abuja_kilimanjaro.jpg",
      263,
      08021626324,
      "KilimanjaroRestaurant.dine.ng",
      "fine dining"),
];
