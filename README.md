# Retcore Select

<!-- 
  You can create a simple logo and place it here.
  For example, using a service like Canva or Figma.
-->
<p align="center">
  ![img.png](screenshots/img.png)
</p>

<p align="center">
  A flexible and beautiful Select Input control for Flutter, with powerful multi-select, autocomplete, and async support, built to be incredibly customizable.
</p>

<p align="center">
  <!-- Pub.dev Badge -->
  <a href="https://pub.dev/packages/retcore_select"><img src="https://img.shields.io/pub/v/retcore_select.svg" alt="Pub.dev"></a>
  <!-- License Badge -->
  <a href="https://github.com/your_username/retcore_select/blob/main/LICENSE"><img src="https://img.shields.io/github/license/your_username/retcore_select" alt="License"></a>
  <!-- Popularity Badge -->
  <a href="https://pub.dev/packages/retcore_select"><img src="https://img.shields.io/pub/popularity/retcore_select" alt="Popularity"></a>
</p>

---

Retcore Select is a highly versatile and themeable select component designed to fit perfectly into any Flutter application. Whether you need a simple dropdown, a multi-select with custom chips, or a powerful autocomplete field that fetches data from an API, Retcore Select has you covered.

## Key Features

- **Single & Multi-Select**: Seamlessly switch between single and multi-selection modes with a simple boolean flag.
- **Fully Themeable**: Use the built-in `InputDecorator` to style the component like a standard `TextField`, or provide a comprehensive `FlutterSelectTheme` for deep customization of every element.
- **Search & Autocomplete**:
    - **Local Filtering**: Instantly search through a predefined list of options.
    - **Async API Search**: Fetch options from your server with built-in debouncing to prevent excessive API calls.
- **Custom Builders**: Take full control over the UI by providing a custom `chipBuilder` for multi-select values.
- **Professional UX**: Includes floating labels, clearable values, disabled states, and elegant loading indicators out of the box.
- **Lightweight & Performant**: Built with Flutter's best practices to ensure smooth performance.

## Installation

Add this to your package's `pubspec.yaml` file:


### `RetCoreSelect` Properties

| Property         | Type                     | Description                                                                                             |
|------------------|--------------------------|---------------------------------------------------------------------------------------------------------|
| `options`        | `List<dynamic>`          | The list of items to display in the dropdown.                                                           |
| `placeholder`    | `String`                 | The text to show when the field is empty and has no label. Defaults to 'Select...'.                     |
| `label`          | `String?`                | The floating label text for the input field.                                                            |
| `isMulti`        | `bool`                   | If `true`, allows multiple values to be selected. Defaults to `false`.                                   |
| `isSearchable`   | `bool`                   | If `true`, shows a search bar in the dropdown. Defaults to `false`.                                     |
| `isDisabled`     | `bool`                   | If `true`, disables user interaction. Defaults to `false`.                                              |
| `isClearable`    | `bool`                   | If `true`, shows a clear icon to remove all selected values. Defaults to `false`.                       |
| `isFromApi`      | `bool`                   | Set to `true` when using `onSearch` to fetch data from an API. Defaults to `false`.                       |
| `isLoading`      | `bool`                   | If `true`, shows loading indicators. Used with `isFromApi`. Defaults to `false`.                          |
| `theme`          | `FlutterSelectTheme?`    | An object to customize the appearance of the widget.                                                    |
| `chipBuilder`    | `CustomChipBuilder<T>?`  | A function to build custom widgets for selected items in multi-select mode.                             |
| `onSearch`       | `Function(String)?`      | A callback that is triggered when the user types in the search field.                                   |
| `value`          | `T?`                     | The selected value in single-select mode. **Required if `isMulti` is `false`**.                           |
| `onChanged`      | `Function(T?)?`          | Callback for value changes in single-select mode. **Required if `isMulti` is `false`**.                   |
| `values`         | `List<T>?`               | The list of selected values in multi-select mode. **Required if `isMulti` is `true`**.                     |
| `onValuesChanged`| `Function(List<T>)?`   | Callback for value changes in multi-select mode. **Required if `isMulti` is `true`**.                     |

## Contributing

Contributions are welcome! If you find a bug or have a feature request, please open an issue. If you want to contribute code, please open a pull request.

1.  Fork the repository.
2.  Create your feature branch (`git checkout -b feature/AmazingFeature`).
3.  Commit your changes (`git commit -m 'Add some AmazingFeature'`).
4.  Push to the branch (`git push origin feature/AmazingFeature`).
5.  Open a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.


