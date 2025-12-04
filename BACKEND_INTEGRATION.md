# Guía de Integración con Backend

## 🎯 Objetivo

Este documento explica cómo conectar la aplicación Flutter con un backend (servidor) para almacenar y recuperar datos reales en lugar de usar datos hardcoded.

---

## 🏗️ Arquitectura Backend Recomendada

```
┌─────────────────────────────────────────────────┐
│              FLUTTER APP (Frontend)             │
│  ┌──────────────────────────────────────────┐   │
│  │   UI Screens (Dart/Flutter)              │   │
│  └────────────────┬─────────────────────────┘   │
│                   │ HTTP Requests                │
└───────────────────┼─────────────────────────────┘
                    │
                    ▼ JSON (REST API)
┌─────────────────────────────────────────────────┐
│               BACKEND (API Server)               │
│  ┌──────────────────────────────────────────┐   │
│  │   Endpoints (Node.js / Python / PHP)     │   │
│  └────────────────┬─────────────────────────┘   │
│                   │ SQL Queries                  │
└───────────────────┼─────────────────────────────┘
                    │
                    ▼
┌─────────────────────────────────────────────────┐
│            DATABASE (Base de Datos)              │
│              PostgreSQL / MySQL                  │
└─────────────────────────────────────────────────┘
```

---

## 🔧 Tecnologías Recomendadas para Backend

### Opción 1: Node.js + Express (Recomendado)
**Ventajas:**
- JavaScript en backend (si ya sabes JS)
- Rápido de desarrollar
- Gran ecosistema de paquetes

**Ideal para:** Equipos que conocen JavaScript

### Opción 2: Python + Django/Flask
**Ventajas:**
- Python es fácil de aprender
- Django tiene muchas funcionalidades incluidas
- Excelente para APIs REST

**Ideal para:** Equipos que conocen Python

### Opción 3: PHP + Laravel
**Ventajas:**
- Ampliamente usado en hosting compartido
- Laravel es muy popular
- Fácil de deployar

**Ideal para:** Hosting compartido tradicional

### Opción 4: Firebase (Backend as a Service)
**Ventajas:**
- No necesitas programar backend
- Escalable automáticamente
- Autenticación incluida

**Ideal para:** Prototipos rápidos, MVPs

---

## 📦 Ejemplo Completo: Node.js + Express + PostgreSQL

### Backend (Node.js)

#### 1. Estructura del Proyecto Backend

```
backend/
├── server.js           # Punto de entrada
├── config/
│   └── database.js     # Configuración de BD
├── models/
│   ├── User.js
│   ├── Product.js
│   └── Food.js
├── routes/
│   ├── auth.js
│   ├── products.js
│   └── foods.js
├── middleware/
│   └── auth.js         # Verificación de JWT
└── package.json
```

#### 2. Setup Básico (server.js)

```javascript
// server.js
const express = require('express');
const cors = require('cors');
const app = express();
const PORT = 3000;

// Middleware
app.use(cors()); // Permite requests desde Flutter
app.use(express.json()); // Para parsear JSON

// Rutas
app.use('/api/auth', require('./routes/auth'));
app.use('/api/products', require('./routes/products'));
app.use('/api/foods', require('./routes/foods'));

app.listen(PORT, () => {
  console.log(`Servidor corriendo en http://localhost:${PORT}`);
});
```

#### 3. Configuración de Base de Datos

```javascript
// config/database.js
const { Pool } = require('pg');

const pool = new Pool({
  user: 'tu_usuario',
  host: 'localhost',
  database: 'el_manguito_db',
  password: 'tu_password',
  port: 5432,
});

module.exports = pool;
```

#### 4. Ruta de Productos (routes/products.js)

```javascript
// routes/products.js
const express = require('express');
const router = express.Router();
const pool = require('../config/database');

// GET /api/products - Obtener todos los productos
router.get('/', async (req, res) => {
  try {
    const result = await pool.query(`
      SELECT p.*, pc.name as category_name
      FROM products p
      LEFT JOIN product_categories pc ON p.category_id = pc.id
      WHERE p.is_available = true
      ORDER BY p.name
    `);
    
    res.json({
      success: true,
      data: result.rows
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({
      success: false,
      message: 'Error al obtener productos'
    });
  }
});

// GET /api/products/:id - Obtener un producto específico
router.get('/:id', async (req, res) => {
  try {
    const { id } = req.params;
    
    // Obtener producto
    const productResult = await pool.query(
      'SELECT * FROM products WHERE id = $1',
      [id]
    );
    
    if (productResult.rows.length === 0) {
      return res.status(404).json({
        success: false,
        message: 'Producto no encontrado'
      });
    }
    
    // Obtener imágenes del producto
    const imagesResult = await pool.query(
      'SELECT * FROM product_images WHERE product_id = $1 ORDER BY order_index',
      [id]
    );
    
    const product = productResult.rows[0];
    product.images = imagesResult.rows;
    
    res.json({
      success: true,
      data: product
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({
      success: false,
      message: 'Error al obtener producto'
    });
  }
});

// POST /api/products - Crear un nuevo producto
router.post('/', async (req, res) => {
  try {
    const { name, description, image_url, origin, usage, location, category_id } = req.body;
    
    const result = await pool.query(
      `INSERT INTO products (name, description, image_url, origin, usage, location, category_id)
       VALUES ($1, $2, $3, $4, $5, $6, $7)
       RETURNING *`,
      [name, description, image_url, origin, usage, location, category_id]
    );
    
    res.status(201).json({
      success: true,
      data: result.rows[0]
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({
      success: false,
      message: 'Error al crear producto'
    });
  }
});

// PUT /api/products/:id - Actualizar producto
router.put('/:id', async (req, res) => {
  try {
    const { id } = req.params;
    const { name, description, image_url, origin, usage, location } = req.body;
    
    const result = await pool.query(
      `UPDATE products
       SET name = $1, description = $2, image_url = $3, origin = $4, 
           usage = $5, location = $6, updated_at = CURRENT_TIMESTAMP
       WHERE id = $7
       RETURNING *`,
      [name, description, image_url, origin, usage, location, id]
    );
    
    if (result.rows.length === 0) {
      return res.status(404).json({
        success: false,
        message: 'Producto no encontrado'
      });
    }
    
    res.json({
      success: true,
      data: result.rows[0]
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({
      success: false,
      message: 'Error al actualizar producto'
    });
  }
});

// DELETE /api/products/:id - Eliminar producto
router.delete('/:id', async (req, res) => {
  try {
    const { id } = req.params;
    
    // Soft delete: solo marcamos como no disponible
    const result = await pool.query(
      `UPDATE products SET is_available = false WHERE id = $1 RETURNING *`,
      [id]
    );
    
    if (result.rows.length === 0) {
      return res.status(404).json({
        success: false,
        message: 'Producto no encontrado'
      });
    }
    
    res.json({
      success: true,
      message: 'Producto eliminado'
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({
      success: false,
      message: 'Error al eliminar producto'
    });
  }
});

module.exports = router;
```

#### 5. Autenticación con JWT (routes/auth.js)

```javascript
// routes/auth.js
const express = require('express');
const router = express.Router();
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const pool = require('../config/database');

const JWT_SECRET = 'tu_secreto_super_seguro'; // En producción, usa variable de entorno

// POST /api/auth/register - Registrar usuario
router.post('/register', async (req, res) => {
  try {
    const { name, email, password, phone } = req.body;
    
    // Verificar si el email ya existe
    const existingUser = await pool.query(
      'SELECT * FROM users WHERE email = $1',
      [email]
    );
    
    if (existingUser.rows.length > 0) {
      return res.status(400).json({
        success: false,
        message: 'El email ya está registrado'
      });
    }
    
    // Hash de la contraseña
    const hashedPassword = await bcrypt.hash(password, 10);
    
    // Crear usuario
    const result = await pool.query(
      `INSERT INTO users (name, email, password_hash, phone)
       VALUES ($1, $2, $3, $4)
       RETURNING id, name, email, phone, role, created_at`,
      [name, email, hashedPassword, phone]
    );
    
    const user = result.rows[0];
    
    // Generar token JWT
    const token = jwt.sign(
      { userId: user.id, email: user.email },
      JWT_SECRET,
      { expiresIn: '7d' }
    );
    
    res.status(201).json({
      success: true,
      data: {
        user,
        token
      }
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({
      success: false,
      message: 'Error al registrar usuario'
    });
  }
});

// POST /api/auth/login - Iniciar sesión
router.post('/login', async (req, res) => {
  try {
    const { email, password } = req.body;
    
    // Buscar usuario
    const result = await pool.query(
      'SELECT * FROM users WHERE email = $1',
      [email]
    );
    
    if (result.rows.length === 0) {
      return res.status(401).json({
        success: false,
        message: 'Credenciales inválidas'
      });
    }
    
    const user = result.rows[0];
    
    // Verificar contraseña
    const isValidPassword = await bcrypt.compare(password, user.password_hash);
    
    if (!isValidPassword) {
      return res.status(401).json({
        success: false,
        message: 'Credenciales inválidas'
      });
    }
    
    // Generar token JWT
    const token = jwt.sign(
      { userId: user.id, email: user.email },
      JWT_SECRET,
      { expiresIn: '7d' }
    );
    
    // No enviar el hash de la contraseña
    delete user.password_hash;
    
    res.json({
      success: true,
      data: {
        user,
        token
      }
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({
      success: false,
      message: 'Error al iniciar sesión'
    });
  }
});

module.exports = router;
```

---

## 📱 Frontend (Flutter)

### 1. Añadir Dependencia HTTP

```yaml
# pubspec.yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^1.1.0      # Para hacer requests HTTP
  shared_preferences: ^2.2.2  # Para guardar token
```

### 2. Crear Servicio API (lib/services/api_service.dart)

```dart
// lib/services/api_service.dart
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  // Cambiar por tu IP/dominio en producción
  static const String baseUrl = 'http://localhost:3000/api';
  
  // Obtener token guardado
  Future<String?> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }
  
  // Guardar token
  Future<void> _saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
  }
  
  // Headers con autenticación
  Future<Map<String, String>> _getHeaders() async {
    final token = await _getToken();
    return {
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }
  
  // ==================== AUTENTICACIÓN ====================
  
  Future<Map<String, dynamic>> register({
    required String name,
    required String email,
    required String password,
    String? phone,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/auth/register'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'name': name,
          'email': email,
          'password': password,
          'phone': phone,
        }),
      );
      
      final data = json.decode(response.body);
      
      if (response.statusCode == 201 && data['success']) {
        // Guardar token
        await _saveToken(data['data']['token']);
        return data;
      } else {
        throw Exception(data['message'] ?? 'Error al registrar');
      }
    } catch (e) {
      throw Exception('Error de conexión: $e');
    }
  }
  
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'email': email,
          'password': password,
        }),
      );
      
      final data = json.decode(response.body);
      
      if (response.statusCode == 200 && data['success']) {
        // Guardar token
        await _saveToken(data['data']['token']);
        return data;
      } else {
        throw Exception(data['message'] ?? 'Error al iniciar sesión');
      }
    } catch (e) {
      throw Exception('Error de conexión: $e');
    }
  }
  
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
  }
  
  // ==================== PRODUCTOS ====================
  
  Future<List<dynamic>> getProducts() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/products'),
        headers: await _getHeaders(),
      );
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['data'];
      } else {
        throw Exception('Error al cargar productos');
      }
    } catch (e) {
      throw Exception('Error de conexión: $e');
    }
  }
  
  Future<Map<String, dynamic>> getProduct(String id) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/products/$id'),
        headers: await _getHeaders(),
      );
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['data'];
      } else {
        throw Exception('Error al cargar producto');
      }
    } catch (e) {
      throw Exception('Error de conexión: $e');
    }
  }
  
  Future<Map<String, dynamic>> createProduct({
    required String name,
    required String description,
    required String imageUrl,
    required String origin,
    required String usage,
    required String location,
    String? categoryId,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/products'),
        headers: await _getHeaders(),
        body: json.encode({
          'name': name,
          'description': description,
          'image_url': imageUrl,
          'origin': origin,
          'usage': usage,
          'location': location,
          'category_id': categoryId,
        }),
      );
      
      final data = json.decode(response.body);
      
      if (response.statusCode == 201 && data['success']) {
        return data['data'];
      } else {
        throw Exception(data['message'] ?? 'Error al crear producto');
      }
    } catch (e) {
      throw Exception('Error de conexión: $e');
    }
  }
  
  // ==================== PLATILLOS ====================
  
  Future<List<dynamic>> getFoods() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/foods'),
        headers: await _getHeaders(),
      );
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['data'];
      } else {
        throw Exception('Error al cargar platillos');
      }
    } catch (e) {
      throw Exception('Error de conexión: $e');
    }
  }
  
  // ==================== VENTAS ====================
  
  Future<Map<String, dynamic>> createSale({
    required List<Map<String, dynamic>> items,
    required double totalAmount,
    required String paymentMethod,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/sales'),
        headers: await _getHeaders(),
        body: json.encode({
          'items': items,
          'total_amount': totalAmount,
          'payment_method': paymentMethod,
        }),
      );
      
      final data = json.decode(response.body);
      
      if (response.statusCode == 201 && data['success']) {
        return data['data'];
      } else {
        throw Exception(data['message'] ?? 'Error al crear venta');
      }
    } catch (e) {
      throw Exception('Error de conexión: $e');
    }
  }
  
  Future<Map<String, dynamic>> getSalesStats({
    required String period, // 'daily', 'weekly', 'monthly', 'yearly'
  }) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/sales/stats/$period'),
        headers: await _getHeaders(),
      );
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['data'];
      } else {
        throw Exception('Error al cargar estadísticas');
      }
    } catch (e) {
      throw Exception('Error de conexión: $e');
    }
  }
}
```

### 3. Actualizar Pantallas para Usar API

#### Login Screen (lib/screens/login_screen.dart)

```dart
import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'main_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _apiService = ApiService();
  bool _isLoading = false;
  
  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;
    
    setState(() {
      _isLoading = true;
    });
    
    try {
      final result = await _apiService.login(
        email: _emailController.text,
        password: _passwordController.text,
      );
      
      // Login exitoso
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => MainScreen()),
      );
    } catch (e) {
      // Mostrar error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Iniciar Sesión')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingresa tu email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingresa tu contraseña';
                  }
                  return null;
                },
              ),
              SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _login,
                  child: _isLoading
                      ? CircularProgressIndicator()
                      : Text('Iniciar Sesión'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

#### Product List con API (lib/screens/productsScreens/product_list.dart)

```dart
import 'package:flutter/material.dart';
import '../../services/api_service.dart';
import 'product_detail.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final _apiService = ApiService();
  List<dynamic> _products = [];
  bool _isLoading = true;
  String? _error;
  
  @override
  void initState() {
    super.initState();
    _loadProducts();
  }
  
  Future<void> _loadProducts() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });
    
    try {
      final products = await _apiService.getProducts();
      setState(() {
        _products = products;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        appBar: AppBar(title: Text('Productos')),
        body: Center(child: CircularProgressIndicator()),
      );
    }
    
    if (_error != null) {
      return Scaffold(
        appBar: AppBar(title: Text('Productos')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error, size: 64, color: Colors.red),
              SizedBox(height: 16),
              Text('Error: $_error'),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _loadProducts,
                child: Text('Reintentar'),
              ),
            ],
          ),
        ),
      );
    }
    
    return Scaffold(
      appBar: AppBar(title: Text('Productos')),
      body: RefreshIndicator(
        onRefresh: _loadProducts,
        child: ListView.builder(
          itemCount: _products.length,
          itemBuilder: (context, index) {
            final product = _products[index];
            return ListTile(
              leading: Image.network(
                product['image_url'],
                width: 50,
                height: 50,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.error);
                },
              ),
              title: Text(product['name']),
              subtitle: Text(product['description'] ?? ''),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProductDetail(productId: product['id']),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
```

---

## 🚀 Despliegue (Deploy)

### Backend

#### Opción 1: Heroku (Gratis)
```bash
# Instalar Heroku CLI
heroku login
heroku create nombre-app
git push heroku main
heroku addons:create heroku-postgresql:hobby-dev
```

#### Opción 2: Railway (Gratis)
- Conectar repo de GitHub
- Railway detecta Node.js automáticamente
- Añadir PostgreSQL desde dashboard

#### Opción 3: DigitalOcean / AWS / Google Cloud
- Configurar servidor (Droplet/EC2/Compute Engine)
- Instalar Node.js y PostgreSQL
- Usar PM2 para mantener app corriendo

### Frontend (Flutter)

#### Android APK
```bash
flutter build apk --release
# APK en: build/app/outputs/flutter-apk/app-release.apk
```

#### iOS
```bash
flutter build ios --release
# Requiere Mac y cuenta de Apple Developer
```

---

## 🔒 Consideraciones de Seguridad

1. **HTTPS:** Usar siempre HTTPS en producción
2. **Variables de Entorno:** No hardcodear secrets
3. **Rate Limiting:** Limitar requests por IP
4. **Validación:** Validar todos los inputs
5. **SQL Injection:** Usar queries parametrizadas
6. **CORS:** Configurar correctamente

---

## 📝 Checklist de Implementación

- [ ] Configurar base de datos PostgreSQL
- [ ] Crear tablas necesarias
- [ ] Desarrollar backend (endpoints)
- [ ] Probar endpoints con Postman
- [ ] Actualizar Flutter app para usar API
- [ ] Implementar autenticación
- [ ] Manejar errores y loading states
- [ ] Testear flujo completo
- [ ] Deploy backend
- [ ] Deploy frontend (APK)
- [ ] Configurar dominio y HTTPS

---

**Documento creado:** Diciembre 2024  
**Autor:** Equipo de Desarrollo El Manguito
