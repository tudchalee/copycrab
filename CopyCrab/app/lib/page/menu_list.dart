import 'package:app/template/menu.dart';

class MenuList {
  static List<Menu> getMenu() {
    return [
      Menu(
          title: 'ต้้มยำกุ้ง',
          category: 'Thai Food',
          price: '฿70',
          imageUrl: 
          'https://i.pinimg.com/236x/83/5d/b7/835db7db3d9f0607a672a33c98b5a048.jpg'),
      Menu(
          title: 'ส้มตำ',
          category: 'Thai Food',
          price: '฿45',
          imageUrl:
              'https://i.pinimg.com/236x/5b/a4/af/5ba4af30731311e33bee4b40fb7db973.jpg'),
      Menu(
          title: 'ไอศกรีม',
          category: 'Dessert',
         price: '฿75',
          imageUrl:
              'https://i.pinimg.com/236x/93/0d/f3/930df32891a3dbbd6295bbbb5944645f.jpg'),
      Menu(
          title: 'บิงซู',
          category: 'Dessert',
          price: '฿110',
          imageUrl:
              'https://i.pinimg.com/236x/00/c2/0a/00c20a40083e78f194a939de6ed5ee3f.jpg'),
      Menu(
          title: 'ชานมไข่มุก',
          category: 'Drinks',
          price: '฿25',
          imageUrl:
              'https://i.pinimg.com/236x/77/27/69/772769d1788d6907633d04abfa44ec0d.jpg'),
      Menu(
          title: 'บัวลอย',
          category: 'Dessert',
          price: '฿40',
          imageUrl:
              'https://i.pinimg.com/236x/46/bd/6f/46bd6f7dd26d9054b15319e1efb64492.jpg'),
      Menu(
          title: 'ก๋วยเตี๋ยว',
          category: 'Thai Food, Street Food, Chinese Food',
          price: '฿45',
          imageUrl:
              'https://i.pinimg.com/236x/56/fc/c3/56fcc33a97db9634b217e2d055c47e12.jpg'),
      Menu(
          title: 'ซูชิ',
          category: 'Japanese Food',
          price: '฿15',
          imageUrl:
              'https://i.pinimg.com/236x/92/d6/76/92d6765a97c81bafb92b7c19b2601a22.jpg'),
      Menu(
          title: 'ขนมจีบ',
          category: 'Chinese Food, Dessert',
          price: '฿6',
          imageUrl:
              'https://i.pinimg.com/236x/19/b7/45/19b745c0ac294e966a57ae75c7da5056.jpg'),
      Menu(
          title: 'ซาลาเปา',
          category: 'Chinese Food, Dessert',
          price: '฿15',
          imageUrl:
              'https://i.pinimg.com/236x/34/03/f4/3403f4617e182cf07e560ad5a109c8a7.jpg'),
    ];
  }
}