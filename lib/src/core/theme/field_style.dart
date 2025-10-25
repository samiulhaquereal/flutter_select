import 'package:retcore_select/src/config/import.dart';

/// A comprehensive theme data class for customizing the [CustomSelect] widget.
class RetCoreSelectTheme {
  // --- Field Label ---
  final TextStyle? labelStyle;
  final TextStyle? requiredTextStyle;

  // --- Main Field Container ---
  final Color? fieldDisabledColor;
  final BorderRadius? fieldBorderRadius;
  final TextStyle? placeholderStyle;
  final TextStyle? valueStyle;

  // --- Chips (for Multi-Select) ---
  final Color? chipBackgroundColor;
  final TextStyle? chipLabelStyle;
  final Color? chipDeleteIconColor;
  final EdgeInsets? chipPadding;
  // --- THIS IS THE FIX ---
  final OutlinedBorder? chipShape;

  // --- Dropdown Items ---
  final Color? dropdownItemSelectedColor;
  final TextStyle? dropdownItemStyle;
  final TextStyle? dropdownSelectedItemStyle;
  final IconThemeData? checkIconTheme;

  // --- Search Field in Dropdown ---
  final TextStyle? searchHintStyle;
  final double? searchIconSize;
  final Color? searchIconColor;

  // --- Indicators & Messages ---
  final double? loadingIndicatorSize;
  final Color? loadingIndicatorColor;
  final TextStyle? loadingTextStyle;
  final TextStyle? noOptionsFoundTextStyle;

  // The decoration for the input field itself
  final InputDecoration? decoration;
  final TextStyle? floatingLabelStyle;

  /// Creates a theme for the [CustomSelect] widget.
  const RetCoreSelectTheme({
    this.labelStyle,
    this.requiredTextStyle,
    this.searchIconColor,
    this.decoration,
    this.searchIconSize,
    this.floatingLabelStyle,
    this.fieldDisabledColor,
    this.fieldBorderRadius,
    this.placeholderStyle,
    this.valueStyle,
    this.chipBackgroundColor,
    this.chipLabelStyle,
    this.chipDeleteIconColor,
    this.chipPadding,
    this.chipShape, // Corrected type
    this.dropdownItemSelectedColor,
    this.dropdownItemStyle,
    this.dropdownSelectedItemStyle,
    this.checkIconTheme,
    this.searchHintStyle,
    this.loadingIndicatorSize,
    this.loadingIndicatorColor,
    this.loadingTextStyle,
    this.noOptionsFoundTextStyle,
  });

  /// A default theme that provides a clean, standard look.
  factory RetCoreSelectTheme.defaultTheme(BuildContext context) {
    final theme = Theme.of(context);
    return RetCoreSelectTheme(
      labelStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.black54Color,
      ),
      fieldDisabledColor: AppColors.shade200GrayColor,
      fieldBorderRadius: BorderRadius.circular(8.0),
      placeholderStyle: TextStyle(fontSize: 14, color: AppColors.shade600GrayColor),
      valueStyle: const TextStyle(fontSize: 14, color: AppColors.black87Color),
      chipBackgroundColor: AppColors.shade300GrayColor,
      chipLabelStyle: const TextStyle(fontSize: 12),
      chipDeleteIconColor: AppColors.shade700GrayColor,
      chipPadding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
      // Default value is already a valid OutlinedBorder
      chipShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
        side: BorderSide(color: AppColors.shade400GrayColor ?? AppColors.black54Color),
      ),
      dropdownItemSelectedColor: theme.primaryColor.withAlpha(25),
      dropdownItemStyle: const TextStyle(),
      dropdownSelectedItemStyle: TextStyle(color: theme.primaryColor),
      checkIconTheme: IconThemeData(color: theme.primaryColor),
      searchHintStyle: TextStyle(fontSize: 14, color: AppColors.shade500GrayColor),
      loadingIndicatorSize: 6.0,
      loadingIndicatorColor: theme.primaryColor,
      searchIconSize: 20,
      loadingTextStyle: const TextStyle(
        color: AppColors.greyColor,
        fontStyle: FontStyle.italic,
      ),
      noOptionsFoundTextStyle: const TextStyle(color: AppColors.greyColor),
    );
  }
}