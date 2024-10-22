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
  SetAlarmScreen({
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
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              color: Colors.grey[500],
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Customize',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: daysOfWeek.length,
                      itemBuilder: (context, index) {
                        return CheckboxListTile(
                          title: Text(
                            daysOfWeek[index],
                            style: const TextStyle(color: Colors.white),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context, null);
                        },
                        child: const Text("Cancel"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context, selectedDays);
                        },
                        child: const Text("OK"),
                      ),
                    ],
                  ),
                ],
              ),
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
                    RawMaterialButton(
                      onPressed: () => MyOverlayController.showTimePickerDialog(
                        context,
                        currentDate.hour,
                        currentDate.minute,
                        currentDate.second,
                        (timeString) => context
                            .read<AlarmEditCubit>()
                            .setAlarmDateTime(timeString ?? state.dateTime),
                      ),
                      fillColor: Colors.grey[200],
                      child: Container(
                        margin: const EdgeInsets.all(20),
                        child: Text(
                          state.dateTime,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(color: Colors.blueAccent),
                        ),
                      ),
                    ),

                    // Title field
                    _buildTitleField(),

                    // Note field
                    _buildNoteField(),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Loop alarm audio',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Switch(
                          value: state.loopAudio,
                          onChanged: (value) => context
                              .read<AlarmEditCubit>()
                              .setAlarmLoopAudio(value),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Vibrate',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Switch(
                          value: state.vibrate,
                          onChanged: (value) => context
                              .read<AlarmEditCubit>()
                              .setAlarmVibrate(value),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Sound',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          state.volume > 0.7
                              ? Icons.volume_up_rounded
                              : state.volume > 0.1
                                  ? Icons.volume_down_rounded
                                  : Icons.volume_mute_rounded,
                        ),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Repeat',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
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
                    state.repeatOption == RepeatOption.custom
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Customize',
                                style: Theme.of(context).textTheme.titleMedium,
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
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Colors.blueAccent),
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
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Colors.blueAccent),
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
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Expanded(
          child: FormBuilderTextField(
            controller: _titleController,
            name: "alarmTitle",
            style: AppStyles.f15m(),
            keyboardType: TextInputType.text,
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
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Expanded(
          child: FormBuilderTextField(
            controller: _noteController,
            name: "alarmNote",
            style: AppStyles.f15m(),
            keyboardType: TextInputType.text,
            validator: FormBuilderValidators.required(
              errorText: "This field is required",
            ),
          ),
        ),
      ],
    );
  }
}
