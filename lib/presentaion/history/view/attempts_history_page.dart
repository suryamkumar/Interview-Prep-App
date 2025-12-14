import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/di/init_dependencies.dart';
import '../../../core/utils/widget/app_bar.dart';
import '../bloc/attempt_bloc.dart';
import '../model/attempt_model.dart';

class AttemptsHistoryPage extends StatelessWidget {
  const AttemptsHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<AttemptBloc>()..add(LoadAttemptsEvent()),
      child: Scaffold(
        appBar: appBarWidget(context: context, title: "Attempt Question", automaticallyImplyLeading: true),
        body: BlocBuilder<AttemptBloc, AttemptState>(
          builder: (context, state) {
            if (state is AttemptsLoaded) {
              if (state.attempts.isEmpty) {
                return const Center(child: Text("No attempts yet"));
              }

              return ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: state.attempts.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (_, index) {
                  final AttemptModel a = state.attempts[index];

                  return Card(
                    child: ListTile(
                      title: Text(
                        a.questionText,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 4),
                          Text("Answer: ${a.answer}"),
                          Text("Score: ${a.score}/5"),
                        ],
                      ),
                      trailing: Text(
                        "${a.dateTime.day}/${a.dateTime.month}",
                      ),
                    ),
                  );
                },
              );
            }

            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
