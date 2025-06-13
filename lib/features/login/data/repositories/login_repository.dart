

import 'package:esqueleto_flutter/features/login/data/datasources/feature_datasource.dart';

abstract class FeatureRepository {
  
}

class FeatureRepositoryImpl implements FeatureRepository {
  final FeatureDatasource datasource;
  FeatureRepositoryImpl(
      {required this.datasource});

  

}
