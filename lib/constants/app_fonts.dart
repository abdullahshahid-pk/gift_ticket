import 'dependencies.dart';

TextStyle poppinsPureBlack({required double size}){
  return GoogleFonts.poppins(
    fontSize: size,
    color: AppColors.pureBlack,
    fontWeight: FontWeight.w600,
  );
}

TextStyle poppinsPrimary({required double size}){
  return GoogleFonts.poppins(
    fontSize: size,
    color: AppColors.primaryColor,
    fontWeight: FontWeight.w600,
  );
}