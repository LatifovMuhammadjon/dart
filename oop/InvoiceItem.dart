class InvoiceItem {
  String id, desc;
  int qty;
  double unitPrice;
  InvoiceItem(this.id, this.desc, this.qty, this.unitPrice);
  String getId() => id;
  String getDesc() => desc;
  int getQty() => qty;
  void setQty(qty) => this.qty = qty;
  double getUnitPrice() => unitPrice;
  void setUnitPrice(double unitPrice) => this.unitPrice = unitPrice;
  double getTotal() => unitPrice * qty;

  @override
  String toString() {
    return "InvoiceItem[id=$id,desc=$desc,qty=$qty,unitPrice=$unitPrice]";
  }
}

// void main(List<String> args) {
//   InvoiceItem inv1 = new InvoiceItem("A101", "Pen Red", 888, 0.08);
//   inv1.setUnitPrice(0.99);
//   inv1.setQty(999);
//   print(inv1);
//   print(inv1.getTotal());
// }
