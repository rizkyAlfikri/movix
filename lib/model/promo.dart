part of 'model.dart';

class Promo {
  final String title;
  final String subTitle;
  final int discount;
  final String imagePath;

  Promo(this.title, this.subTitle, this.discount, this.imagePath);
}

List<Promo> getDummyPromo = [
  Promo('Holiday Promo', 'Maximal only for two people', 50,
      'assets/icon_holiday.png'),
  Promo('Student Promo', 'Maximal only for two people', 75,
      'assets/icon_student.png'),
  Promo('Loyalty Promo', 'Minimum membership 1 year', 20,
      'assets/icon_loyalty.png')
];
