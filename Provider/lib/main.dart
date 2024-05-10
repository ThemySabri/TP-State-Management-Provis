import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'dart:ui';

class DataProperti {
  String id;
  String lokasi;
  String kecamatan;
  String tipeHunian;
  String kondisi;
  String luasTanah;
  String luasBangunan;
  String kepemilikan;
  String lebarJalan;
  String jumlahLantai;
  String jumlahKamarTidur;
  String jumlahKamarMandi;
  String garasi;
  String dayaListrik;
  String rooftop;
  String sumberAir;
  String tipeFurnish;
  String harga;

  DataProperti({
    required this.id,
    required this.lokasi,
    required this.kecamatan,
    required this.tipeHunian,
    required this.kondisi,
    required this.luasTanah,
    required this.luasBangunan,
    required this.kepemilikan,
    required this.lebarJalan,
    required this.jumlahLantai,
    required this.jumlahKamarTidur,
    required this.jumlahKamarMandi,
    required this.garasi,
    required this.dayaListrik,
    required this.rooftop,
    required this.sumberAir,
    required this.tipeFurnish,
    required this.harga,
  });
}

class PopulasiProvider extends ChangeNotifier {
  List<DataProperti> listPop = <DataProperti>[];

  bool _isDataFetched = false;

  Future<void> fetchData() async {
    if (!_isDataFetched) {
      _isDataFetched = true;
      listPop.clear(); // Clear existing data
      String url = "http://127.0.0.1:8000/daftar_properti";

      try {
        final response = await http.get(Uri.parse(url));

        if (response.statusCode == 200) {
          var jsonResponse = jsonDecode(response.body);
          var data = jsonResponse["data"];
          for (var property in data) {
            var id = property["id"];
            var lokasi = property["lokasi"];
            var kecamatan = property["kecamatan"];
            var tipeHunian = property["tipeHunian"];
            var kondisi = property["kondisi"];
            var luasTanah = property["luasTanah"];
            var luasBangunan = property["luasBangunan"];
            var kepemilikan = property["kepemilikan"];
            var lebarJalan = property["lebarJalan"];
            var jumlahLantai = property["jumlahLantai"];
            var jumlahKamarTidur = property["jumlahKamarTidur"];
            var jumlahKamarMandi = property["jumlahKamarMandi"];
            var garasi = property["garasi"];
            var dayaListrik = property["dayaListrik"];
            var rooftop = property["rooftop"];
            var sumberAir = property["sumberAir"];
            var tipeFurnish = property["tipeFurnish"];
            var harga = property["harga"];

            listPop.add(
              DataProperti(
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
                harga: harga,
              ),
            );
          }
          notifyListeners();
        } else {
          throw Exception('Failed to load');
        }
      } catch (e) {
        throw Exception('Failed to load');
      }
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove debug banner
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Katalog Rumah',
            style: TextStyle(
                color: Colors.white), // Change appbar text color to white
          ),
          backgroundColor:
              Colors.blue, // Change appbar background color to blue
          iconTheme: IconThemeData(
              color: Colors.white), // Change back button color to white
        ),
        body: Column(
          // Wrap ListView.builder with Column
          children: <Widget>[
            SizedBox(height: 8), // Add SizedBox at the top
            Expanded(
              child: Consumer<PopulasiProvider>(
                builder: (context, provider, child) {
                  if (provider.listPop.isEmpty) {
                    // Show a loading indicator if data is being fetched
                    return CircularProgressIndicator();
                  } else {
                    // Once data is fetched, display it in a ListView
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: provider.listPop.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            // Navigate to MyAppDetail when clicked
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyAppDetail(
                                  id: provider.listPop[index].id,
                                  lokasi: provider.listPop[index].lokasi,
                                  kecamatan: provider.listPop[index].kecamatan,
                                  tipeHunian:
                                      provider.listPop[index].tipeHunian,
                                  kondisi: provider.listPop[index].kondisi,
                                  luasTanah: provider.listPop[index].luasTanah,
                                  luasBangunan:
                                      provider.listPop[index].luasBangunan,
                                  kepemilikan:
                                      provider.listPop[index].kepemilikan,
                                  lebarJalan:
                                      provider.listPop[index].lebarJalan,
                                  jumlahLantai:
                                      provider.listPop[index].jumlahLantai,
                                  jumlahKamarTidur:
                                      provider.listPop[index].jumlahKamarTidur,
                                  jumlahKamarMandi:
                                      provider.listPop[index].jumlahKamarMandi,
                                  garasi: provider.listPop[index].garasi,
                                  dayaListrik:
                                      provider.listPop[index].dayaListrik,
                                  rooftop: provider.listPop[index].rooftop,
                                  sumberAir: provider.listPop[index].sumberAir,
                                  tipeFurnish:
                                      provider.listPop[index].tipeFurnish,
                                  harga: provider.listPop[index].harga,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[200],
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "ID: ${provider.listPop[index].id}",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  "Lokasi: ${provider.listPop[index].lokasi}",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "Kecamatan: ${provider.listPop[index].kecamatan}",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "Tipe Hunian: ${provider.listPop[index].tipeHunian}",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                // Add more Text widgets for other properties
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyAppDetail extends StatelessWidget {
  final String id;
  final String lokasi;
  final String kecamatan;
  final String tipeHunian;
  final String kondisi;
  final String luasTanah;
  final String luasBangunan;
  final String kepemilikan;
  final String lebarJalan;
  final String jumlahLantai;
  final String jumlahKamarTidur;
  final String jumlahKamarMandi;
  final String garasi;
  final String dayaListrik;
  final String rooftop;
  final String sumberAir;
  final String tipeFurnish;
  final String harga;

  MyAppDetail({
    required this.id,
    required this.lokasi,
    required this.kecamatan,
    required this.tipeHunian,
    required this.kondisi,
    required this.luasTanah,
    required this.luasBangunan,
    required this.kepemilikan,
    required this.lebarJalan,
    required this.jumlahLantai,
    required this.jumlahKamarTidur,
    required this.jumlahKamarMandi,
    required this.garasi,
    required this.dayaListrik,
    required this.rooftop,
    required this.sumberAir,
    required this.tipeFurnish,
    required this.harga,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Page',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue, // Change appbar background color to blue
        iconTheme: IconThemeData(
            color: Colors.white), // Change back button color to white
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ID: $id',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'Lokasi: $lokasi',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'Kecamatan: $kecamatan',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'Tipe Hunian: $tipeHunian',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'Kondisi: $kondisi',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'Luas Tanah: $luasTanah',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'Luas Bangunan: $luasBangunan',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'Kepemilikan: $kepemilikan',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'Lebar Jalan: $lebarJalan',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'Jumlah Lantai: $jumlahLantai',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'Jumlah Kamar Tidur: $jumlahKamarTidur',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'Jumlah Kamar Mandi: $jumlahKamarMandi',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'Garasi: $garasi',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'Daya Listrik: $dayaListrik',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'Rooftop: $rooftop',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'Sumber Air: $sumberAir',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'Tipe Furnish: $tipeFurnish',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'Harga: $harga',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}

class MyAppWrapper extends StatefulWidget {
  const MyAppWrapper({Key? key}) : super(key: key);

  @override
  State<MyAppWrapper> createState() => _MyAppWrapperState();
}

class _MyAppWrapperState extends State<MyAppWrapper> {
  @override
  void initState() {
    super.initState();
    // Fetch data when the widget is first created
    Provider.of<PopulasiProvider>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return const MyApp();
  }
}

void main() {
  runApp(
    ChangeNotifierProvider<PopulasiProvider>(
      create: (context) => PopulasiProvider(),
      child: const MyAppWrapper(),
    ),
  );
}
