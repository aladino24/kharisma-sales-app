import 'package:flutter/material.dart';
import 'package:kharisma_sales_app/widgets/main_header.dart';

class AddAddressPage extends StatelessWidget {
  const AddAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          MainHeader(
              iconBookmark: false, iconCart: false, iconNotification: false),
          Container(
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
                      ],
                    ),
                  )),
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
