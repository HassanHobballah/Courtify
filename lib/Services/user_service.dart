import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<User?> get userStream => _auth.authStateChanges();

  Future<Map<String, dynamic>?> getUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      try {
        DocumentSnapshot userData = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();
        if (userData.exists && userData.data() != null) {
          return userData.data() as Map<String, dynamic>;
        } else {
          print("User data not found in Firestore for user ID: ${user.uid}");
// Handle the situation where the user data does not exist.
        }
      } catch (e) {
        print("Error fetching user data: $e");
// Handle any errors that occur during the fetch.
      }
    } else {
      print("No user logged in");
// Handle the situation where no user is logged in.
    }
    return null; // Return null if there's no user or an error occurred.
  }

  Future<void> updateUserProfile(Map<String, dynamic> dataToUpdate) async {
    User? user = _auth.currentUser;
    if (user != null) {
      await _firestore.collection('users').doc(user.uid).update(dataToUpdate);
    }
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
