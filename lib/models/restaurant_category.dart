enum RestaurantCategory {
  fineDining(FINE_DINING, FINE_DINING_PHOTO),
  budgetFriendly(BUDGET_FRIENDLY, BUDGET_FRIENDLY_PHOTO),
  fastFood(FAST_FOOD, FAST_FOOD_PHOTO);

  const RestaurantCategory(this.title, this.photo);
  final String title;
  final String photo;
}

extension ReturnCategory on String {
  RestaurantCategory returnCategory() {
    switch (this) {
      case FINE_DINING:
        return RestaurantCategory.fineDining;
      case BUDGET_FRIENDLY:
        return RestaurantCategory.budgetFriendly;
      default:
        return RestaurantCategory.fastFood;
    }
  }
}

const FINE_DINING = "Fine Dining";
const BUDGET_FRIENDLY = "Budget Friendly";
const FAST_FOOD = "Fast Food";

const FINE_DINING_PHOTO = "fine_dinning.png";
const BUDGET_FRIENDLY_PHOTO = "budget_friendly.png";
const FAST_FOOD_PHOTO = "fast_food.png";
