import 'package:flutter/material.dart';
import 'package:flutter_project/core/utils/app_colors.dart';
import 'package:flutter_project/core/utils/app_text_stayel.dart';

class ProductCardForProductEvery extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final String price;
  final String description;

  const ProductCardForProductEvery({
    super.key,
    required this.imageUrl,
    required this.productName,
    required this.price,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 118,
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.29),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Row(
          children: [
            Container(
              width: 180,
              height: 101,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imageUrl),
                  fit: BoxFit.cover,
                ),
                borderRadius:
                    const BorderRadius.horizontal(left: Radius.circular(10.0)),
                color: Colors.transparent,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            productName,
                            style: AppTextStyle.ffShamelBold14.copyWith(
                              fontSize: 16,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          '$price ريال',
                          style: AppTextStyle.ffShamelRegular14.copyWith(
                            fontSize: 16,
                            color: AppColors.primaryColor.withOpacity(0.8),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: AppTextStyle.ffShamelRegular11.copyWith(
                        fontSize: 12,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
