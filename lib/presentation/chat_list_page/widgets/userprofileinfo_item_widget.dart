import '../controller/chat_list_controller.dart';
import '../models/userprofileinfo_item_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_learning/core/utils/size_utils.dart';
import 'package:e_learning/theme/app_decoration.dart';
import 'package:e_learning/theme/custom_text_style.dart';
import 'package:e_learning/widgets/custom_image_view%20copy.dart';


// ignore: must_be_immutable
class UserprofileinfoItemWidget extends StatelessWidget {
  UserprofileinfoItemWidget(
    this.userprofileinfoItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  UserprofileinfoItemModel userprofileinfoItemModelObj;

  var controller = Get.find<ChatListController>();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: EdgeInsets.all(16.h),
        decoration: AppDecoration.fillGray.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder12,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 3.v),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomImageView(
                    imagePath: userprofileinfoItemModelObj.image,
                    height: 58.adaptSize,
                    width: 58.adaptSize,
                    radius: BorderRadius.circular(
                      29.h,
                    ),
                    margin: EdgeInsets.only(bottom: 1.v),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 16.h,
                      top: 3.v,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userprofileinfoItemModelObj.name!,
                          style: CustomTextStyles.titleLarge20,
                        ),
                        SizedBox(height: 12.v),
                        Text(
                          userprofileinfoItemModelObj.msg!,
                          style: CustomTextStyles.bodyLargeGray700,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 39.v,
                bottom: 2.v,
              ),
              child: Text(
                userprofileinfoItemModelObj.time!,
                style: CustomTextStyles.bodyLargeGray700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
