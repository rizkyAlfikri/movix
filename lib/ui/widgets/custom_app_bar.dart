part of 'widget.dart';

class CustomAppBar extends StatelessWidget {
  final Function _backArrowCallback;
  final String _title;
  final bool isMorphism;
  final Color backgroundColor;
  final String tagTitle;
  final String tagBackArrow;

  CustomAppBar(
    this._title,
    this._backArrowCallback, {
    this.isMorphism = false,
    this.backgroundColor = Colors.white,
    this.tagTitle = "",
    this.tagBackArrow = "tagBackArrow",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      margin: EdgeInsets.only(top: 16.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: defaultMargin),
              child: Hero(
                tag: tagBackArrow,
                child: Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(24),
                  child: InkWell(
                      splashColor: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      onTap: _backArrowCallback,
                      child: isMorphism
                          ? ClipOval(
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                                child: Container(
                                    height: 36.0,
                                    width: 36.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white.withOpacity(0.4),
                                    ),
                                    child: Icon(
                                      Icons.arrow_back,
                                      color: Colors.black,
                                      size: defaultMargin,
                                    )),
                              ),
                            )
                          : Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                              size: defaultMargin,
                            )),
                ),
              ),
            ),
          ),
          SizedBox(
            width: getScreenSize(context).width - defaultMargin * 6,
            child: Hero(
              tag: tagTitle,
              child: Material(
                type: MaterialType.transparency,
                child: Text(
                  _title,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.clip,
                  style: blackTextFont.copyWith(
                      fontWeight: FontWeight.w600, fontSize: 20.0),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
