mixin Logger {
  void log(String message) {
    print("[LOG] $message");
  }
}

//  Creating classes using the mixin
class UserService with Logger {
  void createUser(String name) {
    log("User '$name' created successfully!");
  }
}

class OrderService with Logger {
  void createOrder(int id) {
    log("Order #$id created successfully!");
  }
}

void main() {
  var userService = UserService();
  userService.createUser("Niharika");

  var orderService = OrderService();
  orderService.createOrder(1);
}
