part of '../pages.dart';

class MovieDetailPhotoHeader extends StatelessWidget {
  final int movieId;
  final String movieTitle;
  final String backdropPath;
  final Function onBackArrowTap;

  MovieDetailPhotoHeader(this.movieId, this.backdropPath, this.onBackArrowTap,
      {this.movieTitle = ""});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Hero(
          tag: movieId,
          child: ShaderMask(
            shaderCallback: (rect) {
              return LinearGradient(
                      colors: [Colors.white, Colors.transparent],
                      begin: Alignment.center,
                      end: Alignment.bottomCenter)
                  .createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
            },
            child: SizedBox(
                height: getScreenSize(context).height * 0.46,
                child: Image.network(
                  IMAGE_URL_BASE_PATH + IMAGE_MEDIUM_SIZE + backdropPath,
                  fit: BoxFit.cover,
                )),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: defaultMargin),
          child: CustomAppBar(movieTitle, onBackArrowTap,
              isMorphism: true, backgroundColor: Colors.transparent),
        ),
      ],
    );
  }
}
