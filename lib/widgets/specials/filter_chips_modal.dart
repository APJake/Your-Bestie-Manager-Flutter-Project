import 'package:flutter/material.dart';
import 'package:ybc_manager/utils/app_dimension.dart';
import 'package:ybc_manager/widgets/small_text.dart';

import '../../utils/app_color.dart';

class FilterChipsModal extends StatefulWidget {
  final List<String> items;
  const FilterChipsModal({Key? key, required this.items}) : super(key: key);

  @override
  State<FilterChipsModal> createState() => _FilterChipsModalState();
}

class _FilterChipsModalState extends State<FilterChipsModal> {
  final TextEditingController _filterController = TextEditingController();
  late List<String> selectedChips;

  @override
  void initState() {
    super.initState();
    selectedChips = [];
  }

  Widget _chipItem(chip) => ChoiceChip(
        onSelected: (value) {
          if (value) {
            selectedChips.remove(chip);
          } else {
            selectedChips.add(chip);
          }
          setState(() {
            selectedChips;
          });
        },
        selectedColor: AppColor.secondaryColor,
        label: SmallText(
          text: chip,
          size: AppDimension.normalFont,
        ),
        selected: selectedChips.contains(chip),
      );

  List<Widget> _chips() => widget.items.map((chip) => _chipItem(chip)).toList();

  _chipsView() =>
      Wrap(spacing: 4, alignment: WrapAlignment.start, children: _chips());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          children: [
            TextField(
              controller: _filterController,
              keyboardType: TextInputType.text,
              autocorrect: false,
              enableSuggestions: false,
              decoration: InputDecoration(
                hintText: 'Filter',
                hintStyle: const TextStyle(fontSize: 16),
                prefixIcon: const Icon(
                  Icons.person,
                  color: AppColor.primaryColor,
                ),
                suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      color: AppColor.primaryColor,
                    )),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                filled: true,
                contentPadding: EdgeInsets.all(16),
                fillColor: AppColor.navColor,
              ),
            ),
            const SizedBox(height: 20),
            _chipsView(),
          ],
        ),
      ),
    );
  }
}
