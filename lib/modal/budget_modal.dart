class Budget {
  int? id, isIncome;
  double? amount;
  String? date, category;

  Budget(
      {required this.id,
      required this.isIncome,
      required this.date,
      required this.category,
      required this.amount});

  factory Budget.fromMap(Map m1) {
    return Budget(
        id: m1['id'],
        isIncome: m1['isIncome'],
        date: m1['date'],
        category: m1['category'],
        amount: m1['amount']);
  }
}
