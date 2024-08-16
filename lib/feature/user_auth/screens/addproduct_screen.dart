
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kickcart_admin/model/addproduct_model.dart';

import '../../../colourconst.dart';
import '../../../main.dart';
import '../controller/addproduct_Controller.dart';

class categories_page extends ConsumerStatefulWidget {
  const categories_page({super.key});

  @override
  ConsumerState<categories_page> createState() => _categories_pageState();
}

class _categories_pageState extends ConsumerState<categories_page> {
  TextEditingController category = TextEditingController();
  TextEditingController price = TextEditingController();

  deleteProduct(AddProductModel categorymodel){
    ref.watch(CategoriesControllerProvider).deleteProduct(categorymodel);
  }

  addingAdmin() {
    AddProductModel Admins = AddProductModel(
      image: coverImage.toString(),

      id: "",
      delete: false,
     // price:double.parse(),
      category: '',
      brand: '',
      price: double.parse(price.text),
    );
    ref.watch(CategoriesControllerProvider).addItem(Admins);
  }

  PlatformFile? pickFile;
  UploadTask? uploadTask;
  String? coverImage;
  bool value = false;

  Future selectFileToMessage(String name) async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    pickFile = result.files.first;

    // String? ext = pickFile?.name?.split('.')?.last;
    final fileBytes = result.files.first.bytes;

    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Loading......")));
    uploadFileToFireBase(name, fileBytes);
    setState(() {});
  }
  Future uploadFileToFireBase(String name, fileBytes) async {
    print("fggghh");
    print(fileBytes);
    uploadTask = FirebaseStorage.instance
        .ref('Categories/${DateTime.now().toString()}-$name')
        .putData(fileBytes, SettableMetadata(contentType: 'image/jpeg'));
    final snapshot = await uploadTask?.whenComplete(() {});
    coverImage = (await snapshot?.ref.getDownloadURL())!;
    print("not");
    print(BoxFit.cover);
    // ignore: use_build_context_synchronously
    // showUploadMessage(context, '$name Uploaded Successfully...');
    await Future.delayed(const Duration(seconds: 2));
    // ignore: use_build_context_synchronously
    // ScaffoldMessenger.of(context).clearSnackBars();
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child:
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Center(
                child: value == true
                    ? Container(
                  height: h * 0.45,
                  width: w * 0.15,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                          coverImage.toString(),
                        ),
                        fit: BoxFit.fill),
                    border: Border.all(
                        width: w * 0.0015, color: ColorConst.containerColour),
                    borderRadius: BorderRadius.circular(w * 0.02),
                  ),
                )
                    : Container(
                  height: h * 0.45,
                  width: w * 0.15,
                  decoration: BoxDecoration(
                    color: ColorConst.containerColour,
                    borderRadius: BorderRadius.circular(w*0.03),
                    border: Border.all(
                      color: ColorConst.home,
                    ),
                  ),

                  child: Icon(Icons.image),
                ),
              ),
              Container(
                  height: h * 0.5,
                  width: w * 0.3,
                  // color: ColorConst.brightPink,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          value = true;
                          selectFileToMessage("Burger Crown");
                        },
                        child: Container(
                          height: h * 0.07,
                          width: w * 0.1,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: ColorConst.home
                              ),
                              color: ColorConst.containerColour,
                              borderRadius: BorderRadius.circular(w * 0.03)),
                          child: Center(
                            child: Text(
                              "Add",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: w * 0.013),
                            ),
                          ),
                        ),
                      ),
                      TextFormField(
                          controller: category,
                          textCapitalization: TextCapitalization.sentences,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          style: TextStyle(
                              fontSize: w * 0.015, fontWeight: FontWeight.w500),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: ColorConst. home,
                            labelText: "Category",
                            labelStyle: TextStyle(
                                fontSize: w * 0.015,
                                fontWeight: FontWeight.w700,
                                color:  Colors.white),
                            // hintText: "Please enter your name",
                            // hintStyle: TextStyle(
                            //   fontSize: w * 0.015,
                            //   fontWeight: FontWeight.w500,
                            // ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: ColorConst.home,
                                ),
                                borderRadius: BorderRadius.circular(w * 0.01)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color:  ColorConst.home,
                                ),
                                borderRadius: BorderRadius.circular(w * 0.01)),
                          )),
                      TextFormField(
                          controller: price,
                          textCapitalization: TextCapitalization.sentences,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          style: TextStyle(
                              fontSize: w * 0.015, fontWeight: FontWeight.w500),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: ColorConst. home,
                            labelText: "price",
                            labelStyle: TextStyle(
                                fontSize: w * 0.015,
                                fontWeight: FontWeight.w700,
                                color:  Colors.white),
                            // hintText: "Please enter your name",
                            // hintStyle: TextStyle(
                            //   fontSize: w * 0.015,
                            //   fontWeight: FontWeight.w500,
                            // ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: ColorConst.home,
                                ),
                                borderRadius: BorderRadius.circular(w * 0.01)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color:  ColorConst.home,
                                ),
                                borderRadius: BorderRadius.circular(w * 0.01)),
                          )),
                      InkWell(
                        onTap: () {
                          addingAdmin();
                          category.clear();
                          // add.add(webimage);
                        },
                        child: Container(
                          height: h * 0.07,
                          width: w * 0.1,
                          decoration: BoxDecoration( border: Border.all(
                              color: ColorConst.home
                          ),
                            color:  ColorConst.containerColour,
                            borderRadius: BorderRadius.circular(w * 0.03),
                          ),
                          child: Center(
                            child: Text(
                              "Uploads",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: w * 0.013),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
              ref.watch(StreamDataProvider).when(
                data: (data) {
                  return Container(
                      height: h * 1,
                      // color: ColorConst.brightPink,
                      child: GridView.builder(
                        itemCount: data.length,
                        gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: w * 0.02,
                          mainAxisSpacing: w * 0.02,
                          childAspectRatio: 1.5,
                        ),
                        itemBuilder: (context, index) {
                          return Column(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: h * 0.3,
                                width: w * 0.25,
                                decoration: BoxDecoration(
                                    color: ColorConst.containerColour,
                                    image: DecorationImage(
                                        image:
                                        NetworkImage(data[index].image),
                                        fit: BoxFit.fill),
                                    borderRadius:
                                    BorderRadius.circular(w * 0.01)),
                                // child: Image.memory(add[index],fit: BoxFit.fill,),
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    data[index].categories,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: w * 0.02),
                                  ),
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: ColorConst.home,
                                        child: Icon(Icons.edit),
                                      ),
                                      SizedBox(
                                        width: w * 0.02,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          showCupertinoModalPopup(
                                            context: context,
                                            builder: (context) {
                                              return CupertinoActionSheet(
                                                title:
                                                Text("Confirm Delete"),
                                                actions: [
                                                  CupertinoActionSheetAction(
                                                      onPressed: () {
                                                        deleteProduct(data[index]);
                                                        Navigator.pop(
                                                            context);
                                                      },
                                                      child: Text(
                                                        "Yes",
                                                        style: TextStyle(
                                                            color:
                                                            Colors.red),
                                                      )),
                                                  CupertinoActionSheetAction(
                                                      onPressed: () {
                                                        Navigator.pop(
                                                            context);
                                                      },
                                                      child: Text(
                                                        "No",
                                                        style: TextStyle(
                                                            color:Colors.black),
                                                      ))
                                                ],
                                              );
                                            },
                                          );
                                        },
                                        child: CircleAvatar(
                                          backgroundColor:
                                          ColorConst.containerColour,
                                          child: Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          );
                        },
                      ));
                },
                error: (error, stackTrace) => Text(error.toString()),
                loading: () => const CircularProgressIndicator(),
              )
            ])));
  }
}