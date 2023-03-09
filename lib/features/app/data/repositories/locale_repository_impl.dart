import 'package:alldle/core/src/failures/failure.dart';
import 'package:alldle/core/src/result.dart';
import 'package:alldle/features/app/data/providers/locale/locale_local_provider.dart';
import 'package:alldle/features/app/domain/repositories_interfaces/locale_repository.dart';
import 'package:flutter/material.dart';

class LocaleRepositoryImpl implements LocaleRepository {
  const LocaleRepositoryImpl({
    required LocaleLocalProvider localProvider,
  }) : _localProvider = localProvider;

  final LocaleLocalProvider _localProvider;

  @override
  Future<Result<FetchFailure, Locale>> getLocale() {
    return _localProvider.getLocale();
  }

  @override
  Future<Result<FetchFailure, void>> saveLocale(Locale locale) {
    return _localProvider.saveLocale(locale);
  }
}
