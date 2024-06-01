import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coach_fakka_app/models/client_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ClientAuthHandler {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> signUpClient(ClientModel newClient, String password) async {
    print('Bx0');
    String response = 'Something went wrong';
    try {
      if (newClient.email!.isNotEmpty &&
          newClient.name!.isNotEmpty &&
          newClient.coachId!.isNotEmpty &&
          password.isNotEmpty) {
        // create user
        // ignore: unused_local_variable
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: newClient.email!, password: password);
        print('Bx1');
        //Crete in database
        await _firestore
            .collection('client')
            .doc(cred.user!.uid)
            .set(newClient.toJson());
        print('Bx2');
        response = 'Customer created successfully';
      } else {
        response = 'Please fill all fields';
      }
    } catch (e) {
      print('Bx3');

      response = e.toString();
      print(response);
    }

    return response;
  }

  bool signInClientStatus = false;
  Future<ClientModel> signInClient(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        // sign in user
        // ignore: unused_local_variable
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        signInClientStatus = true;

        _firestore.collection('clients').doc().get().then((value) {
          print('');
        });
      } else {
        signInClientStatus = false;
      }
    } catch (e) {
      signInClientStatus = false;
    }
    throw Exception('Failed to sign in');
  }

  // bool signInCustomersStatus = false;
  // Future<String> signInCustomers(String email, String password) async {
  //   String _response = 'Something went wrong';

  //   try {
  //     if (email.isNotEmpty && password.isNotEmpty) {
  //       // sign in user
  //       // ignore: unused_local_variable
  //       await _auth.signInWithEmailAndPassword(
  //           email: email, password: password);
  //       _response = 'Signed in successfully';
  //       signInCustomersStatus = true;
  //     } else {
  //       signInCustomersStatus = false;
  //       _response = 'Please fill all fields';
  //     }
  //   } catch (e) {
  //     _response = e.toString();
  //   }

  //   return _response;
  // }
}

// _LoginCustomer() async {
//   setState(() {
//     _isLoading = true;
//   });
//   if (_formKey.currentState!.validate()) {
//     String _result =
//         await _authController.signInCustomers(email, password).whenComplete(() {
//       setState(() {
//         _isLoading = false;
//       });
//     });
//     if (_authController.signInCustomersStatus) {
//       return Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) {
//             return MainScreen();
//           },
//         ),
//       );
//     }
//     showSnack(context, _result);
//   } else {
//     setState(() {
//       _isLoading = false;
//     });
//     showSnack(context, 'Please fill all fields');
//   }
// }

// _signUpCustomer() async {
//     setState(() {
//       _isLoading = true;
//     });
//     if (_formKey.currentState!.validate()) {
//       await _authController
//           .signUpCustomers(email, fullName, phoneNumber, password, _image)
//           .whenComplete(() {
//         setState(() {
//           _formKey.currentState!.reset();
//           _isLoading = false;
//         });
//       });
//       return showSnack(
//           context, 'Congratulations, Account Created Successfully');
//     } else {
//       setState(() {
//         _isLoading = false;
//       });
//       showSnack(context, 'Please fill all fields');
//     }
//   }
