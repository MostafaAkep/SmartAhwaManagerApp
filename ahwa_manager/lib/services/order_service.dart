import 'package:ahwa_manager/repo/oreder_repo.dart';

import '../models/order_model.dart';

class OrderService implements OrderRepo {
  final List<OrderModel> _orders = [];

  @override
  void addOrder(OrderModel order) {
    _orders.add(order);
    print("✅ Order added for ${order.customerName}");
  }

  @override
  void markOrderCompleted(OrderModel order) {
    final index = _orders.indexOf(order);
    if (index != -1) {
      _orders[index].status = OrderStatus.completed;
      print("☑️ Order for ${order.customerName} completed!");
    } else {
      print("⚠️ Order not found!");
    }
  }

  @override
  void listOrders() {
    if (_orders.isEmpty) {
      print("📭 No orders yet.");
      return;
    }

    print("\n📋 Current Orders:");
    for (var order in _orders) {
      final drinksList = order.drinks.map((d) => d.name).join(', ');
      final status = order.status.toString().split('.').last;
      print("- ${order.customerName} | Drinks: $drinksList | $status");
    }
  }

  @override
  void updateOrder(OrderModel order) {
    final index = _orders.indexOf(order);
    if (index != -1) {
      _orders[index].updateOrder(
        customerName: order.customerName,
        instructions: order.instructions,
        drinks: order.drinks,
      );
      print("✅ Order updated for ${order.customerName}");
    } else {
      print("⚠️ Order not found!");
    }
  }

  @override
  List<OrderModel> getCompletedOrders() => _orders
      .where((orderModel) => orderModel.status == OrderStatus.completed)
      .toList();

  @override
  List<MapEntry<String, int>> getTopSellingDrinks() {
    final Map<String, int> drinkCount = {};
    final orders = getCompletedOrders();

    for (var order in orders) {
      for (var drink in order.drinks) {
        drinkCount[drink.name] = (drinkCount[drink.name] ?? 0) + 1;
      }
    }

    if (drinkCount.isEmpty) return [];

    final maxCount = drinkCount.values.reduce((a, b) => a > b ? a : b);
    return drinkCount.entries.where((e) => e.value == maxCount).toList();
  }

  @override
  void generateReport() {
    final Map<String, int> drinkCount = {};
    final completedOrders = getCompletedOrders();

    for (var order in completedOrders) {
      for (var drink in order.drinks) {
        drinkCount[drink.name] = (drinkCount[drink.name] ?? 0) + 1;
      }
    }

    print("\n📊 Daily Sales Report (completed orders only):");
    if (drinkCount.isEmpty) {
      print("No completed orders yet.");
    } else {
      drinkCount.forEach((drink, count) {
        print("$drink: $count orders");
      });

      final topSingles = getTopSellingDrinks();
      if (topSingles.length == 1) {
        final top = topSingles.first;
        print("🥇 Top Selling Drink: ${top.key} (${top.value} orders)");
      } else if (topSingles.isNotEmpty) {
        final names = topSingles.map((e) => "${e.key} (${e.value})").join(', ');
        print("🥇 Top Selling Drinks: $names");
      }
    }

    print("Total Orders: ${_orders.length}");
    print("Completed Orders: ${completedOrders.length}");
  }
}
