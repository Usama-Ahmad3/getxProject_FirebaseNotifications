import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project/res/colors/appColors.dart';

class generalException extends StatefulWidget {
  final VoidCallback onpress;
  const generalException({Key? key,required this.onpress}) : super(key: key);

  @override
  State<generalException> createState() => _generalExceptionState();
}

class _generalExceptionState extends State<generalException> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: height * .15),
          Icon(Icons.cloud_off,color: AppColors.redColor,size: 50,),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Text('internet_exception'.tr,textAlign: TextAlign.center,),
          ),
          SizedBox(height: height * .15),
          InkWell(
            onTap: widget.onpress,
            child: Container(
              height: 44,
              width: 160,
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(50)
              ),
              child: Center(child: Text('Retry',style: Theme.of(context).textTheme.titleLarge!.copyWith(color: AppColors.whiteColor),)),
            ),
          )
        ],
      ),
    );
  }
}
