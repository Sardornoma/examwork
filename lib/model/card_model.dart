class CardData {
  int id;
  String name;
  String expiredDate;
  String cardNumber;
  int userId;
  String balance;

  CardData(
      {required this.id,
      required this.name,
      required this.expiredDate,
      required this.cardNumber,
      required this.userId,
      required this.balance});
}
