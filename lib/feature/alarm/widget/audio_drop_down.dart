import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:health_app_flutter/util/styles.dart';

class AudioDropDown extends StatefulWidget {
  final Function(String?) onchange;
  final String audio;

  const AudioDropDown({
    super.key,
    required this.onchange,
    required this.audio,
  });

  @override
  State<AudioDropDown> createState() => _MyDropDownState();
}

class _MyDropDownState extends State<AudioDropDown> {
  String choosenAudio = "";
  final Map<String, String> filter = {
    "assets/audio_count_down.mp3": "count down",
    "assets/audio_goggin_dont_care.mp3": "dont care",
    "assets/audio_hurry_up.mp3": "hurry up",
    "assets/audio_its_time_fo_scoo.mp3": "time fo scoo",
    "assets/audio_just_do_it.mp3": "just do it",
    "assets/audio_nature_sounds.mp3": "nature sounds",
    "assets/audio_riot.mp3": "riot",
  };

  @override
  void initState() {
    choosenAudio = widget.audio;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<String>(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: AppStyles.width(10),
          vertical: AppStyles.width(5),
        ),
        constraints: BoxConstraints.tight(
          Size.fromHeight(AppStyles.height(45)),
        ),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.black,
            width: 5,
          ),
        ),
      ),
      isExpanded: true,
      value: choosenAudio,
      onChanged: (value) {
        widget.onchange(value);
        if (value != null) {
          setState(() {
            choosenAudio = value;
          });
        }
      },
      dropdownStyleData: DropdownStyleData(
        maxHeight: AppStyles.height(200),
        offset: const Offset(0, -5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
      menuItemStyleData: MenuItemStyleData(
        height: AppStyles.height(60),
        padding: EdgeInsets.only(left: AppStyles.width(15)),
      ),
      items: filter.entries
          .map<DropdownMenuItem<String>>(
            (entry) => DropdownMenuItem<String>(
              value: entry.key, // Use the audio path as the value
              alignment: AlignmentDirectional.centerStart,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    entry.value, // Display the audio label (e.g. "count down")
                    style: AppStyles.f14m().copyWith(
                      color: "#08357C".toColor(),
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
