import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class AzureFirebaseUser {
  AzureFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

AzureFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<AzureFirebaseUser> azureFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<AzureFirebaseUser>(
      (user) {
        currentUser = AzureFirebaseUser(user);
        return currentUser!;
      },
    );
