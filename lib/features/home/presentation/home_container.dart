import 'package:auto_route/auto_route.dart';
import 'package:clean_arc/features/home/presentation/home_page/bloc/home_cubit.dart';
import 'package:clean_arc/resource/generated/assets.gen.dart';
import 'package:clean_arc/resource/styles/app_colors.dart';
import 'package:clean_arc/resource/styles/app_text_styles.dart';
import 'package:clean_arc/src/app/bloc/app_bloc.dart';
import 'package:clean_arc/src/core/helpers/location_helper.dart';
import 'package:clean_arc/src/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

@RoutePage()
class HomeContainer extends StatelessWidget {
  const HomeContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) =>
          getIt<HomeCubit>()..load(context),
      child: Builder(builder: (context) {
        return BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            if (state is LocationDisabled) {
              //CallDialog.showErrorDialog(context, state.message);
            }
          },
          buildWhen: (previous, current) =>current is HomeLoaded,
          builder: (context, state) {
            return Scaffold(
              body: !context.read<HomeCubit>().serviceStatus
                  ? Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Assets.images.noResult.image(),
                        Text('Please Enable location',style: AppTextStyles.s17Primary()),
                        SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            //LocationHelper.getCurrentLocation();
                            Geolocator.openLocationSettings();
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: AppColors.current.primaryColor,
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Text('Enable',style: AppTextStyles.s15White(),),
                          ),
                        )
                      ],
                    ),
                  )
                  : AutoRouter());
          },
        );
      }),
    );
  }
}
