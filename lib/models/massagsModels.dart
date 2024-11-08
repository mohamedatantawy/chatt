import 'package:flutter/material.dart';

class Massagsmodels {
  final String massage;
  final String email;

  Massagsmodels(
      {required this.massage, required this.email});
  factory Massagsmodels.fromJson(data) {
    return Massagsmodels(
        massage: data['massage'],  email: data['id']);
  }
}
