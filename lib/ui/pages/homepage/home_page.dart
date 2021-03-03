part of '../pages.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

void _moveToMovieDetailPage(Movie movie, BuildContext context) {
  Navigator.of(context).pushNamed(MovieDetailPage.ROUTE_NAME, arguments: movie);
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: BlocBuilder<UserBloc, UserState>(
            builder: (context, userState) {
              if (userState is UserLoaded) {
                return HeaderHomeWidget(userModel: userState.user);
              } else {
                return HeaderHomeLoadingWidget();
              }
            },
          )),
      body: Center(
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchHomeWidget(),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: defaultMargin, vertical: 12.0),
                  child: Text(
                    'Now Playing',
                    style: blackTextFont.copyWith(
                        fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 140,
                  width: getScreenSize(context).width,
                  child: BlocBuilder<MovieBloc, MovieState>(
                    builder: (_, movieState) {
                      if (movieState is MovieLoaded) {
                        var movies = movieState.movies.sublist(0, 10);
                        return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: movies.length,
                            itemBuilder: (context, index) => MovieCardWidget(
                                  movies[index],
                                  index,
                                  movies.length - 1,
                                  onTap: () {
                                    _moveToMovieDetailPage(
                                        movies[index], context);
                                  },
                                ));
                      } else if (movieState is MovieError) {
                        WidgetsBinding.instance.addPostFrameCallback((_) =>
                            showErrorMessage(movieState.errorMessage, context));
                        return SizedBox();
                      } else {
                        return SizedBox(
                          height: 140,
                          width: getScreenSize(context).width,
                          child: ShimmerMovieCardWidget(),
                        );
                      }
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: defaultMargin, top: defaultMargin, bottom: 12.0),
                  child: Text(
                    'Explore Movie',
                    style: blackTextFont.copyWith(
                        fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                ),
                BlocBuilder<UserBloc, UserState>(
                  builder: (_, userState) {
                    if (userState is UserLoaded) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: defaultMargin),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                              userState.user.selectedGenres.length,
                              (index) => BrowseButton(
                                  userState.user.selectedGenres[index])),
                        ),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: defaultMargin),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                            4,
                            (index) => SimpleShimmer(
                                child: null,
                                width: 50.0,
                                height: 50.0,
                                radius: 8.0),
                          ),
                        ),
                      );
                    }
                  },
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: defaultMargin, top: defaultMargin, bottom: 12.0),
                  child: Text(
                    'Comming Soon',
                    style: blackTextFont.copyWith(
                        fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 140,
                  width: getScreenSize(context).width,
                  child: BlocBuilder<MovieBloc, MovieState>(
                    builder: (_, movieState) {
                      if (movieState is MovieLoaded) {
                        var movies = movieState.movies.sublist(10);
                        return CommingSoonCardWidget(
                          movies: movies,
                          onTap: (movie, context) {
                            _moveToMovieDetailPage(movie, context);
                          },
                        );
                      } else if (movieState is MovieError) {
                        WidgetsBinding.instance.addPostFrameCallback((_) =>
                            showErrorMessage(movieState.errorMessage, context));
                        return SizedBox();
                      } else {
                        return SizedBox(
                          height: 140,
                          width: getScreenSize(context).width,
                          child: ShimmerMovieCardWidget(
                            width: 100.0,
                          ),
                        );
                      }
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: defaultMargin, top: defaultMargin, bottom: 12.0),
                  child: Text(
                    'Get Lucky Day',
                    style: blackTextFont.copyWith(
                        fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                  child: Column(
                    children: getDummyPromo
                        .map((data) => PromoCardWidget(data))
                        .toList(),
                  ),
                ),
                SizedBox(
                  height: 56.0 + 36.0,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
