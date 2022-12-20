import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../api/apiSettings.dart';
import '../model/model.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  Map<String, dynamic> _map = {};
  List<Product> listProduct = [];

  late ProductModel _model;

  ProductBloc() : super(Empty()) {
    on<ProductEvent>((event, emit) async {
      if (event is GetProducts) {
        _map = await MarketApi.httpGet(path: '/search?q=title:DNA;');

        if (_map["code"] == 200) {
          _model = ProductModel.fromMap(_map);

          listProduct = [..._model.data];
          emit(LoadedProduct(products: listProduct));
        } else {}
      }
    });
  }
}
