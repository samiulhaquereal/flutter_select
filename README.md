# Retcore Select

![img.png](screenshots/img.png)

<p align="center">
  A flexible and beautiful Select Input control for Flutter, with powerful multi-select, autocomplete, and async support, built to be incredibly customizable.
</p>

<p align="center">
  <!-- Pub.dev Badge -->
  <a href="https://pub.dev/packages/retcore_select"><img src="https://img.shields.io/pub/v/retcore_select.svg" alt="Pub.dev"></a>
  <!-- License Badge -->
  <a href="https://github.com/samiulhaquereal/retcore_select/blob/master/LICENSE"><img src="https://img.shields.io/github/license/samiulhaquereal/retcore_select" alt="License"></a>
  <!-- Popularity Badge -->
  <a href="https://pub.dev/packages/retcore_select"><img src="https://img.shields.io/pub/popularity/retcore_select" alt="Popularity"></a>
</p>

---

Retcore Select is a highly versatile and themeable select component designed to fit perfectly into any Flutter application. Whether you need a simple dropdown, a multi-select with custom chips, or a powerful autocomplete field that fetches data from an API, Retcore Select has you covered.

## Key Features

- **Single & Multi-Select**: Seamlessly switch between single and multi-selection modes with a simple boolean flag.
- **Form Validation**:
  - **Required Fields**: Make any select field mandatory with a simple `isRequired: true` flag.
  - **Custom Logic**: Implement complex rules with an optional `validator` function.
  - **Real-Time Feedback**: Integrates perfectly with `Form`'s `autovalidateMode` for instant user feedback.
- **Fully Themeable**: Use the built-in `InputDecorator` to style the component like a standard `TextField`, or provide a comprehensive `FlutterSelectTheme` for deep customization of every element.
- **Search & Autocomplete**:
    - **Local Filtering**: Instantly search through a predefined list of options.
    - **Async API Search**: Fetch options from your server with built-in debouncing to prevent excessive API calls.
- **Custom Builders**: Take full control over the UI by providing a custom `chipBuilder` for multi-select values.
- **Professional UX**: Includes floating labels, clearable values, disabled states, and elegant loading indicators out of the box.
- **Lightweight & Performant**: Built with Flutter's best practices to ensure smooth performance.

## Installation

Add this to your package's `pubspec.yaml` file:
```
dependencies:
  retcore_select: 
```

## Theme

```flutter
final defaultTheme = RetCoreSelectDefaultTheme.of(context);

final customTheme = defaultTheme.copyWith(
    labelStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.deepPurple,
    ),
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.fromLTRB(12, 16, 12, 16),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(color: Colors.grey.shade400),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(color: Colors.teal, width: 2.0),
      ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade200, width: 2.0),
        )
    ),
    fieldBorderRadius: BorderRadius.circular(12.0),
    placeholderStyle: TextStyle(color: Colors.deepPurple.shade200, fontStyle: FontStyle.italic),
    valueStyle: const TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold),
    floatingLabelStyle: const TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),

    chipBackgroundColor: Colors.deepPurple.shade50,
    chipLabelStyle: const TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.w500),
    chipDeleteIconColor: Colors.deepPurple.shade200,
    chipShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16.0),
      side: BorderSide.none,
    ),

    dropdownItemSelectedColor: Colors.deepPurple.shade400,
    dropdownSelectedItemStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),

    checkIconTheme: const IconThemeData(color: Colors.white, size: 20),
    
    searchIconTheme: const IconThemeData(
      color: Colors.red,
      size: 22,
    ),

    loadingIndicatorColor: Colors.pinkAccent,
    loadingIndicatorSize: 8.0,
    loadingTextStyle: const TextStyle(color: Colors.pinkAccent),
    noOptionsFoundTextStyle: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
  );
```

### Multi-Select

```flutter
RetCoreSelect<String>(
                    label: 'Your Favorite Frameworks',
                    options: options,
                    isSearchable: false,
                    isDisabled: false,
                    isClearable: true,
                    theme: customTheme,
                    values: multiSelectValue.toList(),
                    isMulti: true,
                    placeholder: 'Select your favorite frameworks (multi)...',
                    onValuesChanged: (newValue) => updateMultiSelect(newValue),
                    chipBuilder: (context, value, onDeleted) {
                      return Chip(
                        label: Text(
                          value,
                          style: const TextStyle(color: Colors.white, fontSize: 13),
                        ),
                        onDeleted: onDeleted,
                        backgroundColor: _getColorForFramework(value),
                        deleteIconColor: Colors.white70,
                      );
                    },
                  )
```

### Multi-Select with Fixed Options

```flutter
RetCoreSelect<String>(
                      options: options,
                      isMulti: true,
                      isSearchable: true,
                      isDisabled: false,
                      theme: customTheme,
                      values: multiSelectValueWithFixed.toList(),
                      onValuesChanged: (newValue) => updateMultiSelectWithFixedValue(newValue),
                      placeholder: 'Select your favorite frameworks...',
                      chipBuilder: (context, value, onDeleted) {
                        // --- NEW: Check if the current chip is a fixed one ---
                        final isFixed = fixedOptions.contains(value);

                        return Chip(
                          label: Text(
                            value,
                            style: const TextStyle(color: Colors.white, fontSize: 13),
                          ),
                          // If the option is fixed, pass null to onDeleted to hide the icon.
                          onDeleted: isFixed ? null : onDeleted,
                          backgroundColor: _getColorForFramework(value),
                          deleteIconColor: Colors.white70,
                        );
                      },
                    )
```

### Single-Select

```flutter
RetCoreSelect<String>(
                    options: options,
                    value: singleSelectValue,
                    isMulti: false,
                    isClearable: true,
                    isRequired: true,
                    placeholder: 'Select one framework...',
                    onChanged: (newValue) => updateSingleSelect(newValue),
                  )
```

### Async

```flutter
RetCoreSelect<String>(
                      // The options list is now dynamic, coming from the controller's API results
                      options: apiOptions.toList(),
                      isMulti: true,
                      isSearchable: true,
                      isClearable: true,
                      isFromApi: true,
                      isLoading: isLoading,
                      onSearch: (query) => searchApi(query),
                      values: multiSelectApi.toList(),
                      onValuesChanged: (newValue) => multiSelectApi.assignAll(newValue),
                      placeholder: 'Search for frameworks...',
                    )
```

### `RetCoreSelect` Properties

| Property          | Type                                | Description                                                                                       |
|-------------------|-------------------------------------|---------------------------------------------------------------------------------------------------|
| `options`         | `List<dynamic>`                     | The list of items to display in the dropdown.                                                     |
| `placeholder`     | `String`                            | The text to show when the field is empty and has no label. Defaults to 'Select...'.               |
| `label`           | `String?`                           | The floating label text for the input field.                                                      |
| `isMulti`         | `bool`                              | If `true`, allows multiple values to be selected. Defaults to `false`.                            |
| `isSearchable`    | `bool`                              | If `true`, shows a search bar in the dropdown. Defaults to `false`.                               |
| `isDisabled`      | `bool`                              | If `true`, disables user interaction. Defaults to `false`.                                        |
| `isClearable`     | `bool`                              | If `true`, shows a clear icon to remove all selected values. Defaults to `false`.                 |
| `isFromApi`       | `bool`                              | Set to `true` when using `onSearch` to fetch data from an API. Defaults to `false`.               |
| `isLoading`       | `bool`                              | If `true`, shows loading indicators. Used with `isFromApi`. Defaults to `false`.                  |
| `theme`           | `FlutterSelectTheme?`               | An object to customize the appearance of the widget.                                              |
| `chipBuilder`     | `CustomChipBuilder<T>?`             | A function to build custom widgets for selected items in multi-select mode.                       |
| `onSearch`        | `Function(String)?`                 | A callback that is triggered when the user types in the search field.                             |
| `value`           | `T?`                                | The selected value in single-select mode. **Required if `isMulti` is `false`**.                   |
| `onChanged`       | `Function(T?)?`                     | Callback for value changes in single-select mode. **Required if `isMulti` is `false`**.           |
| `values`          | `List<T>?`                          | The list of selected values in multi-select mode. **Required if `isMulti` is `true`**.            |
| `onValuesChanged` | `Function(List<T>)?`                | Callback for value changes in multi-select mode. **Required if `isMulti` is `true`**.             |
| `isRequired`      | `bool`                              | If `true`, the field must have a value to be valid. Adds a `*` to the label. Defaults to `false`. |
| `validator`       | `FormFieldValidator<List<T>>?`      | An optional function for custom validation logic. Runs after the `isRequired` check.              |

## Contributing

Contributions are welcome! If you find a bug or have a feature request, please open an issue. If you want to contribute code, please open a pull request.

1.  Fork the repository.
2.  Create your feature branch (`git checkout -b feature/AmazingFeature`).
3.  Commit your changes (`git commit -m 'Add some AmazingFeature'`).
4.  Push to the branch (`git push origin feature/AmazingFeature`).
5.  Open a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.


