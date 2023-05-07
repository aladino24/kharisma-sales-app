import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kharisma_sales_app/constants/apps_colors.dart';
import 'package:kharisma_sales_app/controllers/api/address/alamat_kirim_controller.dart';
import 'package:kharisma_sales_app/controllers/api/address/kecamatan_controller.dart';
import 'package:kharisma_sales_app/controllers/api/address/kelurahan_controller.dart';
import 'package:kharisma_sales_app/controllers/api/address/kota_controller.dart';
import 'package:kharisma_sales_app/controllers/api/address/provinsi_controller.dart';
import 'package:kharisma_sales_app/models/kecamatan.dart';
import 'package:kharisma_sales_app/models/kota.dart';
import 'package:kharisma_sales_app/models/provinsi.dart';
import 'package:kharisma_sales_app/widgets/main_header.dart';

class EditAddressPage extends StatelessWidget {
  EditAddressPage({super.key});

  final provinsiController = Get.put(ProvinsiController());
  final kotaController = Get.put(KotaController());
  final kecamatanController = Get.put(KecamatanController());
  final kelurahanController = Get.put(KelurahanController());

  final alamatKirimController = Get.find<AlamatKirimController>();
  final GlobalKey<FormState> _formKey = new GlobalKey();
  

  @override
  Widget build(BuildContext context) {
    final data = Get.arguments['data'];
    alamatKirimController.recipientNameController.text = data.penerima;
    alamatKirimController.recipientPhoneController.text = data.noTelepon;
    alamatKirimController.recipientAddressController.text = data.alamat;
    alamatKirimController.recipientKodePosController.text = data.kodePos;
  
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
                        "Edit Alamat Pengiriman",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                      child: Form(
                        key: _formKey,
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
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Nama Penerima tidak boleh kosong';
                                    }
                                    return null;
                                  },
                                  controller: alamatKirimController.recipientNameController,
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
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'No. Telepon tidak boleh kosong';
                                    }
                                    return null;
                                  },
                                  controller: alamatKirimController.recipientPhoneController,
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
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Alamat tidak boleh kosong';
                                    }
                                    return null;
                                  },
                                  controller: alamatKirimController.recipientAddressController,
                                  maxLines: 3,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                                              validator: (value) {
                                                if (value == null) {
                                                  return 'Provinsi tidak boleh kosong';
                                                }
                                                return null;
                                              },
                                              isExpanded: true,
                                              // isDense: true,
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                hintText: provinsiController
                                                        .listProvinsi.isEmpty
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
                                                  provinsiController
                                                      .listProvinsi.length,
                                                  (index) => DropdownMenuItem(
                                                        child: Text(
                                                          provinsiController
                                                              .listProvinsi[
                                                                  index]
                                                              .province,
                                                          style: TextStyle(
                                                              fontSize: 12),
                                                        ),
                                                        value: provinsiController
                                                                .listProvinsi[
                                                            index],
                                                      )),
                                              onChanged: (value) {
                                                if (value != null) {
                                                  Provinsi selectedProvinsi =
                                                      value as Provinsi;
                                                  kotaController
                                                      .clearListKota();
                                                  kotaController
                                                      .fetchKotaByProvinsiId(
                                                          selectedProvinsi
                                                              .province_id);
                                                  kotaController.selectedKotaId
                                                      .value = null;
                                                  provinsiController
                                                      .selectedProvinsiId
                                                      .value = value;
                                                }
                                              },
                                              value: provinsiController
                                                          .selectedProvinsiId
                                                          .value !=
                                                      null
                                                  ? provinsiController
                                                      .selectedProvinsiId.value
                                                  : null,
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
                                              validator: (value) {
                                                if (value == null) {
                                                  return 'Kota tidak boleh kosong';
                                                }
                                                return null;
                                              },
                                              isExpanded: true,
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                hintText: kotaController
                                                        .isLoading.value
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
                                              items: kotaController
                                                      .listKota.isNotEmpty
                                                  ? List.generate(
                                                      kotaController
                                                          .listKota.length,
                                                      (index) =>
                                                          DropdownMenuItem(
                                                            child: Text(
                                                              kotaController
                                                                  .listKota[
                                                                      index]
                                                                  .cityName,
                                                              style: TextStyle(
                                                                  fontSize: 12),
                                                            ),
                                                            value: kotaController
                                                                    .listKota[
                                                                index],
                                                          ))
                                                  : null,
                                              onChanged: (value) {
                                                if (value != null) {
                                                  Kota selectedKota =
                                                      value as Kota;
                                                  kecamatanController
                                                      .clearListKecamatan();
                                                  kecamatanController
                                                      .fetchKecamatanByKotaId(
                                                          selectedKota.cityId);
                                                  kecamatanController
                                                      .selectedKecamatanId
                                                      .value = null;
                                                  kotaController.selectedKotaId
                                                      .value = value;
                                                }
                                              },
                                              value: kotaController
                                                          .selectedKotaId
                                                          .value !=
                                                      null
                                                  ? kotaController
                                                      .selectedKotaId.value
                                                  : null,
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
                                        margin: EdgeInsets.only(bottom: 15),
                                        child: Obx(() =>
                                            DropdownButtonFormField(
                                              validator: (value) {
                                                if (value == null) {
                                                  return 'Kecamatan tidak boleh kosong';
                                                }
                                                return null;
                                              },
                                              isExpanded: true,
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                hintText: kecamatanController
                                                        .isLoading.value
                                                    ? "Loading..."
                                                    : "Pilih Kecamatan",
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
                                              items: kecamatanController
                                                      .listKecamatan.isNotEmpty
                                                  ? List.generate(
                                                      kecamatanController
                                                          .listKecamatan.length,
                                                      (index) =>
                                                          DropdownMenuItem(
                                                            child: Text(
                                                              kecamatanController
                                                                  .listKecamatan[
                                                                      index]
                                                                  .subdistrictName,
                                                              style: TextStyle(
                                                                  fontSize: 12),
                                                            ),
                                                            value: kecamatanController
                                                                    .listKecamatan[
                                                                index],
                                                          ))
                                                  : null,
                                              onChanged: (value) {
                                                if (value != null) {
                                                  Kecamatan selectedKecamatan =
                                                      value as Kecamatan;
                                                  kelurahanController
                                                      .clearListKelurahan();
                                                  kelurahanController
                                                      .fetchKelurahanByKecamatanId(
                                                          selectedKecamatan
                                                              .subdistrictId);
                                                  kelurahanController
                                                      .selectedKelurahanId
                                                      .value = null;
                                                  kecamatanController
                                                      .selectedKecamatanId
                                                      .value = value;
                                                }
                                              },
                                              value: kecamatanController
                                                          .selectedKecamatanId
                                                          .value !=
                                                      null
                                                  ? kecamatanController
                                                      .selectedKecamatanId.value
                                                  : null,
                                            )),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 10),
                                  // Column(
                                  //   crossAxisAlignment:
                                  //       CrossAxisAlignment.start,
                                  //   children: [
                                  //     Text(
                                  //       "Kelurahan",
                                  //       style: TextStyle(
                                  //           fontSize: 14,
                                  //           fontWeight: FontWeight.bold),
                                  //     ),
                                  //     // dropdownform field
                                  //     Container(
                                  //       width: 150,
                                  //       padding: const EdgeInsets.only(top: 5),
                                  //       child: Obx(() => DropdownButtonFormField(
                                  //         decoration: InputDecoration(
                                  //           contentPadding:
                                  //               EdgeInsets.symmetric(
                                  //                   horizontal: 10),
                                  //           hintText: kelurahanController.isLoading.value ? "Loading..." : "Pilih Kelurahan",
                                  //           hintStyle: TextStyle(fontSize: 12),
                                  //           border: OutlineInputBorder(
                                  //               borderRadius:
                                  //                   BorderRadius.circular(5),
                                  //               borderSide: BorderSide(
                                  //                   color: Colors.grey,
                                  //                   width: 1)),
                                  //           focusedBorder: OutlineInputBorder(
                                  //               borderRadius:
                                  //                   BorderRadius.circular(5),
                                  //               borderSide: BorderSide(
                                  //                   color: Colors.grey,
                                  //                   width: 1)),
                                  //           enabledBorder: OutlineInputBorder(
                                  //               borderRadius:
                                  //                   BorderRadius.circular(5),
                                  //               borderSide: BorderSide(
                                  //                   color: Colors.grey,
                                  //                   width: 1)),
                                  //         ),
                                  //         items: kelurahanController.listKelurahan.isNotEmpty ? List.generate(
                                  //           kelurahanController.listKelurahan.length,
                                  //           (index) => DropdownMenuItem(
                                  //                           child: Text(
                                  //                             kelurahanController.listKelurahan[index].name,
                                  //                             style: TextStyle(
                                  //                                 fontSize: 12),
                                  //                           ),
                                  //                           value: kelurahanController.listKelurahan[index],
                                  //                         )
                                  //         ) : null,
                                  //         onChanged: (value) {
                                  //           if(value != null){
                                  //                 kelurahanController.selectedKelurahanId.value = value as Kelurahan?;
                                  //             }
                                  //         },
                                  //         value: kelurahanController.selectedKelurahanId.value != null ? kelurahanController.selectedKelurahanId.value : null,
                                  //       ),)
                                  //     ),
                                  //   ],
                                  // ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Kode Pos",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: Container(
                                          width: 150,
                                          margin: EdgeInsets.only(bottom: 15),
                                          child: TextFormField(
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return "Kode Pos tidak boleh kosong";
                                              }
                                              return null;
                                            },
                                            controller: alamatKirimController.recipientKodePosController,
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              hintText: "Masukkan Kode Pos",
                                              hintStyle:
                                                  TextStyle(fontSize: 12),
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
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: 10),

                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 20, left: 20, bottom: 15),
                              child: Obx(() => Container(
                                width: Get.width,
                                child: alamatKirimController.isLoading.value ? Center(child: CircularProgressIndicator(),) : ElevatedButton(
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
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      alamatKirimController.editAddress(data.id);
                                    }
                                    
                                  },
                                )
                              )),
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
