part of 'services.dart';

class MovixTransactionServices {
  static CollectionReference _transactionCollection =
      FirebaseFirestore.instance.collection('transactions');

  static Future<bool> saveTransaction(MovixTransaction transaction) async {
    try {
      await _transactionCollection.doc().set({
        'user_id': transaction.userId,
        'title': transaction.title,
        'subtitle': transaction.subtitle,
        'amount': -transaction.amount,
        'time': transaction.time.millisecondsSinceEpoch,
        'picture': transaction.picture
      });

      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  static Future<Either<String, List<MovixTransaction>>> getTransactions(
      String userId) async {
    try {
      QuerySnapshot snapshot = await _transactionCollection.get();

      var documents = snapshot.docs
          .where((document) => document.data()['user_id'] == userId);

      var result = documents
          .map((document) => MovixTransaction(
                userId: document.data()['user_id'],
                title: document.data()['title'],
                subtitle: document.data()['subtitle'],
                amount: document.data()['amount'],
                time: DateTime.fromMillisecondsSinceEpoch(
                    document.data()['time']),
                picture: document.data()['picture'],
              ))
          .toList();

      // for (var document in documents.toList()) {
      //   MovixTransaction transaction = MovixTransaction(
      //     userId: document.data()['user_id'],
      //     title: document.data()['title'],
      //     subtitle: document.data()['subtitle'],
      //     amount: document.data()['amount'],
      //     time: DateTime.fromMillisecondsSinceEpoch(document.data()['time']),
      //     picture: document.data()['picture'],
      //   );

      return Right(result);
    } catch (e) {
      debugPrint(e.toString());
      return Left(e.toString());
    }
  }
}
