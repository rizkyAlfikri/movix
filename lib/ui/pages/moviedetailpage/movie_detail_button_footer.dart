part of '../pages.dart';

class MovieDetailButtonFooter extends StatelessWidget {
  final Function onTap;
  final String buttonLabel;

  const MovieDetailButtonFooter({this.onTap, this.buttonLabel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
      child: Row(
        children: [
          FavoriteButtonWidget(),
          SizedBox(width: 12.0),
          PrimaryButtonWidget(
            buttonLabel: buttonLabel,
            onTap: () {
              if (onTap != null) {
                onTap();
              }
            },
            width: getScreenSize(context).width - defaultMargin * 4 - 12,
          )
        ],
      ),
    );
  }
}
