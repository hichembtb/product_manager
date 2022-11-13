import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_manager/core/widgets/custom_drawer.dart';
import 'package:product_manager/core/widgets/custom_floating_button.dart';
import '../../../core/constants/color/app_color.dart';
import '../../../core/controllers/client_screen_controller.dart';
import '../../../models/client_model.dart';

class ClientsScreen extends StatelessWidget {
  const ClientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ClientScreenController clientScreenController =
        Get.put(ClientScreenController());
    return Scaffold(
      drawer: const CustomDrawer(),
      floatingActionButton: CustomFloatingButton(
        onPressed: () {
          clientScreenController.navToAddClient();
        },
      ),
      appBar: AppBar(
        backgroundColor: AppColor.kAppBarColor,
        title: const Text(' clients'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              // search feature
            },
            icon: const Icon(
              Icons.search,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: GetBuilder<ClientScreenController>(
          builder: (controller) {
            return SafeArea(
              child: RefreshIndicator(
                onRefresh: clientScreenController.fetchClient,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ListView.builder(
                    itemCount: clientScreenController.clientInstance.length,
                    itemBuilder: (context, index) {
                      ClientModel client =
                          clientScreenController.clientInstance[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: GestureDetector(
                          onTap: () {
                            clientScreenController.navToEditClient(
                              client.name,
                              client.surname,
                              client.credit,
                            );
                          },
                          child: Card(
                            shape: const RoundedRectangleBorder(
                              side: BorderSide(color: Colors.white70, width: 1),
                              borderRadius: BorderRadius.horizontal(
                                  left: Radius.elliptical(10, 10)),
                            ),
                            color: AppColor.kCardColor,
                            child: ListTile(
                              trailing: Text('${client.credit}'),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(client.name),
                                  Text(client.surname),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
