import 'package:flutter/material.dart';

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showEntrega = false;
  String? _selectedCategory;

  void _toggleEntrega() {
    setState(() {
      _showEntrega = !_showEntrega;
    });
  }

  void _selectCategory(String category) {
    setState(() {
      if (_selectedCategory == category) {
        _selectedCategory = null; // Desmarcar se já está selecionada
      } else {
        _selectedCategory = category; // Selecionar nova categoria
      }
    });
  }

  void _showDeliveryDetails() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Taxa e Tempo de Entrega', style: TextStyle(color: Colors.black)),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDeliveryDetail('Centro:', 'R\$10,00 - 20 min'),
                _buildDeliveryDetail('Bairros próximos (Floresta, Odila):', 'R\$15,00 - 30 min'),
                _buildDeliveryDetail('Bairros distantes (Progresso, Hermany, Esperança):', 'R\$20,00 - 40 min'),
                _buildDeliveryDetail('Outras cidades:', 'Acima de R\$40,00 - no mínimo 60 min'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Fechar'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildDeliveryDetail(String title, String detail) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(10),
      color: Colors.pink[100], // Cor rosa bebê
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(color: Colors.black)),
          Text(detail, style: TextStyle(color: Colors.black)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(color: Colors.white),
                Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
                      child: Image.network(
                        'https://www.shutterstock.com/shutterstock/photos/409934140/display_1500/stock-vector-cute-pattern-in-small-flower-small-pink-flowers-dark-green-background-spring-floral-background-409934140.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 100,
                  backgroundImage: NetworkImage('https://down-br.img.susercontent.com/file/ff6dfea92c0cfce950db1a54567c77d0'),
                ),
                SizedBox(height: 10),
                Text('Floricultura Sonho Meu', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.location_on, color: Colors.red),
                    SizedBox(width: 5),
                    Text('Rua Getúlio Vargas, 885, Ibirubá-RS', style: TextStyle(fontSize: 20)),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.access_time, color: Colors.black),
                    SizedBox(width: 5),
                    Text('8:30 até 12:00 - 13:30 até 18:00', style: TextStyle(fontSize: 20)),
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[200],
                  ),
                  child: ElevatedButton.icon(
                    onPressed: _toggleEntrega,
                    icon: Icon(Icons.emoji_emotions, color: Colors.pinkAccent),
                    label: Text('Calcular taxa e tempo de entrega', style: TextStyle(fontSize: 20, color: Colors.black)),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green[100]),
                  ),
                ),
                if (_showEntrega) ...[
                  SizedBox(height: 20),
                  _buildInfoCard(
                    'Retirada',
                    'Você retira no local.',
                    'https://lh6.ggpht.com/-ofE2XsJ7Hhk/VQcHHcPhamI/AAAAAAAABTs/b-3dXVquEDc/w550-o/fachada-casa-cor-rosa-4.jpg',
                  ),
                  SizedBox(height: 10),
                  _buildInfoCard(
                    'Entrega',
                    'A gente leva até você.',
                    'https://www.shutterstock.com/image-photo/retro-car-toy-pink-roses-260nw-1141288457.jpg',
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _showDeliveryDetails,
                    child: Text('Taxa e Tempo', style: TextStyle(color: Colors.black)), // Letra preta
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[100],
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    ),
                  ),
                ],
                SizedBox(height: 20),
                Text('Produtos:', style: TextStyle(fontSize: 20)),
                SizedBox(height: 10),
                _buildCategoryButton('Buquê de rosas vermelhas', 'https://cdn.dooca.store/43635/products/teste-aspargo-494x484_640x640+fill_ffffff.png?v=1665501651&webp=0'),
                SizedBox(height: 10),
                _buildCategoryButton('Buquê de flores do campo', 'https://images.tcdn.com.br/img/img_prod/1036719/buque_premium_do_campo_127_1_3c28707893ebe6277076c91203018a13.jpg'),
                SizedBox(height: 10),
                _buildCategoryButton('Kits', 'https://cdn.awsli.com.br/600x450/1087/1087349/produto/59118669/7feac6db08.jpg'),
                SizedBox(height: 10),
                _buildCategoryButton('Cestas', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHcZ4_F-9AxzxndGh5Ogz57iUjc-AXjNqCgA&s'),
                SizedBox(height: 20),
                if (_selectedCategory != null)
                  _buildCategoryImage(_selectedCategory!),
                SizedBox(height: 20),
                Text('Avisos importantes:', style: TextStyle(fontSize: 20)),
                _buildInfoCard(
                  'Pedidos/entregas',
                  'Certifique-se de que a pessoa presenteada estará no local para receber. O motoboy retornará para loja e será cobrada uma nova taxa de entrega.',
                  'https://st4.depositphotos.com/6430496/23273/i/450/depositphotos_232734412-stock-photo-pink-retro-toy-car-delivering.jpg',
                ),
                _buildInfoCard(
                  'Entregas',
                  'As entregas só irão sair da loja após a efetuação do pagamento.',
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_CvoFLFPeAxhkzOCf6SmRo_tB-Y1xdIapqA&s',
                ),
                _buildInfoCard(
                  'Cartões',
                  'O texto do cartão é escrito à mão em até 3/4 linhas. Para textos maiores, pedimos que enviem pelo WhatsApp para ser impresso.',
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTl63WNOLq-cx24CBNuLL0TMtrVLNDvODjxWMP9nSMuoGRaiwTcQckrDaUEUpYOaV1eGCE&usqp=CAU',
                ),
                SizedBox(height: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryButton(String category, String imageUrl) {
    return ElevatedButton(
      onPressed: () => _selectCategory(category),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(category, style: TextStyle(fontSize: 20)),
          Icon(Icons.arrow_forward, color: Colors.pink),
        ],
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green[100],
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      ),
    );
  }

  Widget _buildCategoryImage(String category) {
    String imageUrl;
    switch (category) {
      case 'Buquê de rosas vermelhas':
        imageUrl = 'https://cdn.dooca.store/43635/products/teste-aspargo-494x484_640x640+fill_ffffff.png?v=1665501651&webp=0';
        break;
      case 'Buquê de flores do campo':
        imageUrl = 'https://images.tcdn.com.br/img/img_prod/1036719/buque_premium_do_campo_127_1_3c28707893ebe6277076c91203018a13.jpg';
        break;
      case 'Kits':
        imageUrl = 'https://cdn.awsli.com.br/600x450/1087/1087349/produto/59118669/7feac6db08.jpg';
        break;
      case 'Cestas':
        imageUrl = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHcZ4_F-9AxzxndGh5Ogz57iUjc-AXjNqCgA&s';
        break;
      default:
        imageUrl = '';
    }
    return Column(
      children: [
        SizedBox(height: 10),
        Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(category, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildInfoCard(String title, String content, String imageUrl) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.purple),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  content,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}