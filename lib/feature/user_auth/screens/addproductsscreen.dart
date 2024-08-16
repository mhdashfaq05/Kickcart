


import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../main.dart';
import '../../../colourconst.dart';

class AddProduct_page extends StatefulWidget {
  const AddProduct_page({super.key});

  @override
  State<AddProduct_page> createState() => _AddProduct_pageState();
}

class _AddProduct_pageState extends State<AddProduct_page> {
  TextEditingController category = TextEditingController();
  List c=[
    "NIKE",
    "JORDAN",
    "FILA",
    "PUMA"
  ];
  String? dropDownValue;
  List add = [];

  var image;
  Uint8List webimage = Uint8List(8);
  pickimage() async {
    if (kIsWeb) {
      final pickedFile = await ImagePicker.platform
          .getImageFromSource(source: ImageSource.gallery);

      if (mounted) {
        var select = await pickedFile!.readAsBytes();
        setState(() {
          webimage = select;
          image = 'a';
        });
      }
    }
  }

  UploadTask? uploadTask;

  // Future uploadFileToFireBase(String name, fileBytes) async {
  //   uploadTask = FirebaseStorage.instance
  //       .ref('banner/${DateTime.now().toString()}-$name')
  //       .putData(fileBytes,SettableMetadata(
  //       contentType: 'image/jpeg'
  //   ));
  //   final snapshot = await uploadTask?.whenComplete(() {});
  //   urlDownlod = (await snapshot?.ref?.getDownloadURL())!;
  //
  //   // ignore: use_build_context_synchronously
  //   // showUploadMessage(context, '$name Uploaded Successfully...');
  //   await Future.delayed(const Duration(seconds: 2));
  //   // ignore: use_build_context_synchronously
  //   // ScaffoldMessenger.of(context).clearSnackBars();
  //   setState(() {});
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            image == null
                ? Center(
              child: Container(
                height: h * 0.35,
                width: w * 0.2,
                child: Center(
                    child: InkWell(
                        onTap: () {
                          pickimage();

                          setState(() {});
                        },
                        child: Icon(
                          Icons.image,
                          size: w * 0.04,
                          color: Colors.white,
                        ))),
                decoration: BoxDecoration(
                  color: ColorConst.containerColour,
                  borderRadius: BorderRadius.circular(w * 0.02),
                ),
              ),
            )
                : Center(
              child: Container(
                height: h * 0.35,
                width: w * 0.2,
                // child: Image.memory(webimage,fit: BoxFit.fill,),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: MemoryImage(webimage, scale: 2),
                      fit: BoxFit.fill),
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(w * 0.02),
                ),
              ),
            ),
            Container(
                height: h * 0.4,
                width: w * 0.3,
                color: ColorConst.home,
                // color: ColorConst.brightPink,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        pickimage();

                        setState(() {});
                      },
                      child: Container(
                        height: h * 0.07,
                        width: w * 0.1,
                        decoration: BoxDecoration(
                            color: ColorConst.containerColour,
                            borderRadius: BorderRadius.circular(w * 0.03)),
                        child: Center(
                          child: Text(
                            "Add",
                            style: TextStyle(
                                color: Colors.white,
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
                          labelText: "Category",
                          labelStyle: TextStyle(
                              fontSize: w * 0.015,
                              fontWeight: FontWeight.w700,
                              color: Colors.black.withOpacity(0.5)),
                          // hintText: "Please enter your name",
                          // hintStyle: TextStyle(
                          //   fontSize: w * 0.015,
                          //   fontWeight: FontWeight.w500,
                          // ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: ColorConst.containerColour,
                              ),
                              borderRadius: BorderRadius.circular(w * 0.01)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: ColorConst.containerColour,
                              ),
                              borderRadius: BorderRadius.circular(w * 0.01)),
                        )),
                    DropdownButton(
                     style: TextStyle(color: Colors.black),
                      value:dropDownValue ,
                      hint: Text("Brand",style: TextStyle(color: Colors.white),),

                      items: c.map((item){
                        return DropdownMenuItem(
                          value: item,
                          child: Text(item,style: TextStyle(color: Colors.black),),);
                      }).toList(),
                      onChanged: (value) {
                        dropDownValue=value.toString();
                        setState(() {

                        });


                      },),

                    InkWell(
                      onTap: () {
                        add.add(webimage);
                        setState(() {});
                      },
                      child: Container(
                        height: h * 0.07,
                        width: w * 0.1,
                        decoration: BoxDecoration(
                          color: ColorConst.containerColour,
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
            Container(
              height: h * 1,
              // color: ColorConst.brightPink,
              child: GridView.builder(
                itemCount: add.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: w * 0.02,
                  mainAxisSpacing: w * 0.02,
                  childAspectRatio: 1.5,
                ),
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: h * 0.3,
                        width: w * 0.25,
                        decoration: BoxDecoration(
                            color: ColorConst.containerColour,
                            image: DecorationImage(
                                image: MemoryImage(add[index]),
                                fit: BoxFit.fill),
                            borderRadius: BorderRadius.circular(w * 0.01)),
                        // child: Image.memory(add[index],fit: BoxFit.fill,),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            category.text,
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: w * 0.02),
                          ),
                          Text(
                            "",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: w * 0.02),
                          ),
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.grey,
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
                                        title: Text("Confirm Delete"),
                                        actions: [
                                          CupertinoActionSheetAction(
                                              onPressed: () {
                                                add.remove(add[index]);
                                                setState(() {});
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
                                                    color: Colors.black),
                                              ))
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: CircleAvatar(
                                  backgroundColor: Colors.grey,
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
