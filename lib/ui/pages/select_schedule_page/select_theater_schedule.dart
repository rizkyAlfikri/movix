part of '../pages.dart';

class SelectTheaterSchedule extends StatelessWidget {
  final Theater theater;
  final DateTime selectedDate;
  final String selectedTheater;
  final String selectedTime;
  final Function(String selectedTheater, String selectedTime) onTap;

  SelectTheaterSchedule({
    this.theater,
    this.selectedTheater,
    this.selectedTime,
    this.onTap,
    this.selectedDate,
  });

  bool _checkIsCinemaTimeNotExpired(String time) {
    var timeFormated = time.split(':');
    var hour = int.parse(timeFormated.first);
    var minutes = int.parse(timeFormated.last);
    if (selectedDate.day != DateTime.now().day) {
      return true;
    } else if (hour > DateTime.now().hour) {
      return true;
    } else if (hour == DateTime.now().hour) {
      return minutes > DateTime.now().minute;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.fromLTRB(defaultMargin, defaultMargin, 0.0, 12.0),
          child: Text(
            theater.cinemaName,
            style: blackTextFont.copyWith(
                fontSize: 18.0, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          height: 50.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: theater.cinemaTime.length,
            itemBuilder: (_, index) {
              return Container(
                margin: EdgeInsets.only(
                  left: (index == 0) ? defaultMargin : 0,
                  right: (index >= theater.cinemaTime.length - 1)
                      ? defaultMargin
                      : 16.0,
                ),
                child: SelectableBoxWidget(
                  theater.cinemaTime[index],
                  width: 90.0,
                  height: 50.0,
                  isEnabled:
                      _checkIsCinemaTimeNotExpired(theater.cinemaTime[index]),
                  textStyle: blackNumberFont.copyWith(fontSize: 16.0),
                  isSelected: (selectedTime == theater.cinemaTime[index] &&
                      selectedTheater == theater.cinemaName),
                  onTap: () {
                    onTap(theater.cinemaName, theater.cinemaTime[index]);
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
