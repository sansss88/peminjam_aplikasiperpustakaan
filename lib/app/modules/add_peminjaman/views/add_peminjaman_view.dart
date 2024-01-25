import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_rplb_35/app/routes/app_pages.dart';

import '../controllers/add_peminjaman_controller.dart';

class AddPeminjamanView extends GetView<AddPeminjamanController> {
  const AddPeminjamanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pinjam Buku ${Get.parameters['judul'].toString()}'),
        centerTitle: true,
      ),
      body: ListView(children: [
        Form(
          key: controller.formKey,
          child: Column(children: [
            SizedBox(
              height: 25,
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          child: Text(
                            'Tanggal Pinjam',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Color(0xFF61677D),
                              letterSpacing: -0.2,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: TextFormField(
                            controller: controller.tanggalPinjamController,
                            decoration: InputDecoration(
                              hintText: 'Masukan Tanggal Pinjam',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Tanggal Pinjajm Tidak  Boleh Kosong!';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          child: Text(
                            'Tanggal Kembali',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Color(0xFF61677D),
                              letterSpacing: -0.2,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: TextFormField(
                            controller: controller.tanggalKembaliController,
                            decoration: InputDecoration(
                              hintText: 'Masukan Tanggal Kembali',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'tanggal kembali tidak boleh kosong!';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 5.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.post();
                      ;
                    },
                    child: const Text(
                      'pinjam',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF080ba1),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ]),
        )
      ]),),
    ])
    );
  }
}
