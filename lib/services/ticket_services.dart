part of 'services.dart';

class TicketService {
  static CollectionReference _ticketCollection =
      FirebaseFirestore.instance.collection('tickets');

  static Future<bool> saveTicket(String id, Ticket ticket) async {
    try {
      await _ticketCollection.doc().set({
        'movie_id': ticket.movieDetail.id ?? "",
        'user_id': id ?? '',
        'theater_name': ticket.theater.cinemaName ?? "",
        'time': ticket.time.millisecondsSinceEpoch ??
            DateTime.now().millisecondsSinceEpoch,
        'booking_code': ticket.bookingCode,
        'seats': ticket.seatsInString,
        'name': ticket.name,
        'total_price': ticket.totalPrice
      });

      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<Either<String, List<Ticket>>> getTickets(String userId) async {
    try {
      QuerySnapshot snapshot =
          await _ticketCollection.where('user_id', isEqualTo: userId).get();

      List<Ticket> tickets = [];
      for (var document in snapshot.docs) {
        MovieDetailResult movieDetail =
            await MovieServices.getMovieDetail(document.data()['movie_id']);

        tickets.add(Ticket(
            movieDetail: movieDetail.movieDetail,
            theater: Theater(cinemaName: document.data()['theater_name']),
            time: DateTime.fromMillisecondsSinceEpoch(document.data()['time']),
            bookingCode: document.data()['booking_code'],
            seats: document.data()['seats'].toString().split(','),
            name: document.data()['name'],
            totalPrice: document.data()['total_price']));
      }

      return Right(tickets);
    } catch (e) {
      debugPrint(e.toString());
      return Left(e.toString());
    }
  }
}
