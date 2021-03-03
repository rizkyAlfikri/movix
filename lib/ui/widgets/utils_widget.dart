part of 'widget.dart';

void showErrorMessage(String errorMessage, BuildContext context) {
  Flushbar(
      duration: Duration(seconds: 4),
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: dangernColor,
      messageText: Text(
        errorMessage,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.white,
        ),
      ))
    ..show(context);
}

InputDecoration getCustomInputDecoration(String labelText) {
  return InputDecoration(
    contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
    focusColor: secondaryColor,
    labelText: labelText,
    hintText: labelText,
    border:
        OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
  );
}
