abstract class ItemsClass {
  String? itemName;
  String? itemType;
  int itemQuantity = 0;
  double itemPrice = 0.0;

  ItemsClass(this.itemName, this.itemType, this.itemQuantity, this.itemPrice);
  void display() {
    print('__________________________________');
    print("ITEM NAME     | $itemName");
    print("ITEM TYPE     | $itemType");
    print("ITEM QUANTITY | $itemQuantity");
    print("ITEM PRICE    | $itemPrice");
    print('__________________________________');
  }

  double calculateTax();
  double calculatePrice();
}
