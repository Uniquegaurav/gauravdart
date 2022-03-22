import 'item_class.dart';

class ImportedItem extends ItemsClass {
  double itemTax = 0.0;
  double itemFinalPrice = 0.0;
  ImportedItem(String? name, String? type, int quantity, double price)
      : super(name, type, quantity, price);
  @override
  double calculateTax() {
    double tax = 10.0 / 100 * super.itemPrice;
    if (tax <= 100) {
      tax += 5;
    } else if (tax >= 100 && tax <= 200) {
      tax += 10;
    } else {
      tax += 5.0 / 100 * (tax + super.itemPrice);
    }
    itemTax = tax;
    return itemTax;
  }

  @override
  double calculatePrice() {
    itemFinalPrice = super.itemPrice + itemTax;
    return itemFinalPrice;
  }
}
