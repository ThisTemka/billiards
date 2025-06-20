import 'package:billiards/services/router/entity/i_routes.dart';
import 'package:billiards/services/translation/entity/translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Application extends ConsumerWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routes = ref.read(routesProvider);
    final translations = ref.read(translationsProvider);

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) => GetMaterialApp(
        getPages: routes.pages,
        initialRoute: routes.initialPage,
        unknownRoute: routes.unknownPage,
        translations: translations,
      ),
    );
  }
}
