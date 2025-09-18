import 'models/order_model.dart';
import 'services/order_service.dart';
import 'models/drink_model.dart';

void main() {
  final orderRepo = OrderService();

  final order1 = OrderModel(
    drinks: [TurkishCoffee(), Shai()],
    customerName: "Omar",
    instructions: "No sugar",
  );

  final order2 = OrderModel(
    drinks: [HibiscusTea(), Shai()],
    customerName: "Ahmed",
    instructions: "Extra hot",
  );

  orderRepo.addOrder(order1);
  orderRepo.addOrder(order2);

  orderRepo.markOrderCompleted(order1);

  orderRepo.generateReport();
}
