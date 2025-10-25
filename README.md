# Retcore Select

<!-- 
  You can create a simple logo and place it here.
  For example, using a service like Canva or Figma.
-->
<p align="center">
  <img src="![img.png](screenshots/img.png)" alt="Retcore Select Logo" width="200"/>
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

