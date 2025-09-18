abstract class DrinkModel {
  String get name;
}

class TurkishCoffee implements DrinkModel {
  @override
  String get name => "Turkish Coffee";
}

class HibiscusTea implements DrinkModel {
  @override
  String get name => "Hibiscus Tea";
}

class Shai implements DrinkModel {
  @override
  String get name => "Shai";
}
