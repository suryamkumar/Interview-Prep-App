import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/core/palletes/colors/colors.dart';
import '../../../core/di/init_dependencies.dart';
import '../../../core/utils/widget/home_app_bar.dart';
import '../../feedback/view/question_detail_page.dart';
import '../../history/view/attempts_history_page.dart';
import '../bloc/home_bloc.dart';
import '../model/question_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const int pageSize = 10;
  final PageController _pageController = PageController();
  int currentPageIndex = 0; // Track current page

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<HomeBloc>()..add(LoadQuestionsEvent()),
      child: Scaffold(
        appBar: homeAppBarWidget(context: context),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is HomeLoaded) {
              final totalPages = (state.questions.length / pageSize).ceil();

              return PageView.builder(
                controller: _pageController,
                itemCount: totalPages,
                onPageChanged: (index) {
                  setState(() {
                    currentPageIndex = index;
                  });
                },
                itemBuilder: (context, pageIndex) {
                  final start = pageIndex * pageSize;
                  final end = (start + pageSize > state.questions.length)
                      ? state.questions.length
                      : start + pageSize;

                  final pageQuestions = state.questions.sublist(start, end);

                  return ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: pageQuestions.length + 1,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      if (index == pageQuestions.length) {
                        return _PageIndicator(
                          currentPage: pageIndex + 1,
                          totalPages: totalPages,
                          pageController: _pageController,
                        );
                      }

                      final q = pageQuestions[index];

                      return Card(
                        elevation: 2,
                        child: ListTile(
                          title: Text(
                            q.question,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          subtitle: Text("${q.role} • ${q.difficulty}"),
                          trailing:
                          const Icon(Icons.arrow_forward_ios, size: 16),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    QuestionDetailPage(question: q),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                },
              );
            }

            if (state is HomeError) {
              return Center(child: Text(state.message));
            }

            return const SizedBox();
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: kPrimary,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AttemptsHistoryPage()),
            );
          },
          child: const Icon(Icons.history, color: kWhite),
        ),
      ),
    );
  }
}

class _PageIndicator extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final PageController pageController;

  const _PageIndicator({
    required this.currentPage,
    required this.totalPages,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Previous button
          IconButton(
            onPressed: currentPage > 1
                ? () {
              pageController.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            }
                : null, // disable on first page
            icon: const Icon(Icons.exposure_minus_1),
            color: currentPage > 1 ? Colors.green : Colors.grey,
          ),

          const SizedBox(width: 16),

          // Page text
          Text(
            "Page $currentPage of $totalPages",
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),

          const SizedBox(width: 16),

          // Next button
          IconButton(
            onPressed: currentPage < totalPages
                ? () {
              pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            }
                : null, // disable on last page
            icon: const Icon(Icons.plus_one),
            color: currentPage < totalPages ? kPrimary : Colors.grey,
          ),
        ],
      ),
    );
  }
}
