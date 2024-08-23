import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:rideshare_app/core/res/app_string.dart';

class IntlPhoneFildWidget extends StatelessWidget {
  const IntlPhoneFildWidget({
    super.key,
    required this.phoneController,
  });
  final TextEditingController phoneController;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: IntlPhoneField(
        controller: phoneController,
        decoration: InputDecoration(
          labelText: AppString().YOURMOBILE,
          border: const OutlineInputBorder(
            borderSide: BorderSide(),
          ),
        ),
        initialCountryCode: 'IN',
      ),
    );
  }
}
