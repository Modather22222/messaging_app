import 'package:flutter/material.dart';
import 'package:messaging_app/utils/app_constants.dart';

class SearchBarWidget extends StatelessWidget {
  final String hintText;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;

  const SearchBarWidget({
    super.key,
    required this.hintText,
    this.onChanged,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: AppConstants.grey),
        prefixIcon: const Icon(Icons.search, color: AppConstants.grey),
        filled: true,
        fillColor: AppConstants.lightGrey,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppConstants.paddingMedium),
          ),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
