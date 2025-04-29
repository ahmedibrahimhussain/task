import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/recourses/styles_manger/styles_manager.dart';
import '../../../home_feature/data/model/products_model.dart';

class DetailsSummaryPart extends StatelessWidget {
  const DetailsSummaryPart({super.key, required this.model});
  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoCard(
            title: "Title",
            content: model.title ?? '',
          ),
          SizedBox(height: 20.h),
          _buildInfoCard(
            title: "Summary",
            content: model.description ?? '',
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard({required String title, required String content}) {
    return Card(
      color: const Color(0xFF1E1E1E),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      elevation: 8,
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: SizedBox(width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: getSemiBoldStyle(fontSize: 22.sp, color: Colors.white),
              ),
              SizedBox(height: 12.h),
              Text(
                content,
                style: getRegularStyle(fontSize: 16.sp, color: Colors.white70),
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
