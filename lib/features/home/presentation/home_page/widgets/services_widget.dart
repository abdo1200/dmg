import 'package:clean_arc/features/home/presentation/home_page/bloc/home_cubit.dart';
import 'package:clean_arc/resource/styles/app_colors.dart';
import 'package:clean_arc/resource/styles/colors.dart';
import 'package:clean_arc/src/core/preferences/constants.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServicesWidget extends StatelessWidget {
  const ServicesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<HomeCubit>();
    return Align(
        alignment: Alignment.topCenter,
        child: Row(

          mainAxisAlignment:bloc.openFilter? MainAxisAlignment.center:MainAxisAlignment.end,
          children: [
            if (bloc.openFilter)
              Container(
                width: width(context) * .35,
                decoration: BoxDecoration(
                    color: white, borderRadius: BorderRadius.circular(20)),
                child: TextField(
                  controller: bloc.service,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      border: InputBorder.none,
                      hintText: 'Service'),
                ),
              ),
            if (bloc.openFilter) SizedBox(width: 10),
            if (bloc.openFilter)
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: white, borderRadius: BorderRadius.circular(20)),
                  child: TextField(
                    controller: bloc.raduis,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 20),
                        border: InputBorder.none,
                        hintText: 'raduis'),
                  ),
                ),
              ),
            if (bloc.openFilter) SizedBox(width: 10),
            InkWell(
              onTap: (){
                if(bloc.openFilter){
                   bloc.searchService(context);
                }else{
                  bloc.openFilter=true;
                  bloc.refresh();
                }
              },
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: AppColors.current.primaryColor,
                    shape: BoxShape.circle),
                child: Icon(
                  bloc.openFilter?Icons.search:Icons.category_rounded,
                  color: AppColors.current.witheColor,
                ),
              ),
            ),
            const SizedBox(width: 10),
            if (bloc.openFilter)
            InkWell(
              onTap: (){
                  bloc.openFilter=false;
                  bloc.refresh();

              },
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: AppColors.current.primaryColor,
                    shape: BoxShape.circle),
                child: Icon(
                  Icons.clear,
                  color: AppColors.current.witheColor,
                ),
              ),
            ),
          ],
        ));
  }
}

final List<String> items = [
  'Pharmacy',
  'Bus',
  'Resturants',
  'Cafe',
  'Gas',
  'School'
];
