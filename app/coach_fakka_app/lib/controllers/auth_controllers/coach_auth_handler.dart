import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:coach_fakka_app/controllers/controllers.dart';
import 'package:coach_fakka_app/models/models.dart';

class CoachAuthHandler {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> signUpCoach(CoachModel newCoach, String password) async {
    String response = 'Something went wrong';
    try {
      if (newCoach.email!.isNotEmpty &&
          newCoach.name!.isNotEmpty &&
          password.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: newCoach.email!, password: password);

        CoachModel createdCoach =
            await CoachApiHandler.createNewCoach(newCoach);

        await _firestore
            .collection('coaches')
            .doc(cred.user!.uid)
            .set(createdCoach.toJson());

        response = createdCoach.id!;
      } else {
        response = 'Please fill all fields';
      }
    } catch (e) {
      response = e.toString();
    }
    return response;
  }

  Future<String> signInCoach(String email, String password) async {
    String userUid = '';
    String response = '';
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);

        userUid = FirebaseAuth.instance.currentUser!.uid;

        print(userUid);
        var querySnapshot = await FirebaseFirestore.instance
            .collection('coaches')
            .doc(userUid)
            .get();

        var userDocument = querySnapshot.data() as Map<String, dynamic>;

        bool isCoach = await CoachApiHandler.isCoach(userDocument['id']);
        if (isCoach) {
          response = userDocument['id'];
        } else {
          response = 'ERROR 2';
        }

        return response;
      } else {
        return 'ERROR 1';
      }
    } catch (e) {
      return 'ERROR 3';
    }
  }
}
