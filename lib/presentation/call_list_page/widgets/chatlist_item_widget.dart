import 'package:e_learning/theme/custom_text_style.dart';
import 'package:get/get.dart';
import 'package:e_learning/presentation/call_list_page/controller/call_list_controller.dart';
import 'package:e_learning/presentation/call_list_page/models/chatlist_item_model.dart';
import 'package:flutter/material.dart';
import 'package:e_learning/core/utils/size_utils.dart';
import 'package:e_learning/theme/theme_helper.dart';
import 'package:e_learning/widgets/custom_image_view%20copy.dart';
import 'package:e_learning/core/utils/image_constant.dart';
import 'package:e_learning/theme/app_decoration.dart';

// ignore: must_be_immutable
class ChatlistItemWidget extends StatelessWidget {
  ChatlistItemWidget(
    this.chatlistItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  ChatlistItemModel chatlistItemModelObj;

  var controller = Get.find<CallListController>();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 13.h,
          vertical: 16.v,
        ),
        decoration: AppDecoration.fillGray.copyWith(
          borderRadius: BorderRadiusStyle.circleBorder15,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomImageView(
                  imagePath: chatlistItemModelObj.image,
                  height: 58.adaptSize,
                  width: 58.adaptSize,
                  radius: BorderRadius.circular(
                    29.h,
                  ),
                ),
                SizedBox(width: 16.h),
                Padding(
                  padding: EdgeInsets.only(
                    top: 3.v,
                    bottom: 6.v,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        chatlistItemModelObj.userName!,
                        style: CustomTextStyles.titleLarge20,
                      ),
                      SizedBox(height: 8.v),
                      Row(
                        children: [
                          Text(
                            chatlistItemModelObj.callType!,
                            style: theme.textTheme.bodyMedium,
                          ),Text(
                            " | ",
                            style: theme.textTheme.bodyMedium,
                          ),Text(
                            chatlistItemModelObj.date!,
                            style: theme.textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),




            Padding(
              padding: EdgeInsets.only(
                top: 9.v,
                right: 3.h,
                bottom: 9.v,
              ),
              child:Container(
                height: 40.v,
                width:40.v,
                  decoration: BoxDecoration(
                  shape: BoxShape.circle,
                    color: appTheme.greenA70001,
                    boxShadow: [
                      BoxShadow(offset: Offset(0, 4),
                      blurRadius: 15,
                      color: appTheme.black900.withOpacity(0.06))
                    ]
              ),
                child: Padding(
                  padding:  EdgeInsets.all(8.h),
                  child: CustomImageView(
                    imagePath: chatlistItemModelObj.callName == "video"?ImageConstant.imgVidioCallIcon:ImageConstant.imgCallIcon,
                  ),
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}
