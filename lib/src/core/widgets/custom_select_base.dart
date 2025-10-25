import 'package:retcore_select/src/config/import.dart';

// A builder function to create a custom chip widget.
typedef CustomChipBuilder<T> =
    Widget Function(BuildContext context, T value, VoidCallback? onDeleted);

/// The internal stateful widget that powers the CustomSelect.
/// This is not intended to be used directly.
class CustomSelectBase<T> extends StatefulWidget {
  final List<T> options;
  final List<T> value;
  final String placeholder;
  final String? label;
  final bool isMulti,
      isSearchable,
      isDisabled,
      isClearable,
      isFromApi,
      isLoading;
  final FlutterSelectTheme theme;
  final CustomChipBuilder<T>? chipBuilder;
  final Function(List<T> newValue) onChanged;
  final Function(String query)? onSearch;

  const CustomSelectBase({
    super.key,
    required this.options,
    required this.value,
    required this.placeholder,
    this.label,
    required this.isMulti,
    required this.isSearchable,
    required this.isDisabled,
    required this.isClearable,
    required this.isFromApi,
    required this.isLoading,
    required this.theme,
    this.chipBuilder,
    required this.onChanged,
    this.onSearch,
  });

  @override
  State<CustomSelectBase<T>> createState() => _CustomSelectBaseState<T>();
}

class _CustomSelectBaseState<T> extends State<CustomSelectBase<T>> {
  final LayerLink _layerLink = LayerLink();
  TextEditingController? _searchController;
  FocusNode? _searchFocusNode;
  OverlayEntry? _overlayEntry;
  Debouncer? _debouncer;
  List<T> _filteredOptions = [];
  bool _isOverlayVisible = false;

  FlutterSelectTheme get theme => widget.theme;

  @override
  void initState() {
    super.initState();
    _filteredOptions = widget.options;
    if (widget.isSearchable) {
      _searchController = TextEditingController();
      _searchFocusNode = FocusNode();
      _searchController!.addListener(_onSearchChanged);
      if (widget.isFromApi) _debouncer = Debouncer(milliseconds: 500);
    }
  }

  @override
  void dispose() {
    if (widget.isSearchable) {
      _searchController?.removeListener(_onSearchChanged);
      _searchController?.dispose();
      _searchFocusNode?.dispose();
    }
    _debouncer?.dispose();
    _hideOverlay();
    super.dispose();
  }

  @override
  void didUpdateWidget(CustomSelectBase<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.options != oldWidget.options) _filteredOptions = widget.options;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _overlayEntry?.markNeedsBuild();
    });
  }

  void _onSearchChanged() {
    final query = _searchController!.text;
    if (widget.isFromApi) {
      _debouncer?.run(() {
        if (widget.onSearch != null) widget.onSearch!(query);
      });
    } else {
      setState(
        () =>
            _filteredOptions =
                widget.options
                    .where(
                      (o) => o.toString().toLowerCase().contains(
                        query.toLowerCase(),
                      ),
                    )
                    .toList(),
      );
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _overlayEntry?.markNeedsBuild();
    });
  }

  void _toggleOverlay() {
    if (widget.isDisabled) return;
    setState(() => _isOverlayVisible ? _hideOverlay() : _showOverlay());
  }

  void _showOverlay() {
    if (_isOverlayVisible) return;
    _isOverlayVisible = true;
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    _overlayEntry = OverlayEntry(
      builder: (context) {
        return Stack(
          children: [
            Positioned.fill(
              child: GestureDetector(
                onTap: _toggleOverlay,
                behavior: HitTestBehavior.translucent,
              ),
            ),
            CompositedTransformFollower(
              link: _layerLink,
              showWhenUnlinked: false,
              offset: Offset(0.0, size.height + 4.0),
              child: Material(
                elevation: 4.0,
                borderRadius: BorderRadius.circular(8.0),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: size.width,
                    maxHeight: 250,
                  ),
                  child: _buildOptionsList(),
                ),
              ),
            ),
          ],
        );
      },
    );
    Overlay.of(context).insert(_overlayEntry!);
    if (widget.isSearchable) _searchFocusNode?.requestFocus();
  }

  void _hideOverlay() {
    if (!_isOverlayVisible) return;
    _overlayEntry?.remove();
    _overlayEntry = null;
    _isOverlayVisible = false;
    _searchController?.clear();
  }

  void _onOptionSelected(T option) {
    if (widget.isMulti) {
      List<T> newValue = List.from(widget.value);
      if (newValue.contains(option)) {
        newValue.remove(option);
      } else {
        newValue.add(option);
      }
      widget.onChanged(newValue);
    } else {
      widget.onChanged([option]);
      _toggleOverlay();
    }
  }

  void _onChipDeleted(T option) {
    if (widget.isMulti) {
      List<T> newValue = List.from(widget.value);
      newValue.remove(option);
      widget.onChanged(newValue);
    }
  }

  void _clearSelection() => widget.onChanged([]);

  Widget _buildValueDisplay() {
    if (widget.isMulti && widget.value.isNotEmpty) {
      return AbsorbPointer(
        absorbing: widget.isDisabled,
        child: Wrap(
          spacing: 6.0,
          runSpacing: 6.0,
          children:
              widget.value.map((option) {
                onDeleted() => _onChipDeleted(option);
                if (widget.chipBuilder != null) {
                  return widget.chipBuilder!(context, option, onDeleted);
                }
                return Chip(
                  label: Text(option.toString(), style: theme.chipLabelStyle),
                  padding: theme.chipPadding,
                  onDeleted: onDeleted,
                  deleteIconColor: theme.chipDeleteIconColor,
                  backgroundColor: theme.chipBackgroundColor,
                  shape: theme.chipShape,
                );
              }).toList(),
        ),
      );
    }
    if (!widget.isMulti && widget.value.isNotEmpty) {
      return Text(widget.value.first.toString(), style: theme.valueStyle);
    }
    return Text(
      widget.label == null ? widget.placeholder : '',
      style: theme.placeholderStyle,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildOptionsList() {
    final optionsToShow = widget.isFromApi ? widget.options : _filteredOptions;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.isSearchable)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              focusNode: _searchFocusNode,
              decoration: InputDecoration(
                hintText: 'Search...',
                hintStyle: theme.searchHintStyle,
                prefixIcon: const Icon(Icons.search, size: 20),
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              style: const TextStyle(fontSize: 14),
            ),
          ),
        if (widget.isSearchable) const Divider(height: 1),
        if (widget.isFromApi && widget.isLoading)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0),
            child: Center(
              child: Text('Loading...', style: theme.loadingTextStyle),
            ),
          )
        else if (optionsToShow.isEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Center(
              child: Text(
                'No options found.',
                style: theme.noOptionsFoundTextStyle,
              ),
            ),
          )
        else
          Flexible(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: optionsToShow.length,
              itemBuilder: (context, index) {
                final option = optionsToShow[index];
                final bool isSelected = widget.value.contains(option);
                return ListTile(
                  title: Text(
                    option.toString(),
                    style:
                        isSelected
                            ? theme.dropdownSelectedItemStyle
                            : theme.dropdownItemStyle,
                  ),
                  onTap: () => _onOptionSelected(option),
                  selected: isSelected,
                  selectedTileColor: theme.dropdownItemSelectedColor,
                  trailing:
                      (widget.isMulti && isSelected)
                          ? IconTheme(
                            data:
                                theme.checkIconTheme ??
                                Theme.of(context).iconTheme,
                            child: const Icon(Icons.check),
                          )
                          : null,
                  dense: true,
                );
              },
            ),
          ),
      ],
    );
  }

  Widget _buildTrailingIcon() {
    if (widget.isFromApi && widget.isLoading) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: LoadingVibeIndicator(
          dotSize: widget.theme.loadingIndicatorSize ?? 6,
          dotColor: widget.theme.loadingIndicatorColor ?? Colors.grey,
        ),
      );
    }
    return Icon(
      _isOverlayVisible ? Icons.arrow_drop_up : Icons.arrow_drop_down,
      color: widget.isDisabled ? Colors.grey.shade400 : Colors.grey.shade700,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: GestureDetector(
        onTap: _toggleOverlay,
        child: InputDecorator(
          decoration: (theme.decoration ?? InputDecoration()).copyWith(
            labelText: widget.label,
            hintText: widget.label != null ? widget.placeholder : null,
            hintStyle: theme.placeholderStyle,
            labelStyle: theme.labelStyle,
            floatingLabelStyle: theme.floatingLabelStyle,
            filled: widget.isDisabled,
            fillColor: widget.isDisabled ? theme.fieldDisabledColor : null,
            border:
                theme.decoration?.border ??
                OutlineInputBorder(
                  borderRadius:
                      widget.theme.fieldBorderRadius ??
                      BorderRadius.all(Radius.circular(0)),
                ),
            enabledBorder:
                theme.decoration?.enabledBorder ?? const OutlineInputBorder(),
            focusedBorder:
                theme.decoration?.focusedBorder ?? const OutlineInputBorder(),
            contentPadding:
                theme.decoration?.contentPadding ??
                const EdgeInsets.fromLTRB(12, 16, 12, 16),
            disabledBorder:
                theme.decoration?.disabledBorder ??
                OutlineInputBorder(
                  borderSide: BorderSide(
                    color: theme.fieldDisabledColor ?? Colors.grey.shade200,
                    width: 2.0,
                  ),
                ),
          ),
          isFocused: _isOverlayVisible,
          isEmpty: widget.value.isEmpty,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: _buildValueDisplay()),
              if (widget.isClearable &&
                  widget.value.isNotEmpty &&
                  !widget.isDisabled)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GestureDetector(
                    onTap: _clearSelection,
                    child: Icon(
                      Icons.close,
                      size: 18,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ),
              _buildTrailingIcon(),
            ],
          ),
        ),
      ),
    );
  }
}
