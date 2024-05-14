import 'package:tp_3/cubit/properti_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class propertiCubit extends Cubit<propertiModel> {
  String url = "http://127.0.0.1:8000/daftar_properti";
  propertiCubit()
      : super(propertiModel(
            id: "",
            lokasi: "",
            kecamatan: "",
            tipeHunian: "",
            kondisi: "",
            luasTanah: "",
            luasBangunan: "",
            kepemilikan: "",
            lebarJalan: "",
            jumlahLantai: "",
            jumlahKamarTidur: "",
            jumlahKamarMandi: "",
            garasi: "",
            dayaListrik: "",
            rooftop: "",
            sumberAir: "",
            tipeFurnish: "",
            harga: ""));

  //map dari json ke atribut
  void setFromJson(Map<String, dynamic> json) {
    String id = json['id'];
    String lokasi = json['lokasi'];
    String kecamatan = json['kecamatan'];
    String tipeHunian = json['tipeHunian'];
    String kondisi = json['kondisi'];
    String luasTanah = json['luasTanah'];
    String luasBangunan = json['luasBangunan'];
    String kepemilikan = json['kepemilikan'];
    String lebarJalan = json['lebarJalan'];
    String jumlahLantai = json['jumlahLantai'];
    String jumlahKamarTidur = json['jumlahKamarTidur'];
    String jumlahKamarMandi = json['jumlahKamarMandi'];
    String garasi = json['garasi'];
    String dayaListrik = json['dayaListrik'];
    String rooftop = json['rooftop'];
    String sumberAir = json['sumberAir'];
    String tipeFurnish = json['tipeFurnish'];
    String harga = json['harga'];

//emit state baru, ini berbeda dgn provider!
    emit(propertiModel(
        id: id,
        lokasi: lokasi,
        kecamatan: kecamatan,
        tipeHunian: tipeHunian,
        kondisi: kondisi,
        luasTanah: luasTanah,
        luasBangunan: luasBangunan,
        kepemilikan: kepemilikan,
        lebarJalan: lebarJalan,
        jumlahLantai: jumlahLantai,
        jumlahKamarTidur: jumlahKamarTidur,
        jumlahKamarMandi: jumlahKamarMandi,
        garasi: garasi,
        dayaListrik: dayaListrik,
        rooftop: rooftop,
        sumberAir: sumberAir,
        tipeFurnish: tipeFurnish,
        harga: harga));
  }

  void fetchData(String id) async {
    final response = await http.get(Uri.parse(url + id));
    if (response.statusCode == 200) {
      //sukses
      setFromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal load');
    }
  }
}
