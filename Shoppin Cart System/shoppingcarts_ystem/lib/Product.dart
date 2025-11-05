class Product{
  String name;
  double price;
  bool inStock;

Product(this.name,this.price,this.inStock);
}
// Custom Higher-Order Function (function as parameter)
void applyDiscount(List<Product> cart, double Function(double) discountFunction){
  print("\n Applying discount..");
  for(var product in cart){
    double newPrice = discountFunction(product.price);
    print("${product.name} discounted price: ₹${newPrice.toStringAsFixed(2)}");
  }
}
// Closure —  
Function createDiscount(double percentage) {
  return (double price) => price - (price * percentage / 100);
}
void main() {
  List<Product> cart = [
    Product("Shoes", 2500, true),
    Product("Watch", 3500, false),
    Product("Bag", 1800, true),
    Product("Shirt", 1200, true),
    Product("Perfume", 800, false)
  ];

  print(" Original Cart:");
  cart.forEach((p) => print("• ${p.name} - ₹${p.price} - In Stock: ${p.inStock}"));

  //  where() — Filter only in-stock products
  var availableProducts = cart.where((p) => p.inStock).toList();
  print("\n Available Products:");
  availableProducts.forEach((p) => print("• ${p.name} - ₹${p.price}"));

  // map() 
  var updatedPrices = availableProducts.map((p) => p.price * 1.10).toList();
  print("\nPri ces after 10% inflation increase: $updatedPrices");

  // reduce() — Calculate total of available products
  double totalPrice = availableProducts.map((p) => p.price).reduce((a, b) => a + b);
  print("\n Total price (using reduce): ₹$totalPrice");

  // fold() — Calculate total including initial value 
  double grandTotal = availableProducts.map((p) => p.price).fold(100, (a, b) => a + b);
  print("Grand total (with ₹100 delivery): ₹$grandTotal");

  // Custom Higher-Order Function
  var specialDiscount = (double price) => price * 0.9; 
  applyDiscount(availableProducts, specialDiscount);

  //  Closure (return function)
  var festivalDiscount = createDiscount(15); 
  print("\n Festival Discount Applied:");
  availableProducts.forEach((p) {
    print("• ${p.name}: ₹${festivalDiscount(p.price).toStringAsFixed(2)}");
  });

  // forEach() — Print final receipt
  print("\nFinal Receipt:");
  cart.forEach((p) {
    print("Item: ${p.name} | Price: ₹${p.price} | In Stock: ${p.inStock ? "Yes" : "No"}");
  });
}