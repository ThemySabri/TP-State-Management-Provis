import 'package:tp_3/cubit/properti_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class propertiListCubit extends Cubit<List<propertiModel>> {
  String url = "http://127.0.0.1:8000/daftar_properti";
  propertiListCubit()
      : super([
          propertiModel(
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
              harga: "")
        ]);

  //map dari json ke atribut
  void setFromJson(Map<String, dynamic> json) {
    List<dynamic> data = json['data'];
    List<propertiModel> propertiList = data
        .map((e) => propertiModel(
            id: e['id'],
            lokasi: e['lokasi'],
            kecamatan: e['kecamatan'],
            tipeHunian: e['tipeHunian'],
            kondisi: e['kondisi'],
            luasTanah: e['luasTanah'],
            luasBangunan: e['luasBangunan'],
            kepemilikan: e['kepemilikan'],
            lebarJalan: e['lebarJalan'],
            jumlahLantai: e['jumlahLantai'],
            jumlahKamarTidur: e['jumlahKamarTidur'],
            jumlahKamarMandi: e['jumlahKamarMandi'],
            garasi: e['garasi'],
            dayaListrik: e['dayaListrik'],
            rooftop: e['rooftop'],
            sumberAir: e['sumberAir'],
            tipeFurnish: e['tipeFurnish'],
            harga: e['harga']))
        .toList();
    emit(propertiList);
  }

  void fetchData() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      //sukses
      setFromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal load');
    }
  }
}
