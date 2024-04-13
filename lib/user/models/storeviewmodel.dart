import 'package:flutter/material.dart';

class StoreViewModel {
  String? name;
  String? distance;

  StoreViewModel({
    this.name,
    this.distance,
  });

  factory StoreViewModel.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'name': String name,
        'distance': String distance,
      } =>
        StoreViewModel(
          name: name,
          distance: distance,
        ),
      _ => throw const FormatException('Failed to load album.'),
    };
  }
}
