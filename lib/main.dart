import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/pages/home.dart';

import 'api/apiSettings.dart';
import 'bloc/product_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MarketApi.configureDio();
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => ProductBloc())],
      child: const MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
