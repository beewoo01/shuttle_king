import 'package:shuttle_king/common/data/preference/item/nullable_preference_item.dart';
import 'package:shuttle_king/common/theme/custom_theme.dart';

class Prefs {
  static final appTheme = NullablePreferenceItem<CustomTheme>('appTheme');
}
