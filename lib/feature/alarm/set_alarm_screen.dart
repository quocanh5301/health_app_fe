import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:health_app_flutter/data/model/alarm_model.dart';
import 'package:health_app_flutter/feature/alarm/bloc/alarm_edit/alarm_edit_cubit.dart';
import 'package:health_app_flutter/feature/alarm/bloc/alarm_edit/alarm_edit_state.dart';
import 'package:health_app_flutter/feature/alarm/widget/audio_drop_down.dart';
import 'package:health_app_flutter/feature/alarm/widget/repeat_drop_down.dart';
import 'package:health_app_flutter/util/common_widget/overlay/my_overlay_controller.dart';
import 'package:health_app_flutter/util/date_time.dart';
import 'package:health_app_flutter/util/injection.dart';
import 'package:health_app_flutter/util/styles.dart';
import 'package:intl/intl.dart';

class SetAlarmScreen extends StatefulWidget {
  const SetAlarmScreen({
    super.key,
    required this.context,
    required this.alarmModel,
  });

  final BuildContext context;
  final AlarmModel? alarmModel;

  @override
  State<SetAlarmScreen> createState() => _SetAlarmScreenState();
}

class _SetAlarmScreenState extends State<SetAlarmScreen> {
  final _formKey = GlobalKey<FormState>();

  // TextEditingControllers for managing text input
  late TextEditingController _titleController;
  late TextEditingController _noteController;

  @override
  void initState() {
    super.initState();
    debugPrint('SetAlarmScreen: initState ${widget.alarmModel?.title}');
    // Initialize controllers with values from AlarmModel
    _titleController =
        TextEditingController(text: widget.alarmModel?.title ?? '');
    _noteController =
        TextEditingController(text: widget.alarmModel?.note ?? '');
  }

  @override
  void dispose() {
    // Dispose of controllers to avoid memory leaks
    _titleController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  Future<void> _showCustomDayBottomSheet(
    BuildContext parentContext,
    List<int> days,
  ) async {
    final List<String> daysOfWeek = [
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday",
      "Sunday"
    ];
    List<int> selectedDays = [...days];

    List<int>? result = await showModalBottomSheet<List<int>>(
      context: parentContext,
      backgroundColor: Colors.grey[800],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(13),
          topRight: Radius.circular(13),
        ),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Customize days',
                    style: AppStyles.f18m().copyWith(
                      color: Colors.black,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: daysOfWeek.length,
                    itemBuilder: (context, index) {
                      return CheckboxListTile(
                        checkboxShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        fillColor: MaterialStateProperty.all(Colors.grey[200]),
                        checkColor: "DBA510".toColor(),
                        selectedTileColor: Colors.grey[800]!.withOpacity(0.5),
                        overlayColor:
                            MaterialStateProperty.all("b0bec5".toColor()),
                        title: Text(
                          daysOfWeek[index],
                          style: AppStyles.f16m().copyWith(
                            color: Colors.white,
                          ),
                        ),
                        value: selectedDays.contains(index + 1),
                        onChanged: (bool? value) {
                          setState(() {
                            if (value == true) {
                              selectedDays.add(index + 1);
                            } else {
                              selectedDays.remove(index + 1);
                            }
                          });
                        },
                      );
                    },
                  ),
                ),
                const VerticalSpace(7),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context, null);
                        },
                        child: Container(
                          width: AppStyles.width(80),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: "DBA510".toColor(),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              "Cancel",
                              style: AppStyles.f16m()
                                  .copyWith(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context, selectedDays);
                        },
                        child: Container(
                          width: AppStyles.width(80),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: "2A5DAF".toColor(),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              "OK",
                              style: AppStyles.f16m()
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        );
      },
    );

    if (result != null) {
      if (mounted) {
        parentContext.read<AlarmEditCubit>().setAlarmCustomDays(selectedDays);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AlarmEditCubit>(
      create: (context) => sl<AlarmEditCubit>()
        ..setAlarmTitle(widget.alarmModel?.title ?? '')
        ..setAlarmNote(widget.alarmModel?.note ?? '')
        ..setAlarmDateTime(
          DateTimeHelper.format4StringToHHmmss(
              widget.alarmModel?.dateTime ?? DateTimeHelper.getDateTimeToday()),
        )
        ..setAlarmIsActive(widget.alarmModel?.isActive ?? true)
        ..setAlarmVolume(widget.alarmModel?.volume ?? 0.5)
        ..setAlarmLoopAudio(widget.alarmModel?.loopAudio ?? false)
        ..setAlarmVibrate(widget.alarmModel?.vibrate ?? false)
        ..setAlarmAudio(
            widget.alarmModel?.audio ?? 'assets/audio_nature_sounds.mp3')
        ..setAlarmRepeatOption(
            widget.alarmModel?.repeatOption ?? RepeatOption.once)
        ..setAlarmCustomDays(widget.alarmModel?.customDays ?? []),
      child: BlocBuilder<AlarmEditCubit, AlarmEditState>(
        builder: (context, state) {
          DateTime currentDate =
              DateFormat(DateTimeHelper.dateFormat5).parse(state.dateTime);
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Cancel and Save buttons
                    _buildCancelSaveButtons(context, state),

                    // Time picker button
                    InkWell(
                      onTap: () => MyOverlayController.showTimePickerDialog(
                        context,
                        currentDate.hour,
                        currentDate.minute,
                        currentDate.second,
                        (timeString) => context
                            .read<AlarmEditCubit>()
                            .setAlarmDateTime(timeString ?? state.dateTime),
                      ),
                      // fillColor: Colors.grey[200],
                      child: Container(
                        margin: const EdgeInsets.all(20),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: "64b5f6".toColor(),
                        ),
                        child: Text(
                          state.dateTime,
                          style: AppStyles.f20sb()
                              .copyWith(color: Colors.white, fontSize: 30),
                        ),
                      ),
                    ),

                    // Title field
                    _buildTitleField(),
                    const VerticalSpace(12),
                    // Note field
                    _buildNoteField(),
                    const VerticalSpace(12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Loop alarm audio',
                          style: AppStyles.f16m().copyWith(color: Colors.white),
                        ),
                        const HorizontalSpace(12),
                        Switch(
                          value: state.loopAudio,
                          onChanged: (value) => context
                              .read<AlarmEditCubit>()
                              .setAlarmLoopAudio(value),
                        ),
                      ],
                    ),
                    const VerticalSpace(12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Vibrate',
                          style: AppStyles.f16m().copyWith(color: Colors.white),
                        ),
                        const HorizontalSpace(12),
                        Switch(
                          value: state.vibrate,
                          onChanged: (value) => context
                              .read<AlarmEditCubit>()
                              .setAlarmVibrate(value),
                        ),
                      ],
                    ),
                    const VerticalSpace(12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Sound',
                          style: AppStyles.f16m().copyWith(color: Colors.white),
                        ),
                        const HorizontalSpace(12),
                        Expanded(
                          child: AudioDropDown(
                            audio: state.audio,
                            onchange: (value) =>
                                context.read<AlarmEditCubit>().setAlarmAudio(
                                      value ?? state.audio,
                                    ),
                          ),
                        ),
                      ],
                    ),
                    const VerticalSpace(12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          state.volume > 0.7
                              ? Icons.volume_up_rounded
                              : state.volume > 0.1
                                  ? Icons.volume_down_rounded
                                  : Icons.volume_mute_rounded,
                          color: Colors.white,
                        ),
                        const HorizontalSpace(12),
                        Expanded(
                          child: Slider(
                            value: state.volume,
                            onChanged: (value) => context
                                .read<AlarmEditCubit>()
                                .setAlarmVolume(value),
                          ),
                        ),
                      ],
                    ),
                    const VerticalSpace(12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Repeat',
                          style: AppStyles.f16m().copyWith(color: Colors.white),
                        ),
                        const HorizontalSpace(12),
                        Expanded(
                          child: RepeatOptionDropDown(
                            repeatOption: state.repeatOption,
                            onchange: (value) => context
                                .read<AlarmEditCubit>()
                                .setAlarmRepeatOption(
                                  value ?? state.repeatOption,
                                ),
                          ),
                        ),
                      ],
                    ),
                    const VerticalSpace(12),
                    state.repeatOption == RepeatOption.custom
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Customize',
                                style: AppStyles.f16m()
                                    .copyWith(color: Colors.white),
                              ),
                              TextButton(
                                onPressed: () => _showCustomDayBottomSheet(
                                  context,
                                  state.customDays,
                                ),
                                child: const Icon(Icons.edit),
                              ),
                            ],
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCancelSaveButtons(BuildContext context, AlarmEditState state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () => Navigator.pop(context, null),
          child: Text(
            'Cancel',
            style: AppStyles.f20m().copyWith(color: "89C8FE".toColor()),
          ),
        ),
        TextButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              final alarm = AlarmModel(
                id: widget.alarmModel?.id ?? 0,
                title: _titleController.text,
                note: _noteController.text,
                dateTime: DateTimeHelper.convertFormat5ToFormat4String(
                    state.dateTime),
                isActive: state.isActive,
                volume: state.volume,
                loopAudio: state.loopAudio,
                vibrate: state.vibrate,
                audio: state.audio,
                repeatOption: state.repeatOption,
                customDays: state.customDays,
              );
              Navigator.pop(context, alarm);
            }
          },
          child: Text(
            'Save',
            style: AppStyles.f20m().copyWith(color: "89C8FE".toColor()),
          ),
        ),
      ],
    );
  }

  Widget _buildTitleField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Title',
          style: AppStyles.f16m().copyWith(color: Colors.white),
        ),
        const HorizontalSpace(12),
        Expanded(
          child: FormBuilderTextField(
            controller: _titleController,
            name: "alarmTitle",
            style: AppStyles.f15m().copyWith(color: Colors.white),
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              isDense: true,
              hintText: "enter title",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: '#08357C'.toColor(),
                  width: 2,
                ),
              ),
              hintStyle: AppStyles.f16m().copyWith(color: Colors.white),
            ),
            validator: FormBuilderValidators.required(
              errorText: "This field is required",
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNoteField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Note',
          style: AppStyles.f16m().copyWith(color: Colors.white),
        ),
        const HorizontalSpace(12),
        Expanded(
          child: FormBuilderTextField(
            controller: _noteController,
            name: "alarmNote",
            style: AppStyles.f15m().copyWith(color: Colors.white),
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              isDense: true,
              hintText: "enter note",
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: '#08357C'.toColor(),
                  width: 2,
                ),
              ),
              hintStyle: AppStyles.f16m().copyWith(color: Colors.white),
            ),
            validator: FormBuilderValidators.required(
              errorText: "This field is required",
            ),
          ),
        ),
      ],
    );
  }
}
