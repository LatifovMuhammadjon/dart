class Account {
  String id, name;
  int balance = 0;
  Account(this.id, this.name, [int? balance]) {
    this.balance = balance ?? 0;
  }
  String getId() => id;
  String getName() => name;
  int getBalance() => balance;
  int credit(int amount) => this.balance += amount;
  int debit(int amount) {
    if (amount <= balance) {
      balance -= amount;
    } else {
      print("Amount exceeded balance");
    }
    return balance;
  }

  int transferTo(Account another, int amount) {
    if (amount <= balance) {
      balance -= amount;
      another.balance += amount;
    } else {
      print("Amount exceeded balance");
    }
    return balance;
  }
  @override
  String toString() {
    return "Account[id=$id,name=$name,balance=$balance]";
  }
}

void main(List<String> args) {
  var a = Account("A102", "Kumar", 88);
  print(a.credit(100));
}
