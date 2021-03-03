part of '../pages.dart';

// ignore: must_be_immutable
class SignUpPictureProfileWidget extends StatelessWidget {
  File _pictureFile;
  Function _processPictureProfile;

  File get pictureFile => _pictureFile;

  SignUpPictureProfileWidget(this._pictureFile, this._processPictureProfile);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 32),
      width: 88.0,
      height: 100.0,
      child: Stack(
        children: [
          Container(
            height: 88.0,
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: (_pictureFile == null)
                        ? AssetImage('assets/icon_empty_avatar.png')
                        : FileImage(_pictureFile))),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: _processPictureProfile,
              child: Container(
                width: 26,
                height: 26,
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Image(
                  image: (_pictureFile == null)
                      ? AssetImage(
                          'assets/icon_add_picture.png',
                        )
                      : AssetImage(
                          'assets/icon_clear_picture.png',
                        ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
