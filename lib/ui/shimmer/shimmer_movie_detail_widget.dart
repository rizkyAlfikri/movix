part of 'shimmer.dart';

class ShimmerMovieDetalWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SimpleShimmer(
            height: getScreenSize(context).height * 0.46,
            width: getScreenSize(context).width,
          ),
          SizedBox(height: 16.0),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: SimpleShimmer(width: getScreenSize(context).width / 1.5)),
          SizedBox(height: 8.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: Wrap(
              direction: Axis.horizontal,
              spacing: 4.0,
              alignment: WrapAlignment.center,
              children: [
                SimpleShimmer(width: defaultMargin * 2),
                SimpleShimmer(width: defaultMargin * 2),
                SimpleShimmer(width: defaultMargin * 2),
              ],
            ),
          ),
          SizedBox(height: 8.0),
          SimpleShimmer(width: defaultMargin * 4),
          SizedBox(height: 8.0),
          SimpleShimmer(width: defaultMargin * 8),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(
                left: defaultMargin,
                right: defaultMargin,
                top: defaultMargin,
                bottom: 12.0),
            child: SimpleShimmer(width: defaultMargin * 4),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
            child: SimpleShimmer(
                width: getScreenSize(context).width - defaultMargin * 2),
          ),
          SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
            child: SimpleShimmer(
                width: getScreenSize(context).width - defaultMargin * 2),
          ),
          SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
            child: SimpleShimmer(
                width: getScreenSize(context).width - defaultMargin * 2),
          ),
          SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
            child: SimpleShimmer(
                width: getScreenSize(context).width - defaultMargin * 2),
          ),
          SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
            child: SimpleShimmer(
                width: getScreenSize(context).width - defaultMargin * 2),
          ),
          SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
            child: SimpleShimmer(
                width: getScreenSize(context).width - defaultMargin * 2),
          ),
          SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
            child: SimpleShimmer(
                width: getScreenSize(context).width - defaultMargin * 2),
          ),
          SizedBox(height: 8.0),
        ],
      ),
    );
  }
}
