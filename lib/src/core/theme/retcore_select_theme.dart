import 'package:retcore_select/src/config/import.dart';

/// A data class that holds all the theme properties for the `RetCoreSelect` widget.
///
/// This class is immutable. To modify properties, use the [copyWith] method.
@immutable
class RetCoreSelectTheme {
  /// --- Field & Label ---
  final TextStyle? labelStyle;
  final TextStyle? floatingLabelStyle;
  final TextStyle? requiredTextStyle;

  /// --- Main Field Container ---
  final InputDecoration? decoration;
  final Color? fieldDisabledColor;
  final BorderRadius? fieldBorderRadius;
  final TextStyle? placeholderStyle;
  final TextStyle? valueStyle;

  /// --- Chips (for Multi-Select) ---
  final Color? chipBackgroundColor;
  final TextStyle? chipLabelStyle;
  final Color? chipDeleteIconColor;
  final EdgeInsets? chipPadding;
  final OutlinedBorder? chipShape;

  /// --- Dropdown Items ---
  final Color? dropdownItemSelectedColor;
  final TextStyle? dropdownItemStyle;
  final TextStyle? dropdownSelectedItemStyle;
  final IconThemeData? checkIconTheme;

  /// --- Search Field in Dropdown ---
  final TextStyle? searchHintStyle;
  final IconThemeData? searchIconTheme;
  final InputDecoration? searchFieldDecoration;

  /// --- Indicators & Messages ---
  final double? loadingIndicatorSize;
  final Color? loadingIndicatorColor;
  final TextStyle? loadingTextStyle;
  final TextStyle? noOptionsFoundTextStyle;

  /// --- Icons ---
  final IconThemeData? clearIconTheme;
  final double? dropdownArrowSize;
  final Color? dropdownArrowEnabledColor;
  final Color? dropdownArrowDisabledColor;

  /// Creates a theme for the `RetCoreSelect` widget.
  const RetCoreSelectTheme({
    this.labelStyle,
    this.floatingLabelStyle,
    this.requiredTextStyle,
    this.decoration,
    this.fieldDisabledColor,
    this.fieldBorderRadius,
    this.placeholderStyle,
    this.valueStyle,
    this.chipBackgroundColor,
    this.chipLabelStyle,
    this.chipDeleteIconColor,
    this.chipPadding,
    this.chipShape,
    this.dropdownItemSelectedColor,
    this.dropdownItemStyle,
    this.dropdownSelectedItemStyle,
    this.checkIconTheme,
    this.searchHintStyle,
    this.searchIconTheme,
    this.searchFieldDecoration,
    this.loadingIndicatorSize,
    this.loadingIndicatorColor,
    this.loadingTextStyle,
    this.noOptionsFoundTextStyle,
    this.clearIconTheme,
    this.dropdownArrowSize,
    this.dropdownArrowEnabledColor,
    this.dropdownArrowDisabledColor,
  });

  /// Creates a copy of this theme but with the given fields replaced with new values.
  RetCoreSelectTheme copyWith({
    TextStyle? labelStyle,
    TextStyle? floatingLabelStyle,
    TextStyle? requiredTextStyle,
    InputDecoration? decoration,
    Color? fieldDisabledColor,
    BorderRadius? fieldBorderRadius,
    TextStyle? placeholderStyle,
    TextStyle? valueStyle,
    Color? chipBackgroundColor,
    TextStyle? chipLabelStyle,
    Color? chipDeleteIconColor,
    EdgeInsets? chipPadding,
    OutlinedBorder? chipShape,
    Color? dropdownItemSelectedColor,
    TextStyle? dropdownItemStyle,
    TextStyle? dropdownSelectedItemStyle,
    IconThemeData? checkIconTheme,
    TextStyle? searchHintStyle,
    IconThemeData? searchIconTheme,
    InputDecoration? searchFieldDecoration,
    double? loadingIndicatorSize,
    Color? loadingIndicatorColor,
    TextStyle? loadingTextStyle,
    TextStyle? noOptionsFoundTextStyle,
    IconThemeData? clearIconTheme,
    double? dropdownArrowSize,
    Color? dropdownArrowEnabledColor,
    Color? dropdownArrowDisabledColor,
  }) {
    return RetCoreSelectTheme(
      labelStyle: labelStyle ?? this.labelStyle,
      floatingLabelStyle: floatingLabelStyle ?? this.floatingLabelStyle,
      requiredTextStyle: requiredTextStyle ?? this.requiredTextStyle,
      decoration: decoration ?? this.decoration,
      fieldDisabledColor: fieldDisabledColor ?? this.fieldDisabledColor,
      fieldBorderRadius: fieldBorderRadius ?? this.fieldBorderRadius,
      placeholderStyle: placeholderStyle ?? this.placeholderStyle,
      valueStyle: valueStyle ?? this.valueStyle,
      chipBackgroundColor: chipBackgroundColor ?? this.chipBackgroundColor,
      chipLabelStyle: chipLabelStyle ?? this.chipLabelStyle,
      chipDeleteIconColor: chipDeleteIconColor ?? this.chipDeleteIconColor,
      chipPadding: chipPadding ?? this.chipPadding,
      chipShape: chipShape ?? this.chipShape,
      dropdownItemSelectedColor:
      dropdownItemSelectedColor ?? this.dropdownItemSelectedColor,
      dropdownItemStyle: dropdownItemStyle ?? this.dropdownItemStyle,
      dropdownSelectedItemStyle:
      dropdownSelectedItemStyle ?? this.dropdownSelectedItemStyle,
      checkIconTheme: checkIconTheme ?? this.checkIconTheme,
      searchHintStyle: searchHintStyle ?? this.searchHintStyle,
      searchIconTheme: searchIconTheme ?? this.searchIconTheme,
      searchFieldDecoration:
      searchFieldDecoration ?? this.searchFieldDecoration,
      loadingIndicatorSize: loadingIndicatorSize ?? this.loadingIndicatorSize,
      loadingIndicatorColor:
      loadingIndicatorColor ?? this.loadingIndicatorColor,
      loadingTextStyle: loadingTextStyle ?? this.loadingTextStyle,
      noOptionsFoundTextStyle:
      noOptionsFoundTextStyle ?? this.noOptionsFoundTextStyle,
      clearIconTheme: clearIconTheme ?? this.clearIconTheme,
      dropdownArrowSize: dropdownArrowSize ?? this.dropdownArrowSize,
      dropdownArrowEnabledColor:
      dropdownArrowEnabledColor ?? this.dropdownArrowEnabledColor,
      dropdownArrowDisabledColor:
      dropdownArrowDisabledColor ?? this.dropdownArrowDisabledColor,
    );
  }
}