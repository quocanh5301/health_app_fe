// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:health_app_flutter/feature/exercise/widget/my_calendar.dart';
// import 'package:health_app_flutter/util/date_time.dart';
// import 'package:health_app_flutter/util/injection.dart';
// import 'package:health_app_flutter/util/styles.dart';

// class ExerciseListScreen extends StatelessWidget {
//   const ExerciseListScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider<JournalCubit>(
//       create: (context) => sl<JournalCubit>()
//         ..getJournalsByDay(DateTime.now())
//         ..getFirstModel(),
//       child: BlocBuilder<JournalCubit, JournalState>(
//         buildWhen: (previous, current) =>
//             previous.getJournalStatus != current.getJournalStatus ||
//             previous.deleteJournalStatus != current.deleteJournalStatus ||
//             previous.firstDate != current.firstDate ||
//             previous.choosenDate != current.choosenDate,
//         builder: (context, state) {
//           debugPrint(
//               "ExerciseListScreen getJournalStatus: ${state.getJournalStatus}");
//           debugPrint("ExerciseListScreen journal: ${state.journals}");
//           DateTime focusedDate = (state.choosenDate != "")
//               ? DateTimeHelper.stringToDatetimeFormat4(state.choosenDate)
//               : DateTime.now();
//           DateTime firstDate = (state.firstDate != "")
//               ? DateTimeHelper.stringToDatetimeFormat4(state.firstDate)
//               : DateTime.now();
//           return Scaffold(
//             backgroundColor: "1f2933".toColor(),
//             extendBodyBehindAppBar: true,
//             appBar: AppBar(
//               backgroundColor: Colors.grey.withOpacity(0.3),
//               title: Text(
//                 'Journal List 📒🖋',
//                 style: AppStyles.f20sb().copyWith(
//                   color: "e0e0e0".toColor(),
//                 ),
//               ),
//             ),
//             body: Container(
//               padding: const EdgeInsets.all(20),
//               decoration: BoxDecoration(
//                 borderRadius: const BorderRadius.only(
//                   topLeft: Radius.circular(20),
//                   topRight: Radius.circular(20),
//                 ),
//                 color: "#1f2933".toColor(),
//               ),
//               child: SafeArea(
//                 child: SafeArea(
//                     child: SingleChildScrollView(
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       MyCalendar(
//                         firstDate: firstDate,
//                         focusedDate: focusedDate,
//                       ),
//                       const VerticalSpace(20),
//                       state.journals.isNotEmpty
//                           ? ListView.separated(
//                               physics: const NeverScrollableScrollPhysics(),
//                               shrinkWrap: true,
//                               itemCount: state.journals.length,
//                               separatorBuilder: (context, index) =>
//                                   const VerticalSpace(20),
//                               itemBuilder: (context, index) {
//                                 return Container(
//                                   decoration: BoxDecoration(
//                                     color: Colors.transparent,
//                                     borderRadius: BorderRadius.circular(15),
//                                   ),
//                                   child: IntrinsicHeight(
//                                     child: const SizedBox(),
//                                   ),
//                                 );
//                               },
//                             )
//                           : state.getJournalStatus != GetJournalStatus.getting
//                               ? SizedBox(
//                                   height: AppStyles.screenH / 3.5,
//                                   child: Center(
//                                     child: Text(
//                                       'No journal in choosen day 🤗',
//                                       style: AppStyles.f20sb().copyWith(
//                                         color: "e0e0e0".toColor(),
//                                       ),
//                                     ),
//                                   ),
//                                 )
//                               : const Center(
//                                   child: CircularProgressIndicator(),
//                                 ),
//                     ],
//                   ),
//                 )),
//               ),
//             ),
//             floatingActionButton: FloatingActionButton(
//               backgroundColor: "b0bec5".toColor(),
//               onPressed: () {},
//               child: Icon(
//                 Icons.add,
//                 color: "DBA510".toColor(),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
