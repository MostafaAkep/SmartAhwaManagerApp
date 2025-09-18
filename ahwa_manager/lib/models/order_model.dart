import 'drink_model.dart';

class OrderModel {
  List<DrinkModel> drinks;
  String customerName;
  String? instructions;
  OrderStatus status;

  OrderModel({
    required this.drinks,
    required this.customerName,
    this.instructions,
    this.status = OrderStatus.pending,
  });

  void updateOrder({
    String? customerName,
    String? instructions,
    List<DrinkModel>? drinks,
  }) {
    this.customerName = customerName ?? this.customerName;
    this.instructions = instructions ?? this.instructions;
    this.drinks = drinks ?? this.drinks;
  }
}

enum OrderStatus { pending, completed }
