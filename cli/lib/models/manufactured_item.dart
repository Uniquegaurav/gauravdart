import 'package:cli/models/items.dart';

class ManufacturedItem extends Items {
  double itemTax = 0.0;
  double itemFinalPrice = 0.0;
  ManufacturedItem(String? name, String? type, int quantity, double price)
      : super(name, type, quantity, price);
  @override
  double calculateTax() {
    double tax = 12.5 / 100 * super.itemPrice;
    tax += 2.0 / 100 * (super.itemPrice + tax);
    itemTax = tax;
    return itemTax;
  }

  @override
  double calculatePrice() {
    itemFinalPrice = super.itemPrice + itemTax;
    return itemFinalPrice;
  }
}
