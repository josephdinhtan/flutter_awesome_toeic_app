import 'package:get_it/get_it.dart';

import '../../core_ui/theme/theme.dart';
import '../../data/repositories/settings_repository/settings_repository.dart';
import '../base_use_case/BaseUseCase.dart';

class SetThemeColorUseCase implements BaseUseCase<bool, ThemeColor> {
  final _repository = GetIt.I.get<SettingsRepository>();

  @override
  Future<bool> perform(themeColor) async {
    return await _repository.setThemeColor(themeColor);
  }
}
