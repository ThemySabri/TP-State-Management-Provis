import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:tp_3/cubit/daftar_properti_cubit.dart';
import 'package:tp_3/cubit/properti_cubit.dart';
import 'package:tp_3/page/home_page.dart';

//model berisi data/state

//cubit untuk acvtivity model

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider<propertiListCubit>(
            create: (_) => propertiListCubit(),
          ),
          BlocProvider<propertiCubit>(
            create: (_) => propertiCubit(),
          ),
        ],
        child: const HomePage(),
      ),
    );
  }
}
