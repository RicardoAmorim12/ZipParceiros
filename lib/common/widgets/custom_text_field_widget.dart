import 'package:country_code_picker/country_code_picker.dart';
import 'package:fastdelivery_multivendor_restaurant/util/dimensions.dart';
import 'package:fastdelivery_multivendor_restaurant/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'code_picker_widget.dart';

class CustomTextFieldWidget extends StatefulWidget {
  final String hintText;
  final String? titleText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final bool isPassword;
  final Function? onChanged;
  final Function? onSubmit;
  final bool isEnabled;
  final int maxLines;
  final TextCapitalization capitalization;
  final String? prefixImage;
  final IconData? prefixIcon;
  final bool divider;
  final bool showTitle;
  final bool isAmount;
  final bool isNumber;
  final bool isPhone;
  final String? countryDialCode;
  final Function(CountryCode countryCode)? onCountryChanged;
  final bool showBorder;
  final double iconSize;
  final bool isRequired;
  final Color? borderColor;

  const CustomTextFieldWidget({
    super.key,
    this.hintText = 'Write something...',
    this.titleText,
    this.controller,
    this.focusNode,
    this.nextFocus,
    this.isEnabled = true,
    this.inputType = TextInputType.text,
    this.inputAction = TextInputAction.next,
    this.maxLines = 1,
    this.onSubmit,
    this.onChanged,
    this.prefixImage,
    this.prefixIcon,
    this.capitalization = TextCapitalization.none,
    this.isPassword = false,
    this.divider = false,
    this.showTitle = false,
    this.isAmount = false,
    this.isNumber = false,
    this.isPhone = false,
    this.countryDialCode,
    this.onCountryChanged,
    this.showBorder = true,
    this.iconSize = 18,
    this.isRequired = false,
    this.borderColor,
  });

  @override
  CustomTextFieldWidgetState createState() => CustomTextFieldWidgetState();
}

class CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

      widget.showTitle ? Text(widget.titleText ?? widget.hintText, style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeSmall)) : const SizedBox(),
      SizedBox(height: widget.showTitle ? Dimensions.paddingSizeExtraSmall : 0),

      TextField(
        maxLines: widget.maxLines,
        controller: widget.controller,
        focusNode: widget.focusNode,
        style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeLarge),
        textInputAction: widget.inputAction,
        keyboardType: widget.isAmount ? TextInputType.number : widget.inputType,
        cursorColor: Theme.of(context).primaryColor,
        textCapitalization: widget.capitalization,
        enabled: widget.isEnabled,
        autofocus: false,
        autofillHints: widget.inputType == TextInputType.name ? [AutofillHints.name]
            : widget.inputType == TextInputType.emailAddress ? [AutofillHints.email]
            : widget.inputType == TextInputType.phone ? [AutofillHints.telephoneNumber]
            : widget.inputType == TextInputType.streetAddress ? [AutofillHints.fullStreetAddress]
            : widget.inputType == TextInputType.url ? [AutofillHints.url]
            : widget.inputType == TextInputType.visiblePassword ? [AutofillHints.password] : null,
        obscureText: widget.isPassword ? _obscureText : false,
        inputFormatters: widget.inputType == TextInputType.phone ? <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp('[0-9+]'))]
            : widget.isAmount ? [FilteringTextInputFormatter.allow(RegExp(r'\d'))] : widget.isNumber ? [FilteringTextInputFormatter.allow(RegExp(r'\d'))] : null,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
            borderSide: BorderSide(style: widget.showBorder ? BorderStyle.solid : BorderStyle.none, width: 1, color: widget.borderColor?.withOpacity(0.5) ?? Theme.of(context).primaryColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
            borderSide: BorderSide(style: widget.showBorder ? BorderStyle.solid : BorderStyle.none, width: 1, color: widget.borderColor?.withOpacity(0.5) ?? Theme.of(context).primaryColor),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
            borderSide: BorderSide(style: widget.showBorder ? BorderStyle.solid : BorderStyle.none, width: 1, color: widget.borderColor?.withOpacity(0.5) ?? Theme.of(context).primaryColor),
          ),
          isDense: true,
          hintText: widget.hintText,
          fillColor: Theme.of(context).cardColor,
          hintStyle: robotoRegular.copyWith(fontSize: Dimensions.fontSizeLarge, color: Theme.of(context).hintColor),
          filled: true,
          prefixIcon: widget.isPhone ? SizedBox(width: 95, child: Row(children: [
            Container(
                width: 85,height: 50,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radiusSmall),
                    bottomLeft: Radius.circular(Dimensions.radiusSmall),
                  ),
                ),
                margin: const EdgeInsets.only(right: 0),
                padding: const EdgeInsets.only(left: 5),
                child: Center(
                  child: CodePickerWidget(
                    flagWidth: 25,
                    padding: EdgeInsets.zero,
                    onChanged: widget.onCountryChanged,
                    initialSelection: widget.countryDialCode,
                    favorite: [widget.countryDialCode!],
                    textStyle: robotoRegular.copyWith(
                      fontSize: Dimensions.fontSizeDefault, color: Theme.of(context).textTheme.bodyMedium!.color,
                    ),
                  ),
                )),

            Container(
              height: 20, width: 2,
              color: Theme.of(context).disabledColor,
            )
          ]),
          ) : widget.prefixImage != null && widget.prefixIcon == null ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall),
            child: Image.asset(widget.prefixImage!, height: 20, width: 20),
          ) : widget.prefixImage == null && widget.prefixIcon != null ? Icon(widget.prefixIcon, size: widget.iconSize) : null,
          suffixIcon: widget.isPassword ? IconButton(
            icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility, color: Theme.of(context).hintColor.withOpacity(0.3)),
            onPressed: _toggle,
          ) : null,
        ),
        onSubmitted: (text) => widget.nextFocus != null ? FocusScope.of(context).requestFocus(widget.nextFocus)
            : widget.onSubmit != null ? widget.onSubmit!(text) : null,
        onChanged: widget.onChanged as void Function(String)?,
      ),

      widget.divider ? const Padding(padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge), child: Divider()) : const SizedBox(),
    ]);
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}