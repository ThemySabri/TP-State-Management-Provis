import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp_3/cubit/daftar_properti_cubit.dart';
import 'package:tp_3/cubit/properti_cubit.dart';
import 'package:tp_3/cubit/properti_state.dart';
import 'dart:developer' as developer;

import 'package:tp_3/page/detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.blue,
          title: Text(
            'My App',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                Column(
                  children: [
                    Text(
                        '2202074, Ahmad Taufiq Hidayat; 2203903, Themy Sabri Syuhada; Kami berjanji tidak akan berbuat curang data atau membantu orang lain berbuat curang'),
                    SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<propertiListCubit>().fetchData();
                      },
                      child: Text('Reload Daftar Properti'),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    BlocBuilder<propertiListCubit, List<propertiModel>>(
                        buildWhen: (previousState, state) {
                      developer.log(
                          '${previousState[0].lokasi}->${state[0].lokasi}',
                          name: 'log');
                      return true;
                    }, builder: (context, propertiList) {
                      return Container(
                        height: 500,
                        child: ListView.builder(
                          itemCount: propertiList.length,
                          itemBuilder: (context, index) {
                            if (propertiList[0].lokasi != "") {
                              return ListTile(
                                  leading: Image.network(
                                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
                                  title: Text(propertiList[index].lokasi),
                                  subtitle:
                                      Text(propertiList[index].tipeHunian),
                                  trailing: Icon(Icons.more_vert_rounded),
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) {
                                      context
                                          .read<propertiCubit>()
                                          .fetchData(propertiList[index].id);
                                      return DetailPropertiPage();
                                    }));
                                  });
                            }
                          },
                        ),
                      );
                    }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
