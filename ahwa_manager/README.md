# ☕ Beverage Order Management System

A Dart-based command-line application for managing beverage orders in a café setting. This system allows tracking customer orders, managing order status, and generating sales reports.

## 🏗️ Architecture

The application follows a clean architecture pattern with clear separation of concerns:

```
lib/
├── models/            
│   ├── order_model.dart  
│   └── drink_model.dart  
├── services/          
│   └── order_service.dart  
└── repo/              
    └── order_repo.dart   
```

## ✨ Features

- **Order Management**
  - Create new orders with multiple beverages
  - Update existing orders
  - Mark orders as completed
  - View all active orders

- **Beverage Types**
  - Turkish Coffee
  - Tea (Shai)
  - Hibiscus Tea

- **Reporting**
  - Generate sales reports
  - Track completed orders
  - Identify top-selling beverages

## 🚀 Getting Started

1. Ensure you have Dart SDK installed on your system
2. Clone this repository
3. Run the application:
   ```bash
   dart run lib/main.dart
   ```

## 📊 Example Usage

```dart
// Create an order service instance
final orderService = OrderService();

// Create a new order
final order = OrderModel(
  drinks: [TurkishCoffee(), Tea()],
  customerName: "Omar",
  instructions: "No sugar",
);

// Add the order
orderService.addOrder(order);

// Mark order as completed when served
orderService.markOrderCompleted(order);

// Generate a sales report
orderService.generateReport();
```

## 📝 Project Structure

- `lib/models/`: Contains data models for orders and beverages
- `lib/services/`: Contains business logic and services
- `lib/repo/`: Defines the repository interface for data access
- `test/`: Contains unit tests (to be implemented)
