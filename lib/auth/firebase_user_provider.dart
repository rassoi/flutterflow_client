import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class RassoiFirebaseUser {
  RassoiFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

RassoiFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<RassoiFirebaseUser> rassoiFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<RassoiFirebaseUser>(
      (user) {
        currentUser = RassoiFirebaseUser(user);
        return currentUser!;
      },
    );
