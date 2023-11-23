import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app_windows/app/constants.dart';

import '../../resources/color_manager.dart';
import '../../resources/theme_manager.dart';
import '../../resources/values_manager.dart';

class TextFormComponents {
  static Widget form(
      String label,
      BuildContext context,
      TextEditingController controller,
      TextInputType keyboardType,
      bool obscureText,
      {
        int textLength = 40,
        FocusNode? focusNode,
        Function(String)? onFieldSubmitted,
        Function(String)? onChange}
      )=>
      TextFormField(
        style: Theme.of(context).textTheme.labelMedium,
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        obscuringCharacter: '*',
        focusNode: focusNode,
        textInputAction: TextInputAction.done,
        onFieldSubmitted: onFieldSubmitted,
        onChanged: onChange,
        inputFormatters: [
          LengthLimitingTextInputFormatter(textLength)
        ],
        decoration: InputDecoration.collapsed(
            hintText: label,
            hintStyle: Theme.of(context).textTheme.displayMedium!
                .copyWith(color: (AppTheme.of(context)!.isDark ? ColorManager.white : ColorManager.black).withOpacity(OpacitySize.o50))),
    );

  static Widget customForm(
      String label,
      BuildContext context,
      TextEditingController controller,
      TextInputType keyboardType,
      bool obscureText,
      IconData icon,
      {
      int textLength = 40,
      FocusNode? focusNode,
      Function(String)? onFieldSubmitted,
      bool isPhoneNumber = false,
      Function(String)? countryCode,
      String? errorMessage,
      bool isError = false,
      Function(String)? onChange
      }
      ) => _CustomForm(
    label,
    context,
    controller,
    keyboardType,
    obscureText,
    icon,
    textLength: textLength,
    focusNode: focusNode,
    onFieldSubmitted: onFieldSubmitted,
    isPhoneNumber: isPhoneNumber,
    countryCode: countryCode,
    onChange: onChange,
    isError: isError,
    errorMessage: errorMessage,);
}

class _CustomForm extends StatefulWidget{
  String label;
  BuildContext context;
  TextEditingController controller;
  TextInputType keyboardType;
  bool obscureText;
  IconData icon;
  int textLength = 40;
  FocusNode? focusNode;
  bool isPhoneNumber = false;
  bool isError;
  String? errorMessage;
  Function(String)? onFieldSubmitted;
  Function(String)? countryCode;
  Function(String)? onChange;
  _CustomForm(
    this.label,
      this.context,
      this.controller,
      this.keyboardType,
      this.obscureText,
      this.icon,
  {
    this.textLength = 40,
    this.focusNode,
    this.onFieldSubmitted,
    this.isPhoneNumber = false,
    this.countryCode,
    this.isError = false,
    this.errorMessage,
  this.onChange}
  );
  @override
  State<StatefulWidget> createState() => _CustomFormState();
}

class _CustomFormState extends State<_CustomForm>{
  String value = Constants.countryCodesGroup[0];
  @override
  Widget build(BuildContext context) {
    // Update The Callback Function
    if(widget.countryCode != null) widget.countryCode!(value);
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(widget.icon,color: (widget.isError ? ColorManager.darkRed : Theme.of(context).iconTheme.color!).withOpacity(OpacitySize.o50),size: AppSize.dynamicSize(5),),
        SizedBox(width: AppSize.dynamicSize(3),),
        widget.isPhoneNumber ? Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: DropdownButton(
                  value: value,
                  menuMaxHeight: AppSize.dynamicSize(34) * 3,
                  underline: const SizedBox(),
                  borderRadius: BorderRadius.circular(BorderRadiusSize.dynamicSize(6)),
                  icon: null,
                  iconSize: 0,
                  items: <DropdownMenuItem<String>>[
                    ...Constants.countryCodesGroup.map((e) {
                      return DropdownMenuItem(value: e,child: Text(e, style: Theme.of(context).textTheme.labelMedium,),);
                    })
                  ], onChanged: (String? newValue){
                    setState(() {
                      value = newValue!;
                    });
              }),
            ),
            SizedBox(width: AppSize.dynamicSize(1),)
          ],
        ) : const SizedBox(height: 1,),

        Container(
          child: Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Form
                Container(
                  padding: EdgeInsets.symmetric(vertical: AppSize.dynamicSize(1)),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                            color: widget.isError ?
                                AppTheme.of(context)!.isDark ? ColorManager.darkRed.withOpacity(OpacitySize.o20) : ColorManager.darkRed.withOpacity(OpacitySize.o20)
                                    :
                                AppTheme.of(context)!.isDark ? ColorManager.white.withOpacity(OpacitySize.o20) : ColorManager.black.withOpacity(OpacitySize.o20),
                          )
                      )
                  ),
                  child: TextFormComponents.form(
                      widget.label,
                      context,
                      widget.controller,
                      widget.keyboardType,
                      widget.obscureText,
                      focusNode: widget.focusNode,
                      onFieldSubmitted: widget.onFieldSubmitted,
                    onChange: widget.onChange
                  ),
                ),
                // Error message
                widget.isError ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // SizedBox(height: AppSize.s1,),
                    widget.errorMessage != null ? Text(widget.errorMessage!, style: Theme.of(context).textTheme.labelSmall!.copyWith(color: ColorManager.darkRed),) : const SizedBox()
                  ],
                ) : const SizedBox()
              ],
            ),
          ),
        )
      ],
    );
  }
}

