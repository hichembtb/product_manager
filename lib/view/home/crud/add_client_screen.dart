import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_manager/core/constants/images/app_images.dart';
import 'package:product_manager/core/controllers/add_client_controller.dart';
import 'package:product_manager/core/settings/size_config.dart';
import 'package:product_manager/core/widgets/custom_text_field.dart';
import '../../../core/constants/color/app_color.dart';

class AddClientScreen extends StatelessWidget {
  const AddClientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().ini(context);
    AddClientController addClientController = Get.put(AddClientController());
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: SizeConfig.screenHeight! * .055,
        backgroundColor: AppColor.kAppBarColor,
        title: const Text("Add Client"),
        actions: [
          IconButton(
            onPressed: () {
              // add new client funct
              addClientController.addClient(context);
            },
            icon: const Icon(
              Icons.add_box_outlined,
            ),
          ),
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: GetBuilder<AddClientController>(
            init: AddClientController(),
            builder: ((controller) {
              return Form(
                key: controller.formstate,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomTextField(
                      hintText: 'n a m e',
                      prefixIcon: Icons.person,
                      obscureText: false,
                      onSaved: (value) {
                        addClientController.name = value;
                      },
                      validator: (value) {
                        if (value!.length > 20) {
                          return 'too long';
                        }
                        if (value.length < 2) {
                          return 'too short';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight! * .024,
                    ),
                    CustomTextField(
                      hintText: 's u r n a m e',
                      prefixIcon: Icons.family_restroom,
                      obscureText: false,
                      onSaved: (value) {
                        controller.surname = value;
                      },
                      validator: (value) {
                        if (value!.length > 20) {
                          return 'too long';
                        }
                        if (value.length < 2) {
                          return 'too short';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight! * .024,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.screenWidth! * .25),
                      child: Card(
                        color: AppColor.kCardColor,
                        child: ListTile(
                          title: Text(
                            '${controller.totalprice}',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              SizedBox(
                                width: SizeConfig.screenWidth! * .024,
                              ),
                              SizedBox(
                                height: SizeConfig.screenHeight! * 0.30,
                                width: SizeConfig.screenWidth! * 0.5,
                                child: Card(
                                  elevation: 5,
                                  semanticContainer: true,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          color: AppColor.kWhiteColor),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          AppColor.kSplashColor,
                                          AppColor.kFieldFillColor,
                                        ],
                                        begin: FractionalOffset(0.0, 0.0),
                                        end: FractionalOffset(1.0, 0.0),
                                        stops: [0.0, 1.0],
                                        tileMode: TileMode.mirror,
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: AppColor.kWhiteColor,
                                            ),
                                          ),
                                          child: Image.asset(
                                            kBaco,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        SizedBox(
                                          height:
                                              SizeConfig.screenHeight! * .03,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              IconButton(
                                                onPressed: () {
                                                  controller.removeQty();
                                                },
                                                icon: const Icon(
                                                  Icons.remove,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 5),
                                                child: Text(
                                                  '${controller.quantity}',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: SizeConfig
                                                            .defaultSize! *
                                                        2,
                                                  ),
                                                ),
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  controller.addQty();
                                                },
                                                icon: const Icon(
                                                  Icons.add,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    )
                  ],
                ),
              );
            }),
          )),
    );
  }
}
