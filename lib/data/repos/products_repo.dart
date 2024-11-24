import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_developer_test_at_media_design_expert_fze/constants/api_end_points.dart';
import 'package:flutter_developer_test_at_media_design_expert_fze/data/models/error_model.dart';
import 'package:flutter_developer_test_at_media_design_expert_fze/data/models/product_model.dart';
import 'package:http/http.dart' as http;

abstract class ProductsRepo {
  static Future<Either<ErrorModel, List<ProductModel>>>
      getProductsSample() async {
    try {
      final response =
          await http.get(Uri.parse(ApiEndPoints.productsSamplesEndPoints));

      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<ProductModel> products = data.entries.map((entry) {
          return ProductModel.fromJson({
            'index': entry.key,
            'name': entry.value,
          });
        }).toList();
        print("🦿🦿🦿🦿");
        print(products);

        return Right(products);
      } else {
        return Left(ErrorModel.fromJson(json.decode(response.body)));
      }
    } catch (e) {
      print(e.toString());

      return Left(ErrorModel(message: e.toString(), description: e.toString()));
    }
  }
}
