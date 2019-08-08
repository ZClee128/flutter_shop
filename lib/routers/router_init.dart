
import 'package:fluro/fluro.dart';

// 使用abstract修饰一个类，则这个类是抽象类，抽象类中可以有抽象方法和非抽象方法，抽象方法没有方法体，需要子类去实现
abstract class IRouterProvider {
  void initRouter(Router router);
}