

/// 3. **Library Documentation (lib/your_package.dart)**
///```dart
/// A Flutter button system with centralized theme control and 4 button variants:
///
/// 1. **AppPrimaryButton**: For main actions (Filled style)
/// 2. **AppOutlineButton**: For secondary actions (Bordered style)
/// 3. **AppTextButton**: For low-emphasis actions
/// 4. **AppIconButton**: For icon-based actions
///
/// All buttons share:
/// - Central configuration via [ButtonThemeController]
/// - 15+ customizable visual properties
/// - Built-in loading states
///
/// Usage:
/// ```dart
/// ButtonThemeController.initializeAll(...);
/// AppPrimaryButton(...);
/// ```

library app_buttons;


export 'src/buttons/app_primary_button.dart';
export 'src/buttons/app_outline_button.dart';
export 'src/buttons/app_text_button.dart';
export 'src/buttons/app_icon_button.dart';
export 'src/core/button_settings.dart';
export 'src/core/button_theme_controller.dart';


