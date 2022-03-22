import 'item_class.dart';

class RawItem extends ItemsClass {
  double itemTax = 0.0;
  double itemFinalPrice = 0.0;
  RawItem(String? name, String? type, int quantity, double price)
      : super(name, type, quantity, price);
  @override
  double calculateTax() {
    print('calculating tax');
    double tax = 12.5 / 100 * super.itemPrice;
    itemTax = tax;
    return itemTax;
  }

  @override
  double calculatePrice() {
    itemFinalPrice = super.itemPrice + itemTax;
    return itemFinalPrice;
  }
}
