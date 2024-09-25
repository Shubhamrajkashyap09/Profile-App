import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final String placeholder;
  final IconData? icon;
  final EdgeInsetsGeometry? margin;
  final List<String> options;
  final Function(String)? onChanged;

  const CustomDropdown({
    Key? key,
    required this.placeholder,
    this.icon,
    this.margin,
    required this.options,
    this.onChanged,
  }) : super(key: key);

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String _selectedOption = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          Expanded(
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                isExpanded: true,
                hint: Row(
                  children: [
                    if (widget.icon != null)
                      Icon(
                        widget.icon,
                        color: Color(0xFF0A66C2),
                      ),
                    if (widget.icon != null) SizedBox(width: 10),
                    Text(widget.placeholder),
                  ],
                ),
                value: _selectedOption.isNotEmpty ? _selectedOption : null,
                onChanged: (newValue) {
                  setState(() {
                    _selectedOption = newValue!;
                    widget.onChanged
                        ?.call(newValue); // Use ?.call for null safety
                  });
                },
                items: widget.options.map((option) {
                  return DropdownMenuItem<String>(
                    value: option,
                    child: Row(
                      children: [
                        if (widget.icon != null)
                          Icon(
                            widget.icon,
                            color: Color(0xFF0A66C2),
                          ),
                        if (widget.icon != null) SizedBox(width: 10),
                        Text(option),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
