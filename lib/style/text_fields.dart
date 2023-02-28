
import 'package:flutter/material.dart';

class MyTextFields{

  static Widget shortTextField(TextEditingController controller,BuildContext context,{String? hint}){
    return TextFormField(
      maxLength: 100,
      style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.blueGrey),
      controller: controller,
      validator: (value){
        return value == null || value.isEmpty ? 'Please fill the required field':null;
      },
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.blueGrey.shade200),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.redAccent.shade100),
        ),
        errorStyle: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.redAccent.shade200),
      ),
    );
  }
  static Widget longTextField(TextEditingController controller,BuildContext context,{String? hint}){
    return TextFormField(
      maxLines: 5,
      controller: controller,
      style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.blueGrey),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.blueGrey.shade200),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        )
      ),
    );
  }
  static Widget searchBox(Function(String value) onChanged,BuildContext context,{String? hint}){
    return SizedBox(
      height: 50,
      child: TextFormField(
        maxLines: 1,
        style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.white),
        onChanged: onChanged,
        validator: (value){
          return value == null || value.isEmpty ? 'Please fill the required field':null;
        },
        cursorColor: Colors.white70,
        autofocus: true,
        decoration: InputDecoration(
          hintText: hint,
          isDense: true,                      // Added this
          contentPadding: const EdgeInsets.all(8),
          hintStyle: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.white60),
          suffixIcon: const Icon(Icons.search,color: Colors.white,),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white70),
            borderRadius: BorderRadius.circular(15),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white30),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(15),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.redAccent.shade100),
          ),
          errorStyle: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.redAccent.shade200),
        ),
      ),
    );
  }
}