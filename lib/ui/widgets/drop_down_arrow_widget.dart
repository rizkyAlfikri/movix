part of 'widget.dart';

class DropDownArrowWidget extends StatelessWidget {
  final Animation<double> animation;
  final Function onTap;

  const DropDownArrowWidget({@required this.animation, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 16.0,
      ),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, widget) => Transform.rotate(
          angle: animation.value,
          child: GestureDetector(
            child: Icon(
              Icons.keyboard_arrow_up,
              size: 36.0,
            ),
            onTap: onTap != null ? onTap : null,
          ),
        ),
      ),
    );
  }
}
