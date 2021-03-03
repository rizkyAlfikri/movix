part of '../pages.dart';

class HeaderHomeWidget extends StatelessWidget {
  final UserModel userModel;

  HeaderHomeWidget({this.userModel});

  void _uploadSignUpImageData(BuildContext context) {
    if (pictureFileToUpload != null) {
      uploadImage(pictureFileToUpload).then((downloadUrl) {
        pictureFileToUpload = null;
        context.bloc<UserBloc>().add(UpdateUserData(profileImage: downloadUrl));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _uploadSignUpImageData(context);
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(
            right: defaultMargin, left: defaultMargin, top: 16.0, bottom: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            (userModel.profilePicture.isEmpty)
                ? Image.asset(
                    'assets/icon_mini_moxi2.png',
                    width: 48.0,
                    height: 48.0,
                  )
                : Container(
                    width: 48.0,
                    height: 48,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(userModel.profilePicture),
                          fit: BoxFit.cover,
                        )),
                  ),
            SizedBox(
              width: 16.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: getScreenSize(context).width - 48 * 2 - 16,
                  child: Text(
                    'Hi ${userModel.name ?? ""}',
                    style: blackTextFont.copyWith(fontSize: 18.0),
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                  ),
                ),
                SizedBox(
                  height: 4.0,
                ),
                Text(
                  NumberFormat.currency(
                          locale: 'id_ID', decimalDigits: 0, symbol: 'IDR ')
                      .format(userModel.balance ?? '0'),
                  style: yellowNumberFont.copyWith(fontSize: 14.0),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
