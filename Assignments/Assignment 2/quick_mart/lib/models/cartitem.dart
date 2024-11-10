import 'item.dart';
class CartItem{
  Item item;
   int quantity;
   CartItem(
    {
     required this.item,
     this.quantity=1 
    }
   );
   double get totalPrice=>quantity*item.price;
}