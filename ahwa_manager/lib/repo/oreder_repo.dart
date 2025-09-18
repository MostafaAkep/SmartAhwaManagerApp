import '../models/order_model.dart';

abstract class OrderRepo {
  void addOrder(OrderModel order);
  void markOrderCompleted(OrderModel order);
  void listOrders();
  void updateOrder(OrderModel order);
  List<OrderModel> getCompletedOrders();
  List<MapEntry<String, int>> getTopSellingDrinks();
  void generateReport();
}
