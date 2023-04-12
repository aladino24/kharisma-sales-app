import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kharisma_sales_app/constants/apps_colors.dart';
import 'package:kharisma_sales_app/controllers/api/provinsi_controller.dart';
import 'package:kharisma_sales_app/widgets/main_header.dart';

class AddAddressPage extends StatelessWidget {
  AddAddressPage({super.key});

  final provinsiController = Get.put(ProvinsiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          MainHeader(
              iconBookmark: false, iconCart: false, iconNotification: false),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      child: Text(
                        "Tambah Alamat Pengiriman",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                      child: Form(
                          child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: Offset(0, 1), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            // label input
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 20, left: 20, top: 20),
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Nama Penerima",
                                  style: TextStyle(
                                      fontSize: 14, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
            
                            // input
                            Padding(
                              padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
                              child: Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                    hintText: "Masukkan nama",
                                    hintStyle: TextStyle(fontSize: 12),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 1)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 1)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 1)),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
            
                             Padding(
                              padding: const EdgeInsets.only(right: 20, left: 20),
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "No. Telepon",
                                  style: TextStyle(
                                      fontSize: 14, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
                              child: Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                    hintText: "Masukkan No Telepon",
                                    hintStyle: TextStyle(fontSize: 12),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 1)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 1)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 1)),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
            
                             Padding(
                              padding: const EdgeInsets.only(right: 20, left: 20),
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Alamat",
                                  style: TextStyle(
                                      fontSize: 14, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
                              child: Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                    hintText: "Masukkan Alamat",
                                    hintStyle: TextStyle(fontSize: 12),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 1)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 1)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 1)),
                                  ),
                                ),
                              ),
                            ),
            
                            Padding(
                              padding: const EdgeInsets.only(right: 20, left: 20),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Provinsi",
                                        style: TextStyle(
                                            fontSize: 14, fontWeight: FontWeight.bold),
                                      ),
                                      // dropdownform field
                                      Container(
                                        width: 150,
                                        padding: const EdgeInsets.only(top: 5),
                                        child: Obx(() => DropdownButtonFormField(
                                          isExpanded: true,
                                          // isDense: true,
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                            hintText: "Pilih Provinsi",
                                            hintStyle: TextStyle(fontSize: 14),
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(5),
                                                borderSide: BorderSide(
                                                    color: Colors.grey, width: 1)),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(5),
                                                borderSide: BorderSide(
                                                    color: Colors.grey, width: 1)),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(5),
                                                borderSide: BorderSide(
                                                    color: Colors.grey, width: 1)),
                                          ),
                                          // items: [
                                          //   DropdownMenuItem(
                                          //     child: Text("Jawa Barat"),
                                          //     value: "Jawa Barat",
                                          //   ),
                                          //   DropdownMenuItem(
                                          //     child: Text("Jawa Tengah"),
                                          //     value: "Jawa Tengah",
                                          //   ),
                                          //   DropdownMenuItem(
                                          //     child: Text("Jawa Timur"),
                                          //     value: "Jawa Timur",
                                          //   ),
                                          // ],
                                          items: List.generate(
                                            provinsiController.listProvinsi.length, 
                                            (index) => DropdownMenuItem(
                                              child: Text(
                                                provinsiController.listProvinsi[index].name,
                                                style: TextStyle(
                                                  fontSize: 12
                                                ),
                                              ),
                                              value: provinsiController.listProvinsi[index].id,
                                            )
                                          ),
                                          onChanged: (value) {},
                                        ),)
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Kota",
                                        style: TextStyle(
                                            fontSize: 14, fontWeight: FontWeight.bold),
                                      ),
                                      // dropdownform field
                                      Container(
                                        width: 150,
                                        padding: const EdgeInsets.only(top: 5),
                                        child: DropdownButtonFormField(
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                            hintText: "Pilih Kota",
                                            hintStyle: TextStyle(fontSize: 12),
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(5),
                                                borderSide: BorderSide(
                                                    color: Colors.grey, width: 1)),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(5),
                                                borderSide: BorderSide(
                                                    color: Colors.grey, width: 1)),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(5),
                                                borderSide: BorderSide(
                                                    color: Colors.grey, width: 1)),
                                          ),
                                          items: [
                                            DropdownMenuItem(
                                              child: Text("Bandung"),
                                              value: "Bandung",
                                            ),
                                            DropdownMenuItem(
                                              child: Text("Bekasi"),
                                              value: "Bekasi",
                                            ),
                                            DropdownMenuItem(
                                              child: Text("Bogor"),
                                              value: "Bogor",
                                            ),
                                          ],
                                          onChanged: (value) {},
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
            
                            SizedBox(height: 10),
            
                            Padding(
                              padding: const EdgeInsets.only(right: 20, left: 20),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Kecamatan",
                                        style: TextStyle(
                                            fontSize: 14, fontWeight: FontWeight.bold),
                                      ),
                                      // dropdownform field
                                      Container(
                                        width: 150,
                                        padding: const EdgeInsets.only(top: 5),
                                        child: DropdownButtonFormField(
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                            hintText: "Pilih Kecamatan",
                                            hintStyle: TextStyle(fontSize: 12),
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(5),
                                                borderSide: BorderSide(
                                                    color: Colors.grey, width: 1)),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(5),
                                                borderSide: BorderSide(
                                                    color: Colors.grey, width: 1)),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(5),
                                                borderSide: BorderSide(
                                                    color: Colors.grey, width: 1)),
                                          ),
                                          items: [
                                            DropdownMenuItem(
                                              child: Text("Jawa Barat"),
                                              value: "Jawa Barat",
                                            ),
                                            DropdownMenuItem(
                                              child: Text("Jawa Tengah"),
                                              value: "Jawa Tengah",
                                            ),
                                            DropdownMenuItem(
                                              child: Text("Jawa Timur"),
                                              value: "Jawa Timur",
                                            ),
                                          ],
                                          onChanged: (value) {},
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Kelurahan",
                                        style: TextStyle(
                                            fontSize: 14, fontWeight: FontWeight.bold),
                                      ),
                                      // dropdownform field
                                      Container(
                                        width: 150,
                                        padding: const EdgeInsets.only(top: 5),
                                        child: DropdownButtonFormField(
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                            hintText: "Pilih Kelurahan",
                                            hintStyle: TextStyle(fontSize: 12),
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(5),
                                                borderSide: BorderSide(
                                                    color: Colors.grey, width: 1)),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(5),
                                                borderSide: BorderSide(
                                                    color: Colors.grey, width: 1)),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(5),
                                                borderSide: BorderSide(
                                                    color: Colors.grey, width: 1)),
                                          ),
                                          items: [
                                            DropdownMenuItem(
                                              child: Text("Bandung"),
                                              value: "Bandung",
                                            ),
                                            DropdownMenuItem(
                                              child: Text("Bekasi"),
                                              value: "Bekasi",
                                            ),
                                            DropdownMenuItem(
                                              child: Text("Bogor"),
                                              value: "Bogor",
                                            ),
                                          ],
                                          onChanged: (value) {},
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
            
                            SizedBox(height: 10),
            
                            Padding(
                              padding: const EdgeInsets.only(right: 20, left: 20),
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Kode Pos",
                                  style: TextStyle(
                                      fontSize: 14, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
                              child: Container(
                                margin: EdgeInsets.only(bottom: 15),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                    hintText: "Masukkan Kode Pos",
                                    hintStyle: TextStyle(fontSize: 12),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 1)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 1)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 1)),
                                  ),
                                ),
                              ),
                            ),
                             Padding(
                                 padding: const EdgeInsets.only(right: 20, left: 20),
                               child: Container(
                                width: Get.width,
                                 child: ElevatedButton(
                                  child: Text(
                                    "Submit"
                                  ),
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(AppsColors.loginColorPrimary),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      )
                                    )
                                  ),
                                  onPressed: (){}, 
                                                       ),
                               ),
                             )
                          ],
                        ),
                      )
                     ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
