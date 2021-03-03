part of '../pages.dart';

class MovieDetailPage extends StatefulWidget {
  static const ROUTE_NAME = '/movie_detail_page';

  final Movie movie;

  MovieDetailPage({@required this.movie});

  @override
  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage>
    with TickerProviderStateMixin {
  ScrollController _scrollController;
  AnimationController _animationController;
  bool isFooterButtonShowed = false;

  @override
  void initState() {
    super.initState();
    _initMovieDetailBloc();
    _initScrollListener();
    _initAnimationController();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _initAnimationController() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
  }

  void _initScrollListener() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.hasClients) {
      if (_scrollController.offset >= getScreenSize(context).height * 0.1) {
        _animationController..forward();
      } else {
        _animationController..reverse();
      }
    }
  }

  void _initMovieDetailBloc() {
    context.bloc<MovieDetailBloc>().add(FetchMovieDetail(widget.movie));
    context.bloc<CreditBloc>().add(FetchCredit(widget.movie.id.toString()));
  }

  void _backToPreviousPage() {
    Navigator.pop(context);
  }

  void _moveToSelectSchedulePage(MovieDetail movieDetail) {
    Navigator.pushNamed(context, SelectSchedulePage.ROUTE_NAME,
        arguments: movieDetail);
  }

  @override
  Widget build(BuildContext context) {
    var size = getScreenSize(context);
    return Scaffold(
      body: BlocBuilder<MovieDetailBloc, MovieDetailState>(
        builder: (context, movieState) {
          if (movieState is MovieDetailLoaded) {
            if (movieState.movieDetail != null) {
              return Stack(
                children: [
                  SingleChildScrollView(
                    controller: _scrollController,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Header
                        MovieDetailPhotoHeader(
                            movieState.movieDetail.id,
                            movieState.movieDetail.backdropPath,
                            _backToPreviousPage),
                        SizedBox(height: 4.0),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: defaultMargin),
                          child: Hero(
                            tag: movieState.movieDetail.title,
                            child: Text(movieState.movieDetail.title,
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.clip,
                                style: blackTextFont.copyWith(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.w600)),
                          ),
                        ),
                        SizedBox(height: 4.0),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: defaultMargin),
                          child: Wrap(
                            direction: Axis.horizontal,
                            spacing: 4.0,
                            alignment: WrapAlignment.center,
                            children: movieState.movieDetail.genres
                                .map(
                                  (genre) => Chip(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 4.0),
                                    backgroundColor:
                                        secondaryColor.withOpacity(0.1),
                                    label: Text(genre,
                                        style: purpleTextFont.copyWith(
                                            fontSize: 13,
                                            color: mainColor.withOpacity(0.8))),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                        SizedBox(height: 4.0),
                        RattingStartWidget(
                          startSize: 16.0,
                          fontSize: 14.0,
                          isWhiteText: false,
                          mainAxisAlignment: MainAxisAlignment.center,
                          voteAverage: movieState.movieDetail.voteAverage,
                        ),
                        SizedBox(height: 8.0),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: defaultMargin),
                          child: Text(
                            movieState.movieDetail.tag,
                            style: blackTextFont.copyWith(
                                fontSize: 13.0, fontWeight: FontWeight.w400),
                          ),
                        ),

                        // Story Line
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(
                              left: defaultMargin,
                              right: defaultMargin,
                              top: movieState.movieDetail.tag.isNotEmpty
                                  ? defaultMargin
                                  : 0,
                              bottom: 12.0),
                          child: Text(
                            'Storyline',
                            style: blackTextFont.copyWith(
                                fontSize: 18.0, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: defaultMargin),
                          child: Text(
                            movieState.movieDetail.overview,
                            maxLines: 7,
                            overflow: TextOverflow.clip,
                            style: blackTextFont.copyWith(
                                fontSize: 14.0, height: 1.5),
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.all(defaultMargin),
                          child: Divider(
                            color: Colors.grey,
                            height: 1.0,
                          ),
                        ),

                        // Movie Additional info
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(
                              left: defaultMargin,
                              right: defaultMargin,
                              bottom: 12.0),
                          child: Text(
                            'Details',
                            style: blackTextFont.copyWith(
                                fontSize: 18.0, fontWeight: FontWeight.w600),
                          ),
                        ),
                        MovieDetailAdditionalInfo(movieState.movieDetail),
                        Container(
                          margin: EdgeInsets.all(defaultMargin),
                          child: Divider(
                            color: Colors.grey,
                            height: 1.0,
                          ),
                        ),

                        // Cast
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(
                              left: defaultMargin,
                              right: defaultMargin,
                              bottom: 12.0),
                          child: Text(
                            'Cast',
                            style: blackTextFont.copyWith(
                                fontSize: 18.0, fontWeight: FontWeight.w600),
                          ),
                        ),
                        BlocBuilder<CreditBloc, CreditState>(
                          builder: (context, creditState) {
                            if (creditState is CreditLoaded) {
                              return SizedBox(
                                height: 120.0,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: creditState.credits.length,
                                    itemBuilder: (_, index) {
                                      return CastCardWidget(
                                        creditState.credits[index],
                                        index: index,
                                        dataLength:
                                            creditState.credits.length - 1,
                                      );
                                    }),
                              );
                            } else if (creditState is CreditError) {
                              WidgetsBinding.instance.addPostFrameCallback(
                                  (_) => showErrorMessage(
                                      creditState.errorMessage, context));
                              return SizedBox();
                            } else {
                              return ShimmerCastCardWidget();
                            }
                          },
                        ),
                        SizedBox(
                          height: 100.0,
                        ),
                      ],
                    ),
                  ),
                  PositionedTransition(
                      rect: RelativeRectTween(
                              begin: RelativeRect.fromSize(
                                  Rect.fromLTRB(0, size.height, 0, 0),
                                  Size(0, 0)),
                              end: RelativeRect.fromSize(
                                  Rect.fromLTRB(
                                      0, size.height - defaultMargin * 4, 0, 0),
                                  Size(0, 0)))
                          .animate(CurvedAnimation(
                              parent: _animationController,
                              curve: Curves.easeIn)),
                      child: MovieDetailButtonFooter(
                        buttonLabel: 'Continue To Book',
                        onTap: () {
                          _moveToSelectSchedulePage(movieState.movieDetail);
                        },
                      ))
                ],
              );
            } else {
              return Center(
                child: Text('Data is Null'),
              );
            }
          } else if (movieState is MovieDetailError) {
            WidgetsBinding.instance.addPostFrameCallback(
                (_) => showErrorMessage(movieState.errorMessage, context));
            return Center(
              child: Text(movieState.errorMessage),
            );
          } else {
            return ShimmerMovieDetalWidget();
          }
        },
      ),
    );
  }
}
