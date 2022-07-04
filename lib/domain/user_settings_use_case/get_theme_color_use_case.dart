import 'package:get_it/get_it.dart';

import '../../core_ui/theme/theme_color.dart';
import '../../data/repositories/settings_repository/settings_repository.dart';
import '../base_use_case/BaseUseCase.dart';

class GetThemeColorUseCase implements BaseUseCase<ThemeColor, void> {
  final _repository = GetIt.I.get<SettingsRepository>();

  @override
  Future<ThemeColor> perform([_]) async {
    return await _repository.getThemeColor();
  }
}
