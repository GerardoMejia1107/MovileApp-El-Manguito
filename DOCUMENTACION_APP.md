# Documentación Completa de la Aplicación Móvil "El Manguito"

## 📱 Descripción General

**Nombre:** Foody Bite (El Manguito)  
**Tecnología:** Flutter/Dart  
**Propósito:** Aplicación móvil para una cooperativa que gestiona productos agrícolas locales y comida.

Esta es una aplicación de gestión y visualización de productos, platillos de comida y ventas para la Cooperativa El Manguito en El Salvador.

---

## 🏗️ Estructura del Proyecto Flutter

### ¿Qué es Flutter?
Flutter es un framework de Google para crear aplicaciones móviles multiplataforma (Android y iOS) usando un solo código base escrito en el lenguaje Dart.

### Estructura de Directorios

```
lib/
├── main.dart                 # Punto de entrada de la aplicación
├── screens/                  # Pantallas de la aplicación
│   ├── splash_screen.dart    # Pantalla de inicio con animación
│   ├── main_screen.dart      # Pantalla principal con navegación
│   ├── home.dart             # Pantalla de inicio
│   ├── add.dart              # Pantalla para añadir productos/platillos
│   ├── sales.dart            # Pantalla de ventas con gráficos
│   ├── profile.dart          # Pantalla de perfil (antigua)
│   ├── productsScreens/      # Pantallas de productos
│   │   ├── product_list.dart
│   │   └── product_detail.dart
│   ├── platesScreens/        # Pantallas de platillos
│   │   ├── platesList.dart
│   │   └── food_detail.dart
│   └── profileScreens/       # Pantallas de perfil
│       └── profile.dart
├── widgets/                  # Componentes reutilizables
│   ├── food_item.dart
│   ├── food_edit_item.dart
│   ├── food_delete_item.dart
│   ├── product_edit_item.dart
│   ├── product_delete_item.dart
│   ├── category_item.dart
│   ├── friend_item.dart
│   ├── trending_item.dart
│   ├── food_valoration_item.dart
│   ├── notification_item.dart
│   ├── search_card.dart
│   ├── radial_transition_overlay.dart
│   └── homeWidgets/
│       └── food_slide_item.dart
└── util/                     # Datos y utilidades
    ├── const.dart            # Constantes y temas
    ├── foods.dart            # Datos de platillos
    ├── productsInfo.dart     # Datos de productos agrícolas
    ├── restaurants.dart      # Datos de productos de merchandising
    ├── food_valoration.dart  # Valoraciones de comida
    ├── friendships.dart      # Datos de amistades
    └── friends.dart          # Lista de amigos
```

---

## 🎯 Funcionalidades Implementadas

### 1. **Splash Screen (Pantalla de Inicio)**
- **Archivo:** `lib/screens/splash_screen.dart`
- **Funcionalidad:** 
  - Muestra el logo de la cooperativa
  - Animación de transición circular hacia la pantalla principal
  - Duración: 2 segundos

### 2. **Navegación Principal (Bottom Navigation)**
- **Archivo:** `lib/screens/main_screen.dart`
- **Funcionalidad:**
  - Barra de navegación inferior con 5 secciones:
    1. **Home** (Inicio) - Icono: Casa
    2. **Menu** (A la carta) - Icono: Menú de restaurante
    3. **Add** (Añadir) - Botón flotante central
    4. **Products** (Productos) - Icono: Tienda
    5. **Profile** (Perfil) - Icono: Persona
  - Animación de transición radial entre pantallas
  - PageView para deslizar entre pantallas

### 3. **Pantalla de Inicio (Home)**
- **Archivo:** `lib/screens/home.dart`
- **Funcionalidad:**
  - **Sección Hero:** Imagen de bienvenida con texto superpuesto
  - **Nuestra Comida:** Lista horizontal de los primeros 5 platillos destacados
    - Click en "Ver menu" navega a la lista completa de platillos
    - Cada platillo tiene imagen, título, categoría y calificación
  - **Nuestros Productos:** Lista horizontal de los primeros 5 productos agrícolas
    - Click en "Ver más" navega a la lista completa de productos
    - Productos mostrados: Yuca, Caña, Limón, Naranja, Cacao, etc.
  - Navegación mediante Hero animations al hacer tap en items

### 4. **Lista de Platillos (Menu/A la Carta)**
- **Archivo:** `lib/screens/platesScreens/platesList.dart`
- **Funcionalidad:**
  - Muestra todos los platillos organizados por categorías:
    - Italianos
    - Mexicanos
    - Comida Rápida
    - Ensaladas
  - **Chips de filtrado:** Permite filtrar por categoría o ver todos
  - Cada platillo muestra:
    - Imagen miniatura
    - Nombre
    - Precio

### 5. **Detalle de Platillo**
- **Archivo:** `lib/screens/platesScreens/food_detail.dart`
- **Funcionalidad:**
  - Imagen grande del platillo (Hero animation)
  - Nombre del platillo
  - Etiquetas/características (flags)
  - Precio formateado

### 6. **Lista de Productos Agrícolas**
- **Archivo:** `lib/screens/productsScreens/product_list.dart`
- **Funcionalidad:**
  - Lista vertical de todos los productos agrícolas
  - Cada producto tiene:
    - Imagen de fondo con overlay oscuro
    - Nombre centrado
  - Transición con fade al abrir detalle

### 7. **Detalle de Producto Agrícola**
- **Archivo:** `lib/screens/productsScreens/product_detail.dart`
- **Funcionalidad:**
  - Imagen principal del producto
  - Nombre del producto
  - Descripción (con botón "Ver más" si excede 3 líneas)
  - Información adicional con iconos:
    - **Origen:** De qué planta/árbol proviene
    - **Usos:** Para qué se utiliza
    - **Ubicación:** Dónde se cultiva en El Salvador
  - Galería de fotos del árbol/planta (si existen)
    - Click en miniaturas abre imagen en tamaño completo

### 8. **Pantalla de Añadir (Add)**
- **Archivo:** `lib/screens/add.dart`
- **Funcionalidad:**
  - Formularios modales (dialogs) para:
    - **Añadir nuevo producto:** Nombre, imagen, descripción
    - **Añadir nuevo platillo:** Nombre, imagen, descripción
  - Selector de imagen desde galería
  - Opciones para:
    - Ver platillos añadidos
    - Ver productos añadidos
    - Ver amigos/relaciones
    - Ver valoraciones
    - Navegar a pantalla de ventas

### 9. **Pantalla de Ventas**
- **Archivo:** `lib/screens/sales.dart`
- **Funcionalidad:**
  - Gráficos de líneas (LineChart) usando la librería `fl_chart`
  - Visualización de ventas por:
    - Día (hoy)
    - Semana
    - Mes
    - Año
  - Modales con información detallada de ventas
  - Datos actualmente estáticos (preparados para integración con backend)

### 10. **Pantalla de Perfil**
- **Archivo:** `lib/screens/profileScreens/profile.dart`
- **Funcionalidad:**
  - Foto de perfil editable:
    - Selector de imagen desde galería
    - Almacenamiento persistente usando `shared_preferences`
  - Información del usuario (preparado para backend)
  - Estadísticas:
    - Total de productos
    - Total de platillos

---

## 🎨 Sistema de Diseño

### Temas (Light/Dark Mode)
- **Archivo:** `lib/util/const.dart`
- **Colores principales:**
  - **Primary:** Verde bosque `#275448`
  - **Secondary:** Amarillo suave `#efcb69`
  - **Third:** Azul claro `#97c1e5`
  - **Accent Green:** Verde claro `#a7d5a2`
  - **Dark BG:** Negro `#060604`
  - **Light BG:** Blanco `#FFFFFF`

### Componentes Reutilizables (Widgets)

1. **FoodSlideItem:** Card horizontal para platillos en home
2. **CategoryItem:** Chip de categoría
3. **FoodEditItem / ProductEditItem:** Items para editar en listas
4. **FoodDeleteItem / ProductDeleteItem:** Items para eliminar
5. **TrendingItem:** Item de tendencias
6. **FriendItem:** Item de amigo
7. **NotificationItem:** Item de notificación
8. **SearchCard:** Card de búsqueda
9. **RadialTransitionOverlay:** Overlay para transiciones radiales

---

## 📊 Modelos de Datos Actuales (Hardcoded)

### 1. Productos Agrícolas
```dart
{
  "name": String,        // Ej: "Yuca"
  "img": String,         // Ruta del asset
  "description": String, // Descripción detallada
  "origin": String,      // Planta de origen
  "usage": String,       // Usos del producto
  "location": String,    // Ubicación en El Salvador
  "treeImages": List     // Fotos del árbol/planta
}
```

**Productos existentes:**
- Yuca
- Caña
- Limón
- Naranja
- Cacao
- Limoncello (derivado artesanal)
- Narancella (derivado artesanal)

### 2. Platillos de Comida
```dart
{
  "category": String,    // Categoría
  "plates": [
    {
      "title": String,   // Nombre del platillo
      "img": String,     // Ruta del asset
      "flags": String,   // Características/etiquetas
      "price": double,   // Precio
      "rating": double   // Calificación
    }
  ]
}
```

**Categorías existentes:**
- Italianos (3 platillos)
- Mexicanos (3 platillos)
- Comida Rápida (3 platillos)
- Ensaladas (2 platillos)

### 3. Productos de Merchandising
```dart
{
  "img": String,      // Ruta del asset
  "title": String,    // Nombre del producto
  "address": String,  // Ubicación/descripción
  "rating": String    // Calificación
}
```

**Productos existentes:**
- Camisas polo con logo
- Camisas blancas/negras/beige con logo
- Gorras con logo (2 estilos)
- Taza con logo
- Vaso con logo
- Bolsa con logo
- Caja con logo

### 4. Valoraciones de Comida
```dart
{
  "title": String,       // Nombre del platillo
  "valorations": String  // Calificación
}
```

### 5. Amistades/Relaciones
```dart
{
  "img": String,      // Foto del amigo
  "name": String,     // Nombre
  "relation": String  // Tipo de relación (friends, best friends)
}
```

---

## 🗄️ Recomendaciones para Base de Datos

### Entidades Necesarias

#### 1. **Usuario (User)**
```sql
CREATE TABLE users (
  id UUID PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  profile_image_url VARCHAR(500),
  phone VARCHAR(20),
  role VARCHAR(20) DEFAULT 'customer', -- customer, admin, vendor
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

**Campos:**
- `id`: Identificador único
- `name`: Nombre completo
- `email`: Correo electrónico (login)
- `password_hash`: Contraseña encriptada
- `profile_image_url`: URL de foto de perfil
- `phone`: Teléfono de contacto
- `role`: Rol del usuario
- `created_at/updated_at`: Timestamps

#### 2. **Categoría de Platillos (FoodCategory)**
```sql
CREATE TABLE food_categories (
  id UUID PRIMARY KEY,
  name VARCHAR(50) NOT NULL UNIQUE,
  description TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

**Campos:**
- `id`: Identificador único
- `name`: Nombre de la categoría (Italianos, Mexicanos, etc.)
- `description`: Descripción opcional

#### 3. **Platillo (Food/Plate)**
```sql
CREATE TABLE foods (
  id UUID PRIMARY KEY,
  title VARCHAR(100) NOT NULL,
  description TEXT,
  image_url VARCHAR(500),
  flags VARCHAR(500), -- Características separadas por comas
  price DECIMAL(10, 2) NOT NULL,
  rating DECIMAL(3, 2) DEFAULT 0.00,
  category_id UUID REFERENCES food_categories(id),
  is_available BOOLEAN DEFAULT true,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

**Campos:**
- `id`: Identificador único
- `title`: Nombre del platillo
- `description`: Descripción detallada
- `image_url`: URL de la imagen
- `flags`: Características (ej: "Italiana, preparación rápida")
- `price`: Precio
- `rating`: Calificación promedio
- `category_id`: Referencia a categoría
- `is_available`: Disponibilidad

#### 4. **Categoría de Productos (ProductCategory)**
```sql
CREATE TABLE product_categories (
  id UUID PRIMARY KEY,
  name VARCHAR(50) NOT NULL UNIQUE,
  description TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

#### 5. **Producto Agrícola (Product)**
```sql
CREATE TABLE products (
  id UUID PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  description TEXT,
  image_url VARCHAR(500),
  origin VARCHAR(200), -- Planta/árbol de origen
  usage TEXT, -- Usos del producto
  location VARCHAR(200), -- Ubicación de cultivo
  category_id UUID REFERENCES product_categories(id),
  is_available BOOLEAN DEFAULT true,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

**Campos:**
- `id`: Identificador único
- `name`: Nombre del producto
- `description`: Descripción
- `origin`: Origen (planta/árbol)
- `usage`: Usos
- `location`: Ubicación de cultivo en El Salvador

#### 6. **Imágenes de Producto (ProductImage)**
```sql
CREATE TABLE product_images (
  id UUID PRIMARY KEY,
  product_id UUID REFERENCES products(id) ON DELETE CASCADE,
  image_url VARCHAR(500) NOT NULL,
  image_type VARCHAR(20) DEFAULT 'tree', -- tree, product, other
  order_index INTEGER DEFAULT 0,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

**Campos:**
- `id`: Identificador único
- `product_id`: Referencia al producto
- `image_url`: URL de la imagen
- `image_type`: Tipo (árbol, producto, etc.)
- `order_index`: Orden de visualización

#### 7. **Valoración de Platillo (FoodRating)**
```sql
CREATE TABLE food_ratings (
  id UUID PRIMARY KEY,
  food_id UUID REFERENCES foods(id) ON DELETE CASCADE,
  user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  rating DECIMAL(3, 2) NOT NULL CHECK (rating >= 0 AND rating <= 5),
  comment TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  UNIQUE(food_id, user_id) -- Un usuario solo puede valorar una vez
);
```

**Campos:**
- `id`: Identificador único
- `food_id`: Referencia al platillo
- `user_id`: Referencia al usuario
- `rating`: Calificación (0-5)
- `comment`: Comentario opcional

#### 8. **Venta (Sale)**
```sql
CREATE TABLE sales (
  id UUID PRIMARY KEY,
  user_id UUID REFERENCES users(id),
  total_amount DECIMAL(10, 2) NOT NULL,
  payment_method VARCHAR(50), -- cash, card, transfer
  status VARCHAR(20) DEFAULT 'completed', -- pending, completed, cancelled
  sale_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  notes TEXT
);
```

**Campos:**
- `id`: Identificador único
- `user_id`: Cliente que realizó la compra
- `total_amount`: Monto total
- `payment_method`: Método de pago
- `status`: Estado de la venta

#### 9. **Detalle de Venta (SaleDetail)**
```sql
CREATE TABLE sale_details (
  id UUID PRIMARY KEY,
  sale_id UUID REFERENCES sales(id) ON DELETE CASCADE,
  item_type VARCHAR(20) NOT NULL, -- 'food' o 'product'
  item_id UUID NOT NULL, -- ID del platillo o producto
  quantity INTEGER NOT NULL DEFAULT 1,
  unit_price DECIMAL(10, 2) NOT NULL,
  subtotal DECIMAL(10, 2) NOT NULL
);
```

**Campos:**
- `id`: Identificador único
- `sale_id`: Referencia a la venta
- `item_type`: Tipo de item (platillo o producto)
- `item_id`: ID del item
- `quantity`: Cantidad
- `unit_price`: Precio unitario
- `subtotal`: Subtotal

#### 10. **Amistad (Friendship)** (Opcional - Red Social)
```sql
CREATE TABLE friendships (
  id UUID PRIMARY KEY,
  user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  friend_id UUID REFERENCES users(id) ON DELETE CASCADE,
  relation_type VARCHAR(20) DEFAULT 'friend', -- friend, best_friend
  status VARCHAR(20) DEFAULT 'pending', -- pending, accepted, rejected
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  UNIQUE(user_id, friend_id),
  CHECK (user_id != friend_id)
);
```

#### 11. **Producto de Merchandising (MerchProduct)**
```sql
CREATE TABLE merch_products (
  id UUID PRIMARY KEY,
  title VARCHAR(100) NOT NULL,
  description TEXT,
  image_url VARCHAR(500),
  price DECIMAL(10, 2),
  rating DECIMAL(3, 2) DEFAULT 0.00,
  stock_quantity INTEGER DEFAULT 0,
  is_available BOOLEAN DEFAULT true,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

### Diagrama de Relaciones (ERD)

```
users (1) -----> (*) food_ratings (*) <----- (1) foods
                                                  |
                                                  v
                                          food_categories (1)

users (1) -----> (*) sales (1) -----> (*) sale_details
                                              |
                                              v
                                    foods / products / merch_products

products (1) -----> (*) product_images
    |
    v
product_categories (1)

users (1) -----> (*) friendships (*) <----- (1) users
```

### Recomendación de Base de Datos

**Opción 1: PostgreSQL** (Recomendado)
- ✅ Robusto y confiable
- ✅ Soporte para UUID nativo
- ✅ Excelente para aplicaciones con crecimiento
- ✅ JSON support para campos flexibles
- ✅ Gratis y open source

**Opción 2: MySQL/MariaDB**
- ✅ Popular y bien documentado
- ✅ Buen rendimiento
- ✅ Fácil de configurar

**Opción 3: Firebase Firestore** (Para desarrollo rápido)
- ✅ Backend como servicio
- ✅ Tiempo real
- ✅ Escalable automáticamente
- ❌ Menos control y más costoso a largo plazo

---

## 🔧 Dependencias Utilizadas

### Archivo: `pubspec.yaml`

```yaml
dependencies:
  flutter:
    sdk: flutter
  fl_chart: ^0.66.0              # Gráficos y charts
  cupertino_icons: ^1.0.8        # Iconos iOS
  image_picker: ^1.1.0           # Selector de imágenes
  path_provider: ^2.0.15         # Acceso a directorios del sistema
  shared_preferences: ^2.2.2     # Almacenamiento local clave-valor
```

### Descripción de Dependencias

1. **fl_chart:** Librería para crear gráficos (usado en pantalla de ventas)
2. **image_picker:** Permite seleccionar imágenes de la galería o cámara
3. **path_provider:** Obtiene rutas de directorios del sistema para guardar archivos
4. **shared_preferences:** Almacena datos simples localmente (como la foto de perfil)

---

## 📚 Guía de Funcionamiento del Código Flutter

### 1. Punto de Entrada: `main.dart`

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Forzar orientación vertical
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  
  runApp(const MyApp());
}
```

**Explicación:**
- `main()` es la función de entrada
- `WidgetsFlutterBinding.ensureInitialized()` inicializa Flutter
- `SystemChrome.setPreferredOrientations()` bloquea orientación horizontal
- `runApp()` inicia la aplicación con el widget `MyApp`

### 2. Widget Raíz: `MyApp`

```dart
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appName,
      theme: Constants.lightTheme,
      darkTheme: Constants.darkTheme,
      home: SafeArea(child: SplashScreen()),
    );
  }
}
```

**Explicación:**
- `StatefulWidget`: Widget que puede cambiar de estado
- `MaterialApp`: Widget raíz que configura temas y navegación
- `theme/darkTheme`: Temas claro y oscuro definidos en `const.dart`
- `home`: Primera pantalla que se muestra (SplashScreen)
- `SafeArea`: Evita que el contenido se superponga con notch/barra de estado

### 3. Tipos de Widgets en Flutter

#### StatelessWidget
Widget inmutable que no cambia:
```dart
class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(...);
  }
}
```

#### StatefulWidget
Widget que puede cambiar su estado:
```dart
class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File? _image; // Estado que puede cambiar
  
  void _pickImage() {
    setState(() {
      // Actualizar estado causa rebuild del widget
      _image = newImage;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(...);
  }
}
```

### 4. Estructura de una Pantalla (Scaffold)

```dart
Scaffold(
  appBar: AppBar(              // Barra superior
    title: Text("Título"),
  ),
  body: Container(             // Contenido principal
    child: Text("Contenido"),
  ),
  floatingActionButton: FloatingActionButton(  // Botón flotante
    onPressed: () {},
  ),
  bottomNavigationBar: BottomAppBar(...)  // Barra inferior
)
```

### 5. Navegación entre Pantallas

#### Navegación Simple
```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => ProductDetail(product: product),
  ),
);
```

#### Navegación con PageController (como en MainScreen)
```dart
final _pageController = PageController();

PageView(
  controller: _pageController,
  children: [Home(), PlatesList(), Add(), ProductList(), Profile()],
)

// Cambiar de página
_pageController.jumpToPage(2);
```

#### Regresar a pantalla anterior
```dart
Navigator.pop(context);
```

### 6. Layouts Comunes

#### Column (Vertical)
```dart
Column(
  children: [
    Text("Item 1"),
    Text("Item 2"),
    Text("Item 3"),
  ],
)
```

#### Row (Horizontal)
```dart
Row(
  children: [
    Icon(Icons.star),
    Text("Calificación"),
  ],
)
```

#### ListView (Lista con scroll)
```dart
ListView.builder(
  itemCount: items.length,
  itemBuilder: (context, index) {
    return ListTile(
      title: Text(items[index]),
    );
  },
)
```

#### GridView (Cuadrícula)
```dart
GridView.count(
  crossAxisCount: 2,
  children: items.map((item) => Card(...)).toList(),
)
```

### 7. Gestión de Estado

#### setState() - Para estados locales
```dart
int counter = 0;

void increment() {
  setState(() {
    counter++; // Actualiza UI automáticamente
  });
}
```

#### SharedPreferences - Para persistencia local
```dart
// Guardar
final prefs = await SharedPreferences.getInstance();
await prefs.setString('key', 'value');

// Leer
final value = prefs.getString('key');
```

### 8. Manejo de Imágenes

#### Asset Image (imagen del proyecto)
```dart
Image.asset(
  'assets/logo.png',
  width: 100,
  height: 100,
  fit: BoxFit.cover,
)
```

#### File Image (imagen de la galería)
```dart
Image.file(
  File('/path/to/image.jpg'),
  width: 100,
  height: 100,
)
```

#### Network Image (imagen de internet)
```dart
Image.network(
  'https://ejemplo.com/imagen.jpg',
)
```

### 9. Animaciones

#### Hero Animation (transición entre pantallas)
```dart
// Pantalla 1
Hero(
  tag: 'product_1',
  child: Image.asset('assets/product.png'),
)

// Pantalla 2 (mismo tag)
Hero(
  tag: 'product_1',
  child: Image.asset('assets/product.png'),
)
```

#### AnimatedOpacity
```dart
AnimatedOpacity(
  opacity: _visible ? 1.0 : 0.0,
  duration: Duration(milliseconds: 500),
  child: Container(...),
)
```

### 10. Conceptos Clave de Dart

#### Variables y Tipos
```dart
String nombre = "Juan";           // Texto
int edad = 25;                    // Número entero
double precio = 9.99;             // Número decimal
bool activo = true;               // Booleano
List<String> items = ["a", "b"];  // Lista
Map<String, dynamic> data = {     // Mapa/Diccionario
  "name": "Juan",
  "age": 25,
};
```

#### Null Safety
```dart
String? nombre;         // Puede ser null
String nombre = "Juan"; // No puede ser null

if (nombre != null) {
  print(nombre.length);
}

// Operador ??
String texto = nombre ?? "Sin nombre";

// Operador ?.
int? longitud = nombre?.length;
```

#### Funciones
```dart
// Función normal
void saludar(String nombre) {
  print("Hola $nombre");
}

// Función con retorno
String obtenerNombre() {
  return "Juan";
}

// Función flecha (arrow function)
String obtenerNombre() => "Juan";

// Función asíncrona
Future<void> cargarDatos() async {
  final data = await api.getData();
  print(data);
}
```

#### Clases
```dart
class Usuario {
  final String nombre;
  final int edad;
  
  Usuario({required this.nombre, required this.edad});
  
  void saludar() {
    print("Hola, soy $nombre");
  }
}

// Uso
final usuario = Usuario(nombre: "Juan", edad: 25);
usuario.saludar();
```

---

## 🚀 Integración con Backend

### Paso 1: Añadir dependencias HTTP

```yaml
dependencies:
  http: ^1.1.0
```

### Paso 2: Crear servicio API

```dart
// lib/services/api_service.dart
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const String baseUrl = 'https://tu-api.com/api';
  
  // Obtener productos
  Future<List<dynamic>> getProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/products'));
    
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Error al cargar productos');
    }
  }
  
  // Obtener platillos
  Future<List<dynamic>> getFoods() async {
    final response = await http.get(Uri.parse('$baseUrl/foods'));
    
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Error al cargar platillos');
    }
  }
  
  // Crear venta
  Future<Map<String, dynamic>> createSale(Map<String, dynamic> saleData) async {
    final response = await http.post(
      Uri.parse('$baseUrl/sales'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(saleData),
    );
    
    if (response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      throw Exception('Error al crear venta');
    }
  }
}
```

### Paso 3: Usar en widgets

```dart
class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final ApiService _api = ApiService();
  List<dynamic> products = [];
  bool isLoading = true;
  
  @override
  void initState() {
    super.initState();
    loadProducts();
  }
  
  Future<void> loadProducts() async {
    try {
      final data = await _api.getProducts();
      setState(() {
        products = data;
        isLoading = false;
      });
    } catch (e) {
      print('Error: $e');
      setState(() {
        isLoading = false;
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ListTile(
          title: Text(product['name']),
          subtitle: Text(product['description']),
        );
      },
    );
  }
}
```

---

## 📝 Endpoints del Backend Recomendados

### Autenticación
- `POST /api/auth/register` - Registrar usuario
- `POST /api/auth/login` - Iniciar sesión
- `POST /api/auth/logout` - Cerrar sesión
- `GET /api/auth/profile` - Obtener perfil

### Productos Agrícolas
- `GET /api/products` - Listar todos los productos
- `GET /api/products/:id` - Obtener detalle de producto
- `POST /api/products` - Crear producto (admin)
- `PUT /api/products/:id` - Actualizar producto (admin)
- `DELETE /api/products/:id` - Eliminar producto (admin)
- `GET /api/products/:id/images` - Obtener imágenes del producto

### Platillos
- `GET /api/foods` - Listar todos los platillos
- `GET /api/foods/:id` - Obtener detalle de platillo
- `GET /api/foods/category/:categoryId` - Platillos por categoría
- `POST /api/foods` - Crear platillo (admin)
- `PUT /api/foods/:id` - Actualizar platillo (admin)
- `DELETE /api/foods/:id` - Eliminar platillo (admin)

### Categorías
- `GET /api/categories/foods` - Categorías de platillos
- `GET /api/categories/products` - Categorías de productos
- `POST /api/categories` - Crear categoría (admin)

### Valoraciones
- `GET /api/foods/:id/ratings` - Valoraciones de un platillo
- `POST /api/foods/:id/ratings` - Crear valoración
- `PUT /api/ratings/:id` - Actualizar valoración
- `DELETE /api/ratings/:id` - Eliminar valoración

### Ventas
- `GET /api/sales` - Listar ventas
- `GET /api/sales/:id` - Detalle de venta
- `POST /api/sales` - Crear venta
- `GET /api/sales/stats/daily` - Estadísticas diarias
- `GET /api/sales/stats/weekly` - Estadísticas semanales
- `GET /api/sales/stats/monthly` - Estadísticas mensuales
- `GET /api/sales/stats/yearly` - Estadísticas anuales

### Amistades (Opcional)
- `GET /api/friendships` - Listar amigos
- `POST /api/friendships/:userId` - Enviar solicitud
- `PUT /api/friendships/:id/accept` - Aceptar solicitud
- `DELETE /api/friendships/:id` - Eliminar amistad

---

## 🔒 Consideraciones de Seguridad

1. **Autenticación:** Implementar JWT (JSON Web Tokens)
2. **Validación:** Validar todos los inputs en backend
3. **Encriptación:** Usar HTTPS para todas las comunicaciones
4. **Passwords:** Usar bcrypt o argon2 para hash de contraseñas
5. **Rate Limiting:** Limitar requests por IP
6. **CORS:** Configurar correctamente los orígenes permitidos

---

## 📱 Cómo Probar la Aplicación

### Requisitos
- Flutter SDK instalado
- Android Studio o VS Code
- Emulador o dispositivo físico

### Comandos
```bash
# Instalar dependencias
flutter pub get

# Ejecutar en emulador/dispositivo
flutter run

# Compilar APK para Android
flutter build apk

# Compilar para iOS (requiere Mac)
flutter build ios
```

---

## 🎓 Recursos de Aprendizaje

### Documentación Oficial
- [Flutter Docs](https://docs.flutter.dev/)
- [Dart Language Tour](https://dart.dev/guides/language/language-tour)
- [Flutter Widget Catalog](https://docs.flutter.dev/ui/widgets)

### Tutoriales Recomendados
- [Flutter Codelabs](https://docs.flutter.dev/codelabs)
- [Flutter YouTube Channel](https://www.youtube.com/flutterdev)

### Conceptos Importantes para Estudiar
1. **Stateless vs Stateful Widgets**
2. **Navigator y routing**
3. **State management (Provider, Riverpod, Bloc)**
4. **Async/await y Futures**
5. **HTTP requests**
6. **JSON parsing**
7. **Local storage (SharedPreferences, SQLite)**
8. **Forms y validación**

---

## 📞 Contacto y Soporte

Para preguntas o dudas sobre la aplicación, contactar al equipo de desarrollo.

---

**Última actualización:** Diciembre 2024  
**Versión de la app:** 1.0.0  
**Versión de Flutter:** 3.7.2+
