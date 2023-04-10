import 'package:flutter/material.dart';
import 'package:kharisma_sales_app/constants/apps_colors.dart';
import 'package:kharisma_sales_app/widgets/main_header.dart';

class TermConditionPage extends StatelessWidget {
  const TermConditionPage({super.key});

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
                // judul
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      margin: EdgeInsets.only(top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Syarat dan Ketentuan",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Syarat dan Ketentuan Belanja Di Kharisma Online",
                            style: TextStyle(
                                fontSize: 14,
                                color: AppsColors.loginFontColorSecondary),
                          ),
                          SizedBox(height: 10),
                          Divider(
                            thickness: 2,
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                       padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Ketersediaan Barang",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold
                            ),
                          ),
                          // rich text
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text:
                                      "Setiap produk di Toko Kami tersedia sepanjang tidak ditandai “Sold Out”. Ketika produk sudah terjual semua atau stok habis jika stok produk akan diisi kembali Anda dapat meminta kami untuk mengirimkan pemberitahuan via email jika produk sudah tersedia. Agar lebih mudah, follow kami di Twitter atau like Facebook kami karena setiap barang tersedia kembali akan diinformasikan melalui Twitter atau Facebook. \n\n",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppsColors.loginFontColorSecondary,
                                  )),
                              TextSpan(
                                  text:
                                      "Kami selalu memastikan agar sistem kami dapat bekerja dengan baik demi memberikan pelayanan terbaik kepada Anda. Jika tanpa sengaja Anda memesan sebuah produk yang stoknya tidak tersedia maka pesanan tersebut akan dibatalkan dan Anda akan memperoleh informasi melalui Email ataupun Telpon. Jika pesanan Anda telah dibatalkan namun Anda sudah membayar, Anda akan diberikan pilihan untuk membeli/menggantinya dengan produk lain atau meminta uang Anda kembali",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppsColors.loginFontColorSecondary,
                                  )),
                                  
                            ]),
                          ),
            
                          SizedBox(height: 10),
            
            
                          Text(
                            "Pembelian",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold
                            ),
                          ),
                          // rich text
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text:
                                      "Setiap pembelian yang statusnya “sudah dikemas” tidak dapat dibatalkan. Kami hanya menyediakan fasilitas Return (pengembalian) bila barang tidak sesuai. Informasi selengkapnya ada di bagian Ajukan Komplain.",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppsColors.loginFontColorSecondary,
                                  )),    
                            ]),
                          ),


                          
                          SizedBox(height: 10),
            
            
                          Text(
                            "Pembayaran",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold
                            ),
                          ),
                          // rich text
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text:
                                      "Pengiriman barang dilakukan oleh pihak kami, paling cepat 1x24 jam setelah konfirmasi pembayaran pada hari kerja. Lamanya waktu pengiriman tergantung jasa pengiriman yang dipilih. Setelah sampai di jasa pengiriman, barang berada dibawah tanggung jawab jasa pengiriman barang tersebut. \n\n",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppsColors.loginFontColorSecondary,
                                  )),
                              TextSpan(
                                text: "1. Biaya Pengiriman \n",
                                 style: TextStyle(
                                    fontSize: 14,
                                    color: AppsColors.loginFontColorSecondary,
                                  )
                              ),   
                              TextSpan(
                                  text:
                                      "Biaya pengiriman tergantung pada lokasi Anda dan berat produk yang Anda beli. \n\n",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppsColors.loginFontColorSecondary,
                                  )), 
                              TextSpan(
                                text: "1. Lama Waktu Pengiriman \n",
                                 style: TextStyle(
                                    fontSize: 14,
                                    color: AppsColors.loginFontColorSecondary,
                                  )
                              ),
                              TextSpan(
                                  text:
                                      "Pengiriman pesanan akan dilakukan dari kantor pusat kami di Jakarta. Pengiriman Reguler membutuhkan waktu 2-3 hari kerja. Perlu diperhatikan bahwa untuk beberapa kota jasa pengiriman kami tidak menyediakan jasa kilat sehingga pengiriman mungkin membutuhkan waktu sampai dengan 6 hari kerja.",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppsColors.loginFontColorSecondary,
                                  )),   
                            ]),
                          ),
                        ],
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
