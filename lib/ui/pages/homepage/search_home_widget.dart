part of '../pages.dart';

class SearchHomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 56.0,
      padding: EdgeInsets.only(
        right: defaultMargin,
        left: defaultMargin,
        top: 4.0,
        bottom: 16.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
              child: TextField(
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(top: 0.0, bottom: 0.0),
                filled: true,
                fillColor: backgroundColor,
                prefixIcon: Icon(
                  Icons.search,
                  size: 20.0,
                  color: Colors.black,
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(4.0)),
                hintText: 'Search your movie here',
                hintStyle: greyTextFont.copyWith(
                    fontSize: 12.0, fontWeight: FontWeight.normal)),
          )),
          SizedBox(
            width: 16.0,
          ),
          RoundedImageWithBorder(
            '',
            backgroundColor: backgroundColor,
            borderColor: backgroundColor,
            icons: Icons.favorite,
            padding: 5.0,
            size: 36.0,
          )
        ],
      ),
    );
  }
}
