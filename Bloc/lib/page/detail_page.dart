import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp_3/cubit/daftar_properti_cubit.dart';
import 'package:tp_3/cubit/properti_cubit.dart';
import 'package:tp_3/cubit/properti_state.dart';
import 'dart:developer' as developer;

class DetailUmkmPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Detail'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            BlocBuilder<propertiCubit, propertiModel>(
                buildWhen: (previousState, state) {
              developer.log('${previousState.id}->${state.id}', name: 'log');
              return true;
            }, builder: (context, propertiDetail) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue[200],
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(children: [
                      Text(
                        'Lokasi: ${propertiDetail.lokasi}',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 5.0),
                      Text('Kecamatan: ${propertiDetail.kecamatan}',
                          style: TextStyle(color: Colors.white)),
                      SizedBox(height: 5.0),
                      Text("Tipe Hunian: ${propertiDetail.tipeHunian}",
                          style: TextStyle(color: Colors.white)),
                      SizedBox(height: 5.0),
                      Text('Kondisi: ${propertiDetail.kondisi} ',
                          style: TextStyle(color: Colors.white)),
                      SizedBox(height: 5.0),
                      Text('Luas Tanah: ${propertiDetail.luasTanah} ',
                          style: TextStyle(color: Colors.white)),
                      SizedBox(height: 5.0),
                      Text('Luas Bangunan: ${propertiDetail.luasBangunan} ',
                          style: TextStyle(color: Colors.white)),
                      SizedBox(height: 5.0),
                      Text('Kepemilikan: ${propertiDetail.kepemilikan} ',
                          style: TextStyle(color: Colors.white)),
                      SizedBox(height: 5.0),
                      Text('Lebar Jalan: ${propertiDetail.lebarJalan} ',
                          style: TextStyle(color: Colors.white)),
                      SizedBox(height: 5.0),
                      Text('Jumlah Lantai: ${propertiDetail.jumlahLantai} ',
                          style: TextStyle(color: Colors.white)),
                      SizedBox(height: 5.0),
                      Text(
                          'Jumlah Kamar Tidur: ${propertiDetail.jumlahKamarTidur} ',
                          style: TextStyle(color: Colors.white)),
                      SizedBox(height: 5.0),
                      Text(
                          'Jumlah Kamar Mandi: ${propertiDetail.jumlahKamarMandi} ',
                          style: TextStyle(color: Colors.white)),
                      SizedBox(height: 5.0),
                      Text('Garasi: ${propertiDetail.garasi} ',
                          style: TextStyle(color: Colors.white)),
                      SizedBox(height: 5.0),
                      Text('Daya Listrik: ${propertiDetail.dayaListrik} ',
                          style: TextStyle(color: Colors.white)),
                      SizedBox(height: 5.0),
                      Text('Rooftop: ${propertiDetail.rooftop} ',
                          style: TextStyle(color: Colors.white)),
                      SizedBox(height: 5.0),
                      Text('Sumber Air: ${propertiDetail.sumberAir} ',
                          style: TextStyle(color: Colors.white)),
                      SizedBox(height: 5.0),
                      Text('Tipe Furnish: ${propertiDetail.tipeFurnish} ',
                          style: TextStyle(color: Colors.white)),
                      SizedBox(height: 5.0),
                      Text('Harga: ${propertiDetail.harga} ',
                          style: TextStyle(color: Colors.white)),
                      SizedBox(height: 5.0),
                      // Add more Text widgets for other properties
                    ]),
                  ),
                ),
              );
            })
          ],
        ));
  }
}
