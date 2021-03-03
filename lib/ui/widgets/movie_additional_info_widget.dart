part of 'widget.dart';

class MovieAdditionalInfoWidget extends StatelessWidget {
  final String title;
  final String label;
  final Widget child;
  final double padding;
  final bool isNumberText;

  MovieAdditionalInfoWidget(this.title, this.label,
      {this.child, this.padding = 8.0, this.isNumberText = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: padding),
      child: Row(
        children: [
          Text('$title : ',
              style: blackTextFont.copyWith(
                fontSize: 14.0,
              )),
          Flexible(
            child: label.isEmpty
                ? child
                : Text(
                    label,
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                    style: isNumberText
                        ? blackNumberFont.copyWith(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                          )
                        : blackTextFont.copyWith(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                          ),
                  ),
          ),
        ],
      ),
    );
  }
}
