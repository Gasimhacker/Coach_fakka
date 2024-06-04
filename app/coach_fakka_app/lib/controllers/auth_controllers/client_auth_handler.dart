import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:coach_fakka_app/controllers/controllers.dart';
import 'package:coach_fakka_app/models/models.dart';

class ClientAuthHandler {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> signUpClient(ClientModel newClient, String password) async {
    String response = 'Something went wrong';
    try {
      if (newClient.email!.isNotEmpty &&
          newClient.name!.isNotEmpty &&
          newClient.coach_id!.isNotEmpty &&
          password.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: newClient.email!, password: password);

        ClientModel createdClient =
            await ClientApiHandler.createNewClient(newClient);

        await _firestore
            .collection('clients')
            .doc(cred.user!.uid)
            .set(createdClient.toJson());

        response = createdClient.id!;
      } else {
        response = 'Please fill all fields';
      }
    } catch (e) {
      response = e.toString();
    }

    return response;
  }

  Future<String> signInClient(String email, String password) async {
    String userUid = '';
    String response = '';
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);

        userUid = FirebaseAuth.instance.currentUser!.uid;

        print(userUid);
        var querySnapshot = await FirebaseFirestore.instance
            .collection('clients')
            .doc(userUid)
            .get();

        var userDocument = querySnapshot.data() as Map<String, dynamic>;

        bool isClient = await ClientApiHandler.isClient(userDocument['id']);
        if (isClient) {
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
