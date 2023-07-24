import 'package:flutter/material.dart';
import 'package:kharisma_sales_app/constants/apps_colors.dart';
import 'package:kharisma_sales_app/widgets/main_header.dart';

class KebijakanPrivasiPage extends StatelessWidget {
  const KebijakanPrivasiPage({super.key});

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
                            "Kebijakan Privasi",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Kebijakan Privasi Berbelanja di Kharisma Stationary.",
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
                            "Aturan Penggunaan",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold
                            ),
                          ),
                          // rich text
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text:
                                      "Selamat datang di aplikasi kami. Dengan mengakses aplikasi ini berarti Anda menyetujui aturan, pedoman, kebijakan, syarat dan ketentuan yang berlaku di aplikasi ini. Aturan, pedoman, syarat dan ketentuan yang berlaku pada aplikasi ini dapat berubah sewaktu-waktu. \n\n",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppsColors.loginFontColorSecondary,
                                  )),
                              TextSpan(
                                  text:
                                      "DENGAN MENGAKSES DAN MENGGUNAKAN APLIKASI INI BERARTI ANDA MENYETUJUI ATURAN, PEDOMAN, SYARAT DAN KETENTUAN YANG TERTERA DI BAWAH INI. MOHON MEMBACA DENGAN CERMAT PERSETUJUAN DI BAWAH INI SEBELUM MELAKUKAN TRANSAKSI DI APLIKASI INI.",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppsColors.loginFontColorSecondary,
                                  )),
                                  
                            ]),
                          ),
            
                          SizedBox(height: 10),
            
            
                          Text(
                            "Pembatasan",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold
                            ),
                          ),
                          // rich text
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text:
                                      "Merek dagang, logo, fotografi, ilustrasi, gambar, dan grafis semuanya milik kami. Anda tidak boleh menyalin, memodifikasi, memperbanyak, menjual atau mengeksploitasi dengan cara apapun isi dari situs ini atau perangkat lunak terkait tanpa seizin kami.",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppsColors.loginFontColorSecondary,
                                  )),    
                            ]),
                          ),


                          
                          SizedBox(height: 10),
            
            
                          Text(
                            "Kebijakan Privasi",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold
                            ),
                          ),
                          // rich text
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text:
                                      "Terima kasih telah mengakses aplikasi kami. Kami sangat menghormati kenyamanan privasi Anda dan melindungi informasi pribadi Anda sebaik-baiknya. Ketika anda mendaftar atau berbelanja di kami, kami menyimpan nama, jenis kelamin, tanggal lahir, alamat pengiriman, nomor telepon, dan alamat email. Informasi yang kami dapatkan dari Anda akan digunakan untuk memproses dan mengirimkan pesanan anda. Kami mengamankan informasi pribadi Anda dengan baik. Segala informasi pribadi Anda tidak akan kami jual, sewa, atau bagikan kepada pihak lain kecuali seperti yang disebutkan di bawah ini. \n\n",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppsColors.loginFontColorSecondary,
                                  )),
                              TextSpan(
                                text: "Kami dapat membagikan informasi anda kepada Penyedia Layanan Pihak Ketiga Berwenang. Kami menyediakan beberapa produk layanan melalui pihak ketiga. “Penyedia Layanan Pihak Ketiga” tersebut melakukan fungsinya sesuai kepentingan seperti mengirim atau mendistribusikan email promosi dan melakukan proses pengiriman melalui jasa pengiriman dimana mereka mengirimkan produk kami kepada Anda. Kami membagikan informasi pribadi Anda kepada Penyedia Layanan tersebut untuk mengirim email, menghapus informasi yang berulang pada data customer, manganalisis data, menyediakan asisten pemasaran, menyediakan hasil pencarian dan links, mengoperasikan situs, memecahkan masalah, dan menyediakan customer service. Kami juga mengumpulkan informasi pribadi dari individu dan perusahaan (“Affiliates”) dengan mereka yang memiliki hubungan kerjasama bisnis. Kami juga berbagi informasi dengan Penyedia Layanan untuk menyelesaikan proses administrasi. Kami mendorong Penyedia Pihak Ketiga untuk bertindak setiap saat sesuai dengan Kebijakan Privasi kami serta untuk mengadopsi dan memposting kebijakan privasi mereka sendiri. \n",
                                 style: TextStyle(
                                    fontSize: 14,
                                    color: AppsColors.loginFontColorSecondary,
                                  )
                              ),   
                            ]),
                          ),

                          SizedBox(height: 10),

                           Text(
                            "Berhenti Berlangganan",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold
                            ),
                          ),
                          // rich text
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text:
                                      "Jika sebelumnya Anda telah setuju untuk membagikan informasi Anda untuk tujuan marketing, tapi kemudian ingin berhenti menerima informasi marketing dari kami, silakan menekan tautan unsubsribe di email marketing kami. Jika Anda ingin mengetahui tujuan penggunaan informasi Anda, silakan menghubungi kami melalui email.",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppsColors.loginFontColorSecondary,
                                  )),    
                            ]),
                          ),
                          SizedBox(height: 10,),
                          Text(
                            "Penyangkalan",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold
                            ),
                          ),
                          // rich text
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text:
                                      "Apabila ada kesalahan dalam harga dan informasi yang tercantum pada produk yang disebabkan oleh kesalahan pengetikan yang dilakukan oleh tenant, kami berhak untuk menolak atau membatalkan pesanan apabila Anda telah memesan barang dengan harga dan informasi yang salah dicantumkan. Kami juga berhak untuk menolak atau membatalkan pesanan apabila Anda ingin membatalkan pesanan yang telah dibayar. Anda berhak mendapatkan uang Anda apabila Anda membatalkan pesanan yang telah dibayar.",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppsColors.loginFontColorSecondary,
                                  )),    
                            ]),
                          ),
                          SizedBox(height: 20,)
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
