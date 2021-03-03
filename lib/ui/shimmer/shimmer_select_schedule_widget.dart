part of 'shimmer.dart';

class ShimmerSelectScheduleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Column(children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.fromLTRB(defaultMargin, defaultMargin, 0.0, 12.0),
          child: SimpleShimmer(
            width: defaultMargin * 6,
          ),
        ),
        SizedBox(
          height: 85.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (_, index) => Container(
              margin: EdgeInsets.only(
                left: (index == 0) ? 24.0 : 0,
                right: (index >= 3) ? 24.0 : 16.0,
              ),
              child: SimpleShimmer(
                width: 70.0,
                height: 85.0,
              ),
            ),
          ),
        ),
        Wrap(
          children: List.generate(
            4,
            (_) => Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.fromLTRB(
                      defaultMargin, defaultMargin, 0.0, 12.0),
                  child: SimpleShimmer(
                    width: defaultMargin * 6,
                  ),
                ),
                SizedBox(
                  height: 50.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (_, index) {
                      return Container(
                        margin: EdgeInsets.only(
                          left: (index == 0) ? defaultMargin : 0,
                          right: (index >= 3) ? defaultMargin : 16.0,
                        ),
                        child: SimpleShimmer(
                          width: 90.0,
                          height: 50.0,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        )
      ])
    ]);
  }
}
