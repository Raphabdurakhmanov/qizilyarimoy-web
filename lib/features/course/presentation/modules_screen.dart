import 'package:app/config/assets.dart';
import 'package:app/config/text_styles.dart';
import 'package:app/config/widgets/custom_button.dart';
import 'package:app/features/course/presentation/bloc/course_details/course_details_bloc.dart';
import 'package:app/features/course/presentation/widgets/module_tile.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ModulesScreen extends StatefulWidget {
  const ModulesScreen({super.key, required this.activeLesson});
  final int activeLesson;
  @override
  State<ModulesScreen> createState() => _ModulesScreenState();
}

class _ModulesScreenState extends State<ModulesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox.shrink(),
        leadingWidth: 0,
        backgroundColor: Colors.white,
        title: Text('menu'.tr(), style: AppTextStyles.titleMedium),
        actions: [
          CustomRoundedButton(
            icon: Assets.assetsIconsExit,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: BlocBuilder<CourseDetailsBloc, CourseDetailsState>(
        builder: (context, state) {
          return state.maybeMap(
            orElse: () => SizedBox.shrink(),
            loading: (_) => Center(child: const CircularProgressIndicator()),
            loaded: (loadedState) {
              final modules = loadedState.modules ?? [];
              if (modules.isEmpty) {
                return Center(child: Text("no_modules_found".tr()));
              }
              return ListView.builder(
                itemBuilder: (context, index) {
                  var item = modules[index];
                  return ModuleExpansionTile(
                    module: item,
                    activeLesson: widget.activeLesson,
                  );
                },
                itemCount: modules.length,
                shrinkWrap: true,
              );
            },
          );
        },
      ),
    );
  }
}
