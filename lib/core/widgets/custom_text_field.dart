import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomTextField extends StatelessWidget {
  final Key? keyField;
  final TextEditingController? controller;
  final String? hinText;
  final TextInputType? keyboardType;
  final bool autocorrect;
  final bool obscureText;
  final bool enableSuggestions;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;
  final Function(String?)? onChanged;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextField({
    Key? key,
    this.keyField,
    this.controller,
    this.hinText,
    this.keyboardType,
    this.autocorrect = false,
    this.obscureText = false,
    this.enableSuggestions = true,
    this.validator,
    this.onSaved,
    this.onChanged,
    this.inputFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: keyField,
      controller: controller,
      onSaved: onSaved,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        hintText: hinText ?? AppLocalizations.of(context)!.enterText,
        labelText: hinText ?? AppLocalizations.of(context)!.enterText,
      ),
      inputFormatters: inputFormatters,
      validator: validator,
      onChanged: onChanged,
      keyboardType: keyboardType ?? TextInputType.text,
      obscureText: obscureText,
      enableSuggestions: enableSuggestions,
      autocorrect: autocorrect,
    );
  }
}
