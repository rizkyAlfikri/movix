part of '../pages.dart';

class SignUpFooterWidget extends StatelessWidget {
  final Function _checkRegistrationFieldData;

  SignUpFooterWidget(this._checkRegistrationFieldData);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          'Continue to Sign Up',
          style: blackTextFont.copyWith(
              fontSize: 20.0, fontWeight: FontWeight.w600),
        ),
        Container(
          width: 48.0,
          height: 48.0,
          child: FloatingActionButton(
            elevation: 0.0,
            backgroundColor: mainColor,
            child:
                Icon(Icons.arrow_forward_ios, size: 24.0, color: Colors.white),
            onPressed: () {
              _checkRegistrationFieldData();
            },
          ),
        )
      ],
    );
  }
}
