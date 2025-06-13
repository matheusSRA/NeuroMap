
import 'package:esqueleto_flutter/features/login/data/repositories/login_repository.dart';

abstract class FeatureUsecase {
  
}

class FeatureUsecaseImpl implements FeatureUsecase {
  final FeatureRepository repository;

  FeatureUsecaseImpl({required this.repository});

  
}
