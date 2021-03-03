part of 'widget.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController _controller;
  final String _label;
  final bool isNeedObscuredText;

  CustomTextField(this._controller, this._label,
      {this.isNeedObscuredText = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.0,
      child: TextField(
          obscureText: isNeedObscuredText,
          controller: _controller,
          decoration: getCustomInputDecoration(_label)),
    );
  }
}
