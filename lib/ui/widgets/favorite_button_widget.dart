part of 'widget.dart';

class FavoriteButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(24),
      child: InkWell(
        splashColor: dangernColor,
        borderRadius: BorderRadius.circular(24),
        onTap: () {},
        child: ClipOval(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
            child: Container(
                height: 48.0,
                width: 48.0,
                decoration: BoxDecoration(
                  border: Border.all(width: 1.5, color: accentColor4),
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.4),
                ),
                child: Icon(
                  Icons.favorite,
                  color: accentColor3,
                  size: 24.0,
                )),
          ),
        ),
      ),
    );
  }
}
