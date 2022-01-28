class Item {
  String item;
  double weight;
  String metric;
  String expiry;
  String storageMethod;
  String otherDetails;

  Item(this.item, this.weight, this.metric, this.expiry, this.storageMethod,
      this.otherDetails);
}

List<Item> items = [
  Item("Milk", 600000, "", "", "", ""),
  Item("Potatoes", 20000, "", "", "", ""),
  Item("Potatoes", 30000, "", "", "", "")
];
