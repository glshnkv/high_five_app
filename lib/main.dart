import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:high_five_app/high_five_app.dart';
import 'package:high_five_app/models/result_model.dart';
import 'package:high_five_app/screens/result/bloc/result_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await Hive.initFlutter();
  Hive.registerAdapter(ResultModelAdapter());
  await Hive.openBox('results');

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ResultBloc>(create: (context) => ResultBloc()),
      ],
      child: HighFiveApp(),
    ),
  );
}
