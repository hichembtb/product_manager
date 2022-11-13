import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../../models/client_model.dart';
import '../constants/routes/app_routes.dart';

class ClientScreenController extends GetxController {
  // ! Navigation Function
  navToAddClient() {
    Get.toNamed(AppRoute.addclient);
  }

  navToEditClient(
    String name,
    String surname,
    double credit,
  ) {
    Get.toNamed(AppRoute.editclient, arguments: {
      'name': name,
      'surname': surname,
      'credit': credit,
    });
  }

  // ? Fetch Client Function
  CollectionReference clientsRef =
      FirebaseFirestore.instance.collection('client');
  List<ClientModel> clientInstance = [];
  List<QueryDocumentSnapshot<Object?>> clientDocs = [];
  User? currentUser = FirebaseAuth.instance.currentUser;

  Future fetchClient() async {
    clientInstance.clear();
    QuerySnapshot<Object?> clientQuery =
        await clientsRef.where('refId', isEqualTo: currentUser!.uid).get();
    clientDocs = clientQuery.docs;
    for (QueryDocumentSnapshot<Object?> client in clientDocs) {
      Map<String, dynamic> clientData = client.data() as Map<String, dynamic>;
      clientInstance.add(ClientModel.fromMap(clientData));
      update();
    }
  }

  @override
  void onInit() {
    fetchClient();
    super.onInit();
  }
}
