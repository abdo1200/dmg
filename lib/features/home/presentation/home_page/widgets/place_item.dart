import 'package:clean_arc/features/home/domain/entites/Place_suggestion.dart';
import 'package:clean_arc/resource/styles/app_colors.dart';
import 'package:flutter/material.dart';

class PlaceItem extends StatelessWidget {
  final PlaceSuggestion suggestion;

  const PlaceItem({Key? key, required this.suggestion}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var subTitle = suggestion.description!
        .replaceAll(suggestion.description!.split(',')[0], '');
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.symmetric(vertical: 8),
      decoration: BoxDecoration(
          color: AppColors.current.witheColor,
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  contentPadding: const EdgeInsets.all(0),
                  minLeadingWidth: 40,
                  leading: Icon(
                    Icons.location_on,
                    color: AppColors.current.secondaryColor,
                  ),
                  title: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '${suggestion.description!.split(',')[0]}\n',
                          style: TextStyle(
                            color: AppColors.current.primaryColor,
                            fontFamily: 'Poppins',
                            fontSize: 18,
                          ),
                        ),
                        TextSpan(
                          text: subTitle.substring(2),
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: AppColors.current.secondaryTextColor,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
