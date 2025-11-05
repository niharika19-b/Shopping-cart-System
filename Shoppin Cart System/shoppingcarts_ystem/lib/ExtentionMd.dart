class Product {
  final String name;
  final double price;
  Product(this.name, this.price);
}

// Extension on double → Convert price into ₹ format
extension PriceFormat on double {
  String toCurrency() {
    return '₹${toStringAsFixed(2)}'; 
  }
}

// Extension on String → Capitalize the first letter
extension StringHelpers on String {
  String capitalize() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }
}

// Extension on List<Product> → Calculate total price
extension CartTotal on List<Product> {
  double get totalPrice => fold(0.0, (sum, item) => sum + item.price);
}

void main() {
  var cart = [
    Product('shoes', 2500.50),
    Product('bag', 1800.00),
    Product('watch', 3500.75),
  ];

  print(" Shopping Cart Items:");
  for (var p in cart) {
    print("- ${p.name.capitalize()} : ${p.price.toCurrency()}");
  }

  print(" Total Price: ${cart.totalPrice.toCurrency()}");
}
