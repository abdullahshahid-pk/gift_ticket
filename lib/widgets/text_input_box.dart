import '../constants/dependencies.dart';

class TextInputBox extends StatelessWidget {
  final TextEditingController controller;
  final String hintText, labelText;
  const TextInputBox({super.key,  required this.controller, required this.hintText, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      width: 350.w,
      margin: EdgeInsets.only(top: 20.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(14.r)),
        color: AppColors.containerGrey,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextFormField(
              controller: controller,
              style: poppinsPureBlack(size: 12),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 15.h, left: 15.w),
                alignLabelWithHint: true,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: hintText,
                hintStyle: poppinsPureBlack(size: 12),
                labelText: labelText,
                labelStyle: poppinsPureBlack(size: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14.r),
                  borderSide: const BorderSide(color: AppColors.charcoal),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14.r),
                  borderSide: const BorderSide(color: AppColors.charcoal),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14.r),
                  borderSide: const BorderSide(color: AppColors.charcoal),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}