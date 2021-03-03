part of 'widget.dart';

class BrowseButton extends StatelessWidget {
  final String genre;

  BrowseButton(this.genre);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: 50.0,
            height: 50.0,
            margin: EdgeInsets.only(bottom: 4.0),
            decoration: BoxDecoration(
              color: backgroundCardColor,
              borderRadius: BorderRadius.all(Radius.circular(14.0)),
            ),
            child: Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(14.0)),
              child: InkWell(
                  borderRadius: BorderRadius.all(Radius.circular(14.0)),
                  onTap: () {},
                  splashColor: secondaryColor,
                  child: Padding(
                    padding: EdgeInsets.all(6.0),
                    child: Image.asset(
                        'assets/icon_${genre.toLowerCase().trim()}.png'),
                  )),
            )),
        Text(
          genre,
          style: blackTextFont.copyWith(fontSize: 12.0),
        )
      ],
    );
  }
}
