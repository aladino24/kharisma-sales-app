import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kharisma_sales_app/constants/apps_colors.dart';
import 'package:kharisma_sales_app/controllers/api/vouchers/voucher_controller.dart';

class SearchVoucher extends StatelessWidget {
  SearchVoucher({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = new GlobalKey();
  final VoucherController voucherCodeController = Get.find<VoucherController>();
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10),
                child: TextFormField(
                  controller: voucherCodeController.keyCodeController,
                  decoration: InputDecoration(
                      hintText: "Masukkan Kode Voucher",
                      border: InputBorder.none),
                      validator: (value) {
                            if (value!.isEmpty) {
                              return "Voucher Code can't be empty";
                            } 
                            return null;
                        },
                ),
              ),
            ),
            GestureDetector(
              child: Container(
                height: 50,
                padding:
                    EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  color: AppsColors.loginColorPrimary,
                ),
                child: Obx(() => Center(
                    child: voucherCodeController.isLoadingVoucher.value ? 
                    CircularProgressIndicator() : 
                      Text(
                      'Apply',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )
               )),
              ),
              onTap: (){
                 if (_formKey.currentState!.validate()) {
                   voucherCodeController.claimVoucher();                   
                 }
              },
            ),
          ],
        ),
      ),
    );
  }
}
