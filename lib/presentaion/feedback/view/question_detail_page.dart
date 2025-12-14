import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/core/utils/extensions/styles.dart';
import '../../../core/di/init_dependencies.dart';
import '../../../core/palletes/colors/colors.dart';
import '../../../core/utils/helper/tag.dart';
import '../../../core/utils/widget/app_bar.dart';
import '../../../core/utils/widget/loading_widget.dart';
import '../../auth/view/widget/auth_button.dart';
import '../../home/model/question_model.dart';
import '../bloc/question_detail_bloc.dart';

class QuestionDetailPage extends StatefulWidget {
  final QuestionModel question;

  const QuestionDetailPage({super.key, required this.question});

  @override
  State<QuestionDetailPage> createState() => _QuestionDetailPageState();
}

class _QuestionDetailPageState extends State<QuestionDetailPage> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<QuestionDetailBloc>(),
      child: Scaffold(
        appBar: appBarWidget(
          context: context,
          title: "Answer Question",
          automaticallyImplyLeading: true,
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
          child: BlocBuilder<QuestionDetailBloc, QuestionDetailState>(
            builder: (context, state) {
              final isLoading = state is QuestionDetailLoading;

              return AuthButtonWidget(
                color: isLoading ? Colors.grey : kPrimary,
                onPressed: isLoading
                    ? null
                    : () {
                  FocusScope.of(context).unfocus();

                  context.read<QuestionDetailBloc>().add(
                    SubmitAnswerEvent(
                      questionId: widget.question.id,
                      questionText: widget.question.question,
                      answer: _controller.text.trim(),
                    ),
                  );
                },
                child: isLoading
                    ? const LoadingWidget()
                    : Text(
                  "Submit Answer",
                  style: context.bodyLarge.copyWith(
                    color: kWhite,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: kPrimary.withValues(alpha: 0.2),
                    width: 1.0,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: kPrimary.withValues(alpha: 0.04),
                      spreadRadius: 0,
                      blurRadius: 20,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.question.question,
                        style: context.titleMedium.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          TagChip(text: widget.question.role),
                          const SizedBox(width: 8),
                          TagChip(text: widget.question.difficulty),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// ANSWER INPUT
              Text(
                "Your Answer",
                style: context.bodyLarge.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _controller,
                maxLines: 6,
                decoration: InputDecoration(
                  hintText: "Write your answer here...",
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              BlocConsumer<QuestionDetailBloc, QuestionDetailState>(
                listener: (context, state) {
                  if (state is QuestionSubmitted) {
                    _showScoreDialog(context, state.score, state.feedback);
                  }
                },
                builder: (_, __) => const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showScoreDialog(BuildContext context, int score, String feedback) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: kPrimary.withOpacity(0.1),
                child: Icon(
                  Icons.star,
                  size: 32,
                  color: kPrimary,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "Your Score",
                style: context.titleMedium.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "$score / 5",
                style: context.bodyMedium.copyWith(
                  color: kPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                feedback,
                textAlign: TextAlign.center,
                style: context.bodyMedium,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    "Done",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
