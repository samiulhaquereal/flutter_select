import 'package:retcore_select/src/config/import.dart';

/// A comprehensive theme data class for customizing the [CustomSelect] widget.
class FlutterSelectTheme {
  // --- Field Label ---
  final TextStyle? labelStyle;

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

  // --- Indicators & Messages ---
  final double? loadingIndicatorSize;
  final Color? loadingIndicatorColor;
  final TextStyle? loadingTextStyle;
  final TextStyle? noOptionsFoundTextStyle;

  // The decoration for the input field itself
  final InputDecoration? decoration;
  final TextStyle? floatingLabelStyle;

  /// Creates a theme for the [CustomSelect] widget.
  const FlutterSelectTheme({
    this.labelStyle,
    this.decoration,
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
  factory FlutterSelectTheme.defaultTheme(BuildContext context) {
    final theme = Theme.of(context);
    return FlutterSelectTheme(
      labelStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.black54,
      ),
      fieldDisabledColor: Colors.grey.shade200,
      fieldBorderRadius: BorderRadius.circular(8.0),
      placeholderStyle: TextStyle(fontSize: 14, color: Colors.grey.shade600),
      valueStyle: const TextStyle(fontSize: 14, color: Colors.black87),
      chipBackgroundColor: Colors.grey.shade300,
      chipLabelStyle: const TextStyle(fontSize: 12),
      chipDeleteIconColor: Colors.grey.shade700,
      chipPadding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
      // Default value is already a valid OutlinedBorder
      chipShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
        side: BorderSide(color: Colors.grey.shade400),
      ),
      dropdownItemSelectedColor: theme.primaryColor.withOpacity(0.1),
      dropdownItemStyle: const TextStyle(),
      dropdownSelectedItemStyle: TextStyle(color: theme.primaryColor),
      checkIconTheme: IconThemeData(color: theme.primaryColor),
      searchHintStyle: TextStyle(fontSize: 14, color: Colors.grey.shade500),
      loadingIndicatorSize: 6.0,
      loadingIndicatorColor: theme.primaryColor,
      loadingTextStyle: const TextStyle(
        color: Colors.grey,
        fontStyle: FontStyle.italic,
      ),
      noOptionsFoundTextStyle: const TextStyle(color: Colors.grey),
    );
  }
}