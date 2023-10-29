

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';


//listado de colores inmutable
final colorListProvider = Provider((ref) => colorList);
//un simple boolean
final isDarkModeProvider = StateProvider((ref) => false);
//Un simple int
final selectedColorProvider = StateProvider((ref) => 0);


