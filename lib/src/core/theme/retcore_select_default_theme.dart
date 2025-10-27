import 'package:retcore_select/src/config/import.dart';

class RetCoreSelectDefaultTheme {
  /// Creates a default theme that adapts to the provided [BuildContext].
  static RetCoreSelectTheme of(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return RetCoreSelectTheme(
      // --- Field & Label ---
      labelStyle: textTheme.bodyLarge,
      requiredTextStyle: textTheme.bodyLarge?.copyWith(color: colorScheme.error),
      valueStyle: textTheme.titleMedium,
      placeholderStyle: textTheme.titleMedium?.copyWith(
        color: colorScheme.onSurface.withOpacity(0.5),
      ),

      // --- Main Field Container ---
      fieldDisabledColor: colorScheme.onSurface.withOpacity(0.12),
      fieldBorderRadius: BorderRadius.circular(AppSizes.inputFieldRadius),

      // --- Chips ---
      chipBackgroundColor: colorScheme.secondaryContainer,
      chipLabelStyle: textTheme.labelMedium?.copyWith(color: colorScheme.onSecondaryContainer),
      chipDeleteIconColor: colorScheme.onSecondaryContainer.withOpacity(0.7),
      chipPadding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      chipShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
        side: BorderSide(color: colorScheme.outline.withOpacity(0.5)),
      ),

      // --- Dropdown ---
      dropdownItemSelectedColor: colorScheme.primary.withOpacity(0.1),
      dropdownItemStyle: textTheme.bodyMedium,
      dropdownSelectedItemStyle: textTheme.bodyMedium?.copyWith(color: colorScheme.primary),

      // --- Icons ---
      checkIconTheme: IconThemeData(color: colorScheme.primary, size: 20),
      clearIconTheme: IconThemeData(color: colorScheme.onSurface.withOpacity(0.6), size: 18),
      dropdownArrowSize: 24.0,
      dropdownArrowEnabledColor: colorScheme.onSurface.withOpacity(0.6),
      dropdownArrowDisabledColor: colorScheme.onSurface.withOpacity(0.3),

      // --- Search ---
      searchHintStyle: textTheme.bodyMedium?.copyWith(
        color: colorScheme.onSurface.withOpacity(0.5),
      ),
      searchIconTheme: IconThemeData(
        color: colorScheme.onSurface.withOpacity(0.6),
        size: 20.0,
      ),

      // --- Indicators ---
      loadingIndicatorColor: colorScheme.primary,
      loadingTextStyle: textTheme.bodySmall?.copyWith(fontStyle: FontStyle.italic),
      noOptionsFoundTextStyle: textTheme.bodySmall?.copyWith(fontStyle: FontStyle.italic),
    );
  }
}

