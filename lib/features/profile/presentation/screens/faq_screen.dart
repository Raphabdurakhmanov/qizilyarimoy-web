import 'package:app/config/assets.dart';
import 'package:app/config/constants.dart';
import 'package:app/config/text_styles.dart';
import 'package:app/config/widgets/custom_button.dart';
import 'package:app/config/widgets/custom_shimmer.dart';
import 'package:app/config/widgets/image_widget.dart';
import 'package:app/config/widgets/no_internet_widget.dart';
import 'package:app/core/error/failure.dart';
import 'package:app/features/profile/domain/entities/guideline_entity.dart';
import 'package:app/features/profile/presentation/bloc/guideline/guideline_bloc.dart';
import 'package:app/features/profile/presentation/screens/faq_detail_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  final _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    context.read<GuidelineBloc>().add(GuidelineEvent.fetchGuidelines());
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<GuidelineBloc>().add(GuidelineEvent.fetchGuidelines());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'user_manual'.tr(),
          style: AppTextStyles.titleSmall.copyWith(fontSize: 16),
        ),
        backgroundColor: Colors.white,
        leading: CustomBackButton(),
      ),
      body: BlocBuilder<GuidelineBloc, GuidelineState>(
        builder: (context, state) {
          return state.when(
            initial: () => SizedBox.shrink(),
            loading:
                () => ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppConstants.defaultPadding,
                        vertical: AppConstants.defaultPadding / 2,
                      ),
                      child: CustomShimmer(height: 60, width: double.infinity),
                    );
                  },
                  itemCount: 5,
                ),
            loaded: (faqList, hasReachedMax) {
              if (faqList.isEmpty) {
                return Center(child: Text("no_faqs_found".tr()));
              }
              return ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: hasReachedMax ? faqList.length : faqList.length + 1,
                itemBuilder: (context, index) {
                  if (index >= faqList.length) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  final faqItem = faqList[index];
                  return _FaqListItem(
                    guideline: faqItem,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => FaqDetailScreen(guideline: faqItem),
                        ),
                      );
                    },
                  );
                },
              );
            },
            error: (failure) {
              if (failure is NetworkFailure) {
                return NoInternetWidget(
                  onRetry: () {
                    context.read<GuidelineBloc>().add(
                      GuidelineEvent.fetchGuidelines(),
                    );
                  },
                );
              } else {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(failure.message),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          context.read<GuidelineBloc>().add(
                            GuidelineEvent.fetchGuidelines(),
                          );
                        },
                        child: Text('retry'.tr()),
                      ),
                    ],
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}

class _FaqListItem extends StatelessWidget {
  final GuidelineEntity guideline;
  final VoidCallback onTap;

  const _FaqListItem({required this.guideline, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              SvgWidget(
                icon: Assets.assetsIconsDocument,
                width: 24,
                height: 24,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  guideline.title,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
