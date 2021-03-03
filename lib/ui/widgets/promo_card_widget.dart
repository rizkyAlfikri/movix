part of 'widget.dart';

class PromoCardWidget extends StatelessWidget {
  final Promo promo;

  PromoCardWidget(this.promo);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          border: Border.all(color: accentColor4, width: 1.0)),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        child: InkWell(
          onTap: () {},
          splashColor: secondaryColor,
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 40.0,
                  height: 40.0,
                  margin: EdgeInsets.only(right: 12.0),
                  child: Image.asset(promo.imagePath, fit: BoxFit.cover),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(promo.title,
                        style: blackTextFont.copyWith(fontSize: 16.0)),
                    SizedBox(
                      height: 2.0,
                    ),
                    Text(promo.subTitle,
                        style: blackTextFont.copyWith(
                            fontSize: 13.0, fontWeight: FontWeight.w300)),
                  ],
                ),
                Spacer(),
                Text('${promo.discount}%',
                    style: yellowNumberFont.copyWith(
                        fontWeight: FontWeight.w600, fontSize: 22.0))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
