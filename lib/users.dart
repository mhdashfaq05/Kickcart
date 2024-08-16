import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kickcart_admin/feature/user_auth/repository/user_Repository.dart';

import 'colourconst.dart';
import 'feature/user_auth/controller/user_Controller.dart';
import 'imageconst.dart';
import 'main.dart';

class Users extends ConsumerStatefulWidget {
  const Users({super.key});

  @override
  ConsumerState<Users> createState() => _UsersState();
}

class _UsersState extends ConsumerState<Users> {
  deleteUser(String id) {
    ref.read(addUserRepositoryProvider).deleteUser(id);

  }
  List users = [
    {"name": "Mohammed Ashfaq P", "email": "mhdashfaq5588@gmail.com"},
    {"name": "Mashhoor", "email": "Mashhoor@gmail.com"},
    {"name": "Minhaj", "email": "minhaj3331@gmail.com"},
    {"name": "Ajmal", "email": "ajmal@gmail.com"},
    {"name": "Adil", "email": "adil@gmail.com"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.containerColour,
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(w * 0.02),
              child: ref.watch(streamDataProvider).when(
                data: (data) {



              return GridView.builder(
                itemCount: data.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: w * 0.02,
                  mainAxisSpacing: w * 0.02,
                  childAspectRatio: 4,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    height: h * 0.3,
                    width: w * 0.03,
                    decoration: BoxDecoration(
                      color: Colors.white30,
                      borderRadius: BorderRadius.circular(w * 0.01),

                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        SizedBox(
                          height: w * 0.15,
                          width: w * 0.25,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    data[index].name,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: w * 0.012,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    data[index].email,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: w * 0.012,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: w * 0.03,
                                width: w * 0.25,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      height: w * 0.03,
                                      width: w * 0.1,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(w * 0.02),
                                        // border: Border.all(color: ColorConst.brightPink)
                                      ),
                                      child: Center(
                                          child: Text(
                                        "Block",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700),
                                      )),
                                    ),
                                    Container(
                                      height: w * 0.03,
                                      width: w * 0.1,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(w * 0.02),

                                      ),
                                      child: Center(
                                        child: Text(
                                          "View",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                        onTap: () {
                                          showCupertinoModalPopup(
                                            context: context,
                                            builder: (context) {
                                              return CupertinoActionSheet(
                                                title: Text("Confirm Delete"),
                                                actions: [
                                                  CupertinoActionSheetAction(
                                                      onPressed: () {
                                                        deleteUser(
                                                          data[index].id
                                                        );
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text(
                                                        "Yes",
                                                        style: TextStyle(
                                                            color: Colors.red),
                                                      )),
                                                  CupertinoActionSheetAction(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text(
                                                        "No",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black),
                                                      ))
                                                ],
                                              );
                                            },
                                          );
                                        },
                                        child: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                          size: w * 0.02,
                                        ))
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );}, error: ( error, StackTrace ) =>Column(
                children: [
                  Text(error.toString()),
                  Text("================================================"),

                ],
              ), loading: () => Center(child: CircularProgressIndicator(),))
            ),
          )
        ],
      ),
    );
  }
}
