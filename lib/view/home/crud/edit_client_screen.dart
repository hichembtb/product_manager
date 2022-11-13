import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_manager/core/constants/color/app_color.dart';
import 'package:product_manager/core/controllers/edit_client_controller.dart';
import 'package:product_manager/core/settings/size_config.dart';
import 'package:product_manager/core/widgets/custom_floating_button.dart';

class EditClientScrenn extends StatelessWidget {
  const EditClientScrenn({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().ini(context);
    EditClientController editClientController = Get.put(EditClientController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.kAppBarColor,
        title: Text(
            '${editClientController.name} ${editClientController.surname}'),
        actions: [
          IconButton(
            splashRadius: 1,
            onPressed: () {
              // see client profile
            },
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: SizeConfig.screenHeight! * 0.1,
          ),
          Expanded(
            flex: 1,
            child: ListView(
              children: [
                Text(
                  '${editClientController.credit} Da',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: SizeConfig.defaultSize! * 2.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight! * .04,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomFloatingButton(
                      onPressed: () {
                        print('add new payment');
                        editClientController.addPayment(context);
                      },
                      icon: Icons.payments_outlined,
                      fillColor: AppColor.kSplashColor.withOpacity(0.8),
                    ),
                    SizedBox(
                      width: SizeConfig.screenWidth! * .04,
                    ),
                    CustomFloatingButton(
                      onPressed: () {
                        print('add new delivery');
                      },
                      icon: Icons.delivery_dining_outlined,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      child: Card(
                        shape: const RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black, width: 1),
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(10, 10)),
                        ),
                        color: AppColor.kCardColor,
                        child: SizedBox(
                          height: SizeConfig.screenHeight! * .08,
                          child: ListTile(
                            leading: Icon(
                              index.isEven
                                  ? Icons.payments_outlined
                                  : Icons.delivery_dining_outlined,
                              // Icons.payments_outlined,
                              color: index.isEven
                                  ? AppColor.kAppBarColor.withOpacity(0.8)
                                  : AppColor.kAppBarColor,
                              size: SizeConfig.defaultSize! * 3,
                            ),
                            title: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '1500 Da',
                                  style: TextStyle(
                                    fontSize: SizeConfig.defaultSize! * 2,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  '22/08/2000',
                                  style: TextStyle(
                                    fontSize: SizeConfig.defaultSize! * 1.5,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            trailing: IconButton(
                              onPressed: () {
                                // see payment or delivery details
                                print('payment or delivery details ');
                              },
                              icon: const Padding(
                                padding: EdgeInsets.only(bottom: 5),
                                child: Icon(
                                  Icons.error_outline_outlined,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
