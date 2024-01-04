part of '../index.dart';

class DefaultDropdown extends StatelessWidget {
  final String selectedValue;
  final List<String> listData;
  final List<dynamic>? listDataObject;
  final String title;
  final String keyLabel;
  final String keyValue;
  final dynamic onSelected;
  final double titleSpace;
  final double belowSpace;
  final dynamic controller;
  final Color inputColor;
  final String placeholder;

  const DefaultDropdown(
      {this.listData = const <String>[],
      this.listDataObject,
      this.placeholder = '',
      this.selectedValue = '',
      this.titleSpace = 7,
      this.belowSpace = 0,
      this.title = '',
      this.onSelected,
      this.controller,
      this.keyLabel = '',
      this.keyValue = '',
      this.inputColor = const Color(OurColors.superLightBlue),
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(title),
        SizedBox(
          height: titleSpace,
        ),
        DropdownMenu(
            hintText: placeholder,
            controller: controller,
            // requestFocusOnTap: true, show input
            onSelected: onSelected,
            width: MediaQuery.of(context).size.width * 0.89,
            inputDecorationTheme: InputDecorationTheme(
                isDense: true,
                hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.normal),
                filled: true,
                fillColor: inputColor,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                        color: Color(OurColors.darkBlue), width: 0.3))),
            // initialSelection: listData.first,
            dropdownMenuEntries: keyLabel != '' &&
                    keyValue != '' &&
                    listDataObject != null
                ? listDataObject!.map<DropdownMenuEntry<String>>((dynamic val) {
                    return DropdownMenuEntry(
                        label: val[keyLabel], value: val[keyValue]);
                  }).toList()
                : listData.map<DropdownMenuEntry<String>>((String val) {
                    return DropdownMenuEntry(value: val, label: val);
                  }).toList()),
        SizedBox(
          height: titleSpace + 4,
        ),
      ],
    );
  }
}
