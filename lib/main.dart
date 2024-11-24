import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_developer_test_at_media_design_expert_fze/theme/colors.dart';
import 'package:flutter_developer_test_at_media_design_expert_fze/views/widgets/buttons/submit_flat_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'view_models/cubits/products_list_cubit.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => ProductsListCubit()),
    ],
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: AppColors.primarySwatch,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          home: child,
        );
      },
      child: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: SubmitFlatButton()),
      // body: BlocBuilder<ProductsListCubit, ProductsListState>(
      //   builder: (context, state) {
      //     if (state is ProductsListLoaded) {
      //       return ListView.builder(
      //         scrollDirection: Axis.vertical,
      //         itemCount: state.productsList.length,
      //         itemBuilder: (context, index) {
      //           final product = state.productsList[index];
      //           return ListTile(
      //             title: Text(product.name),
      //           );
      //         },
      //       );
      //     } else {
      //       return const Center(child: CircularProgressIndicator());
      //     }
      //   },
      // ),
    );
  }
}
