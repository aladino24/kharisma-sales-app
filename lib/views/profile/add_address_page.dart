import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kharisma_sales_app/constants/apps_colors.dart';
import 'package:kharisma_sales_app/controllers/api/address/alamat_kirim_controller.dart';
import 'package:kharisma_sales_app/controllers/api/address/kecamatan_controller.dart';
import 'package:kharisma_sales_app/controllers/api/address/kelurahan_controller.dart';
import 'package:kharisma_sales_app/controllers/api/address/kota_controller.dart';
import 'package:kharisma_sales_app/controllers/api/address/provinsi_controller.dart';
import 'package:kharisma_sales_app/widgets/main_header.dart';

class AddAddressPage extends StatelessWidget {
  AddAddressPage({super.key});

  final provinsiController = Get.put(ProvinsiController());
  final kotaController = Get.put(KotaController());
  final kecamatanController = Get.put(KecamatanController());
  final kelurahanController = Get.put(KelurahanController());


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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      child: Text(
                        "Tambah Alamat Pengiriman",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
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
                              offset:
                                  Offset(0, 1), // changes position of shadow
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
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),

                            // input
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 5),
                              child: Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 10),
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
                              padding:
                                  const EdgeInsets.only(right: 20, left: 20),
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "No. Telepon",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 5),
                              child: Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 10),
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
                              padding:
                                  const EdgeInsets.only(right: 20, left: 20),
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Alamat",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 5),
                              child: Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 10),
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
                              padding:
                                  const EdgeInsets.only(right: 20, left: 20),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Provinsi",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      // dropdownform field
                                      Container(
                                          width: 150,
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Obx(
                                            () => DropdownButtonFormField(
                                              isExpanded: true,
                                              // isDense: true,
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                hintText: provinsiController.listProvinsi.isEmpty
                                                    ? "Loading..."
                                                    : "Pilih Provinsi",
                                                hintStyle:
                                                    TextStyle(fontSize: 14),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    borderSide: BorderSide(
                                                        color: Colors.grey,
                                                        width: 1)),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        borderSide: BorderSide(
                                                            color: Colors.grey,
                                                            width: 1)),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        borderSide: BorderSide(
                                                            color: Colors.grey,
                                                            width: 1)),
                                              ),
                                              items: List.generate(
                                                  provinsiController.listProvinsi.length,
                                                  (index) => DropdownMenuItem(
                                                        child: Text(
                                                          provinsiController.listProvinsi[index].name,
                                                          style: TextStyle(
                                                              fontSize: 12),
                                                        ),
                                                        value: provinsiController.listProvinsi[index].id,
                                                      )),
                                              onChanged: (value) {
                                                if (value != null) {
                                                  kotaController.clearListKota();
                                                  kotaController.fetchKotaByProvinsiId(value);
                                                  kotaController.selectedKotaId.value = null;
                                                }
                                                
                                              },
                                            
                                            ),
                                          )),
                                    ],
                                  ),
                                  SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Kota",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      // dropdownform field
                                      Container(
                                          width: 150,
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Obx(
                                            () => DropdownButtonFormField(
                                              isExpanded: true,
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                hintText: kotaController.isLoading.value
                                                    ? "Loading..."
                                                    : "Pilih Kota",
                                                hintStyle:
                                                    TextStyle(fontSize: 12),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    borderSide: BorderSide(
                                                        color: Colors.grey,
                                                        width: 1)),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        borderSide: BorderSide(
                                                            color: Colors.grey,
                                                            width: 1)),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        borderSide: BorderSide(
                                                            color: Colors.grey,
                                                            width: 1)),
                                              ),
                                              items: kotaController.listKota.isNotEmpty
                                                  ? List.generate(
                                                      kotaController.listKota.length,
                                                      (index) =>
                                                          DropdownMenuItem(
                                                            child: Text(
                                                              kotaController.listKota[index].name,
                                                              style: TextStyle(
                                                                  fontSize: 12),
                                                            ),
                                                            value: kotaController.listKota[index].id,
                                                          ))
                                                  : null,
                                              onChanged: (value) {
                                                if(value != null){
                                                  kecamatanController.clearListKecamatan();
                                                  kecamatanController.fetchKecamatanByKotaId(value);
                                                  kecamatanController.selectedKecamatanId.value = null;
                                                }
                                              },
                                              value: kotaController.selectedKotaId.value != null ? kotaController.selectedKotaId.value : null,
                                            ),
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: 10),

                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 20, left: 20),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Kecamatan",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      // dropdownform field
                                      Container(
                                        width: 150,
                                        padding: const EdgeInsets.only(top: 5),
                                        child: Obx(() => DropdownButtonFormField(
                                          isExpanded: true,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 10),
                                            hintText: kecamatanController.isLoading.value ? "Loading..." : "Pilih Kecamatan",
                                            hintStyle: TextStyle(fontSize: 12),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                borderSide: BorderSide(
                                                    color: Colors.grey,
                                                    width: 1)),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                borderSide: BorderSide(
                                                    color: Colors.grey,
                                                    width: 1)),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                borderSide: BorderSide(
                                                    color: Colors.grey,
                                                    width: 1)),
                                          ),
                                          items: kecamatanController.listKecamatan.isNotEmpty ? List.generate(
                                            kecamatanController.listKecamatan.length, 
                                            (index) => DropdownMenuItem(
                                                            child: Text(
                                                              kecamatanController.listKecamatan[index].name,
                                                              style: TextStyle(
                                                                  fontSize: 12),
                                                            ),
                                                            value: kecamatanController.listKecamatan[index].id,
                                                          )
                                          ) : null,
                                          onChanged: (value) {
                                             if(value != null){
                                                  kelurahanController.clearListKelurahan();
                                                  kelurahanController.fetchKelurahanByKecamatanId(value);
                                                  kelurahanController.selectedKelurahanId.value = null;
                                                }
                                          },
                                          value: kecamatanController.selectedKecamatanId.value != null ? kecamatanController.selectedKecamatanId.value : null,
                                        )),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Kelurahan",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      // dropdownform field
                                      Container(
                                        width: 150,
                                        padding: const EdgeInsets.only(top: 5),
                                        child: Obx(() => DropdownButtonFormField(
                                          decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 10),
                                            hintText: kelurahanController.isLoading.value ? "Loading..." : "Pilih Kelurahan",
                                            hintStyle: TextStyle(fontSize: 12),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                borderSide: BorderSide(
                                                    color: Colors.grey,
                                                    width: 1)),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                borderSide: BorderSide(
                                                    color: Colors.grey,
                                                    width: 1)),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                borderSide: BorderSide(
                                                    color: Colors.grey,
                                                    width: 1)),
                                          ),
                                          items: kelurahanController.listKelurahan.isNotEmpty ? List.generate(
                                            kelurahanController.listKelurahan.length, 
                                            (index) => DropdownMenuItem(
                                                            child: Text(
                                                              kelurahanController.listKelurahan[index].name,
                                                              style: TextStyle(
                                                                  fontSize: 12),
                                                            ),
                                                            value: kelurahanController.listKelurahan[index].id,
                                                          )
                                          ) : null,
                                          onChanged: (value) {

                                          },
                                          value: kelurahanController.selectedKelurahanId.value != null ? kelurahanController.selectedKelurahanId.value : null,
                                        ),)
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: 10),

                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 20, left: 20),
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Kode Pos",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 5),
                              child: Container(
                                margin: EdgeInsets.only(bottom: 15),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 10),
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
                              padding:
                                  const EdgeInsets.only(right: 20, left: 20),
                              child: Container(
                                width: Get.width,
                                child: ElevatedButton(
                                  child: Text("Submit"),
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              AppsColors.loginColorPrimary),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ))),
                                  onPressed: () {},
                                ),
                              ),
                            )
                          ],
                        ),
                      )),
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
