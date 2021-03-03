part of 'services.dart';

class TheaterService {
  static CollectionReference _theaterCollection =
      FirebaseFirestore.instance.collection('cinema_data');

  static Future<Either<String, List<Theater>>> getTheater() async {
    try {
      QuerySnapshot snapshots = await _theaterCollection.get();

      var listTheater = snapshots.docs.map((snapshot) {
        var result = snapshot.data()['cinema_time'] as List;
        var listTime = result.map((data) => data as String).toList();

        return Theater(
            cinemaName: snapshot.data()['cinema_title'] as String,
            cinemaTime: listTime);
      }).toList();

      return Right(listTheater);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
