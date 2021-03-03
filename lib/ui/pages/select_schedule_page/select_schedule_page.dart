part of '../pages.dart';

class SelectSchedulePage extends StatefulWidget {
  static const ROUTE_NAME = '/select_schedule_page';

  final MovieDetail movieDetail;

  const SelectSchedulePage({this.movieDetail});

  @override
  _SelectSchedulePageState createState() => _SelectSchedulePageState();
}

class _SelectSchedulePageState extends State<SelectSchedulePage> {
  List<DateTime> _dates;
  DateTime _selectedDate;

  String _selecterTheater;
  String _selectedTime;

  @override
  void initState() {
    super.initState();
    _initScheduleDate();
    _initTheaterSchedule();
  }

  void _initScheduleDate() {
    _dates = List.generate(
      7,
      (index) => DateTime.now().add(
        Duration(days: index),
      ),
    );

    _selectedDate = _dates.first;
    _selectedTime = "";
    _selecterTheater = "";
  }

  void _initTheaterSchedule() {
    context.bloc<TheaterBloc>().add(FetchTheater());
  }

  void _onTapDateCardWidget(DateTime date) {
    setState(() {
      _selectedDate = date;
      _selectedTime = "";
      _selecterTheater = "";
    });
  }

  void _onTapTheaterSchedule(String theaterName, String time) {
    setState(() {
      _selecterTheater = theaterName;
      _selectedTime = time;
    });
  }

  void _onTapChooseYourSeatButton(
    MovieDetail movieDetail,
    DateTime date,
    String theater,
    String time,
    UserModel userModel,
  ) {
    var filteredTime = time.split(':');
    Ticket ticket = Ticket(
      movieDetail: movieDetail,
      theater: Theater(cinemaName: theater, cinemaTime: [time]),
      time: DateTime(
        date.year,
        date.month,
        date.day,
        int.parse(filteredTime.first),
        int.parse(filteredTime.last),
      ),
      bookingCode: randomAlphaNumeric(12),
      seats: null,
      name: userModel.name,
      totalPrice: 0,
    );

    Navigator.of(context).pushNamed(
      SelectSeatPage.ROUTE_NAME,
      arguments: ticket,
    );
  }

  void _backToPreviousPage() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: getScreenSize(context).height * 0.46,
            child: Hero(
              tag: widget.movieDetail.id,
              child: ShaderMask(
                shaderCallback: (rect) {
                  return LinearGradient(
                          colors: [Colors.white, Colors.transparent],
                          begin: Alignment.center,
                          end: Alignment.bottomCenter)
                      .createShader(
                          Rect.fromLTRB(0, 0, rect.width, rect.height));
                },
                child: Image.network(
                  IMAGE_URL_BASE_PATH +
                      IMAGE_MEDIUM_SIZE +
                      widget.movieDetail.backdropPath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          ClipRRect(
            child: SizedBox(
              height: getScreenSize(context).height * 0.46,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                child: Container(
                  color: Colors.white.withOpacity(0.5),
                ),
              ),
            ),
          ),
          ListView(
            children: [
              CustomAppBar(
                widget.movieDetail.title,
                _backToPreviousPage,
                isMorphism: true,
                backgroundColor: Colors.transparent,
              ),
              BlocBuilder<TheaterBloc, TheaterState>(
                builder: (context, theaterState) {
                  if (theaterState is TheaterLoaded) {
                    return Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.fromLTRB(
                              defaultMargin, defaultMargin, 0.0, 12.0),
                          child: Text(
                            'Choose Date',
                            style: blackTextFont.copyWith(
                                fontSize: 18.0, fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(
                          height: 85.0,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: _dates.length,
                            itemBuilder: (_, index) => DateCardWidget(
                              isSelected: _selectedDate == _dates[index],
                              date: _dates[index],
                              onTap: _onTapDateCardWidget,
                              index: index,
                              dataLength: _dates.length - 1,
                            ),
                          ),
                        ),
                        Wrap(
                            children: theaterState.theaters
                                .map((theater) => SelectTheaterSchedule(
                                      theater: theater,
                                      selectedTheater: _selecterTheater,
                                      selectedTime: _selectedTime,
                                      selectedDate: _selectedDate,
                                      onTap: _onTapTheaterSchedule,
                                    ))
                                .toList()),
                      ],
                    );
                  } else if (theaterState is TheaterError) {
                    WidgetsBinding.instance.addPostFrameCallback((_) =>
                        showErrorMessage(theaterState.errorMessage, context));
                    return Center(
                      child: Text(theaterState.errorMessage),
                    );
                  } else {
                    return ShimmerSelectScheduleWidget();
                  }
                },
              ),
              Container(
                margin: EdgeInsets.fromLTRB(
                  defaultMargin,
                  36.0,
                  defaultMargin,
                  defaultMargin,
                ),
                child: BlocBuilder<UserBloc, UserState>(
                  builder: (context, userState) {
                    if (userState is UserLoaded) {
                      return PrimaryButtonWidget(
                        isEnable: (_selectedTime.isNotEmpty &&
                            _selecterTheater.isNotEmpty),
                        width: getScreenSize(context).width - 2 * defaultMargin,
                        buttonLabel: 'Choose Your Seat',
                        onTap: () {
                          _onTapChooseYourSeatButton(
                            widget.movieDetail,
                            _selectedDate,
                            _selecterTheater,
                            _selectedTime,
                            userState.user,
                          );
                        },
                      );
                    } else {
                      return PrimaryButtonWidget(
                        isEnable: false,
                        width: getScreenSize(context).width - 2 * defaultMargin,
                        buttonLabel: 'Choose Your Seat',
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
