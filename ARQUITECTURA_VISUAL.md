# Arquitectura Visual de la Aplicación El Manguito

## 📊 Diagrama de Flujo de Navegación

```
┌─────────────────────────────────────────────────────────────────────┐
│                         SPLASH SCREEN                                │
│                    (Animación de inicio 2s)                          │
│                         [Logo Manguito]                              │
└────────────────────────────┬────────────────────────────────────────┘
                             │
                             ▼
┌─────────────────────────────────────────────────────────────────────┐
│                        MAIN SCREEN                                   │
│                  (PageView con BottomNavigationBar)                  │
│                                                                       │
│  ┌───────┐  ┌────────┐  ┌─────────┐  ┌──────────┐  ┌─────────┐    │
│  │ Home  │  │ Menu   │  │   Add   │  │ Products │  │ Profile │    │
│  │ 🏠    │  │ 🍽️     │  │    ➕    │  │    🛒    │  │   👤    │    │
│  └───┬───┘  └───┬────┘  └────┬────┘  └────┬─────┘  └────┬────┘    │
└──────┼──────────┼────────────┼────────────┼─────────────┼──────────┘
       │          │             │            │              │
       ▼          ▼             ▼            ▼              ▼
```

## 🏠 Pantalla HOME (Inicio)

```
┌─────────────────────────────────────────────────────────┐
│                    HOME SCREEN                          │
├─────────────────────────────────────────────────────────┤
│                                                          │
│  ┌──────────────────────────────────────────────┐      │
│  │         HERO IMAGE SECTION                   │      │
│  │  ┌────────────────────────────────────────┐  │      │
│  │  │   [Imagen Hero con Overlay]            │  │      │
│  │  │   "Bienvenido a El Manguito"           │  │      │
│  │  │   "Descubre sabores únicos..."         │  │      │
│  │  └────────────────────────────────────────┘  │      │
│  └──────────────────────────────────────────────┘      │
│                                                          │
│  ┌──────────────────────────────────────────────┐      │
│  │  NUESTRA COMIDA          [Ver menu →]        │      │
│  ├──────────────────────────────────────────────┤      │
│  │  ┌──────┐  ┌──────┐  ┌──────┐  ┌──────┐    │      │
│  │  │[img] │  │[img] │  │[img] │  │[img] │    │      │
│  │  │Plate1│  │Plate2│  │Plate3│  │Plate4│    │      │
│  │  │$7.75 │  │$5.55 │  │$8.75 │  │$4.99 │    │      │
│  │  │⭐4.5 │  │⭐4.5 │  │⭐4.5 │  │⭐4.5 │    │      │
│  │  └──────┘  └──────┘  └──────┘  └──────┘    │      │
│  │      ← Scroll horizontal →                   │      │
│  └──────────────────────────────────────────────┘      │
│                                                          │
│  ┌──────────────────────────────────────────────┐      │
│  │  NUESTROS PRODUCTOS      [Ver más →]         │      │
│  ├──────────────────────────────────────────────┤      │
│  │   ┌───┐  ┌───┐  ┌───┐  ┌───┐  ┌───┐        │      │
│  │   │ ⭕ │  │ ⭕ │  │ ⭕ │  │ ⭕ │  │ ⭕ │        │      │
│  │   │Yuca│  │Caña│  │Limón│ │Naran│ │Cacao│   │      │
│  │   └───┘  └───┘  └───┘  └───┘  └───┘        │      │
│  │      ← Scroll horizontal →                   │      │
│  └──────────────────────────────────────────────┘      │
│                                                          │
└─────────────────────────────────────────────────────────┘
                         │
                    Click en item
                         ▼
          ┌──────────────────────────────┐
          │   FOOD DETAIL / PRODUCT      │
          │        DETAIL SCREEN         │
          └──────────────────────────────┘
```

## 🍽️ Pantalla MENU (A la Carta)

```
┌─────────────────────────────────────────────────────────┐
│                  PLATES LIST SCREEN                      │
├─────────────────────────────────────────────────────────┤
│  ┌──────────────────────────────────────────────┐      │
│  │  [Todos] [Italianos] [Mexicanos] [Comida... │      │
│  │         ← Filter Chips (Scroll) →            │      │
│  └──────────────────────────────────────────────┘      │
│                                                          │
│  ┌──────────────────────────────────────────────┐      │
│  │  Italianos                                    │      │
│  ├──────────────────────────────────────────────┤      │
│  │  ┌───┐  Rissotto Marinero         $7.75     │      │
│  │  │img│                                        │      │
│  │  └───┘                                        │      │
│  ├──────────────────────────────────────────────┤      │
│  │  ┌───┐  Lasagna Clásica           $6.50     │      │
│  │  │img│                                        │      │
│  │  └───┘                                        │      │
│  ├──────────────────────────────────────────────┤      │
│  │  ┌───┐  Pasta Alfredo             $6.99     │      │
│  │  │img│                                        │      │
│  │  └───┘                                        │      │
│  └──────────────────────────────────────────────┘      │
│                                                          │
│  ┌──────────────────────────────────────────────┐      │
│  │  Mexicanos                                    │      │
│  ├──────────────────────────────────────────────┤      │
│  │  ┌───┐  Tacos Mexicanos           $5.55     │      │
│  │  │img│                                        │      │
│  │  └───┘                                        │      │
│  └──────────────────────────────────────────────┘      │
│                                                          │
│                    ↓ Scroll ↓                           │
└─────────────────────────────────────────────────────────┘
```

## ➕ Pantalla ADD (Opciones)

```
┌─────────────────────────────────────────────────────────┐
│                     ADD SCREEN                           │
├─────────────────────────────────────────────────────────┤
│  Añadir                                                  │
│  ┌──────────────┐  ┌──────────────┐                    │
│  │   Añadir     │  │   Añadir     │                    │
│  │   Producto   │  │   Platillo   │                    │
│  │              │  │              │                    │
│  │   [➕ 🥬]   │  │   [➕ 🍔]   │                    │
│  └──────────────┘  └──────────────┘                    │
│                                                          │
│  Ver                                                     │
│  ┌──────────────┐  ┌──────────────┐                    │
│  │   Platillos  │  │   Productos  │                    │
│  │   Añadidos   │  │   Añadidos   │                    │
│  │              │  │              │                    │
│  │   [📋]      │  │   [📦]      │                    │
│  └──────────────┘  └──────────────┘                    │
│                                                          │
│  Otras Opciones                                          │
│  ┌──────────────┐  ┌──────────────┐                    │
│  │   Amigos/    │  │ Valoraciones │                    │
│  │  Relaciones  │  │              │                    │
│  │   [👥]      │  │   [⭐]      │                    │
│  └──────────────┘  └──────────────┘                    │
│                                                          │
│  ┌────────────────────────────────┐                    │
│  │      Ver Ventas [💰]          │                    │
│  └────────────────────────────────┘                    │
└─────────────────────────────────────────────────────────┘
                         │
                    Click Añadir
                         ▼
              ┌─────────────────┐
              │  DIALOG MODAL   │
              │  ┌───────────┐  │
              │  │  Nombre   │  │
              │  ├───────────┤  │
              │  │  [📷]    │  │
              │  │  Imagen   │  │
              │  ├───────────┤  │
              │  │Descripción│  │
              │  ├───────────┤  │
              │  │ [Guardar] │  │
              │  └───────────┘  │
              └─────────────────┘
```

## 🛒 Pantalla PRODUCTS (Productos Agrícolas)

```
┌─────────────────────────────────────────────────────────┐
│                 PRODUCT LIST SCREEN                      │
├─────────────────────────────────────────────────────────┤
│  🏪 Productos                                           │
│                                                          │
│  ┌──────────────────────────────────────────────┐      │
│  │  ┌────────────────────────────────────────┐  │      │
│  │  │   [Imagen Yuca con overlay]            │  │      │
│  │  │          YUCA                           │  │      │
│  │  └────────────────────────────────────────┘  │      │
│  └──────────────────────────────────────────────┘      │
│                                                          │
│  ┌──────────────────────────────────────────────┐      │
│  │  ┌────────────────────────────────────────┐  │      │
│  │  │   [Imagen Caña con overlay]            │  │      │
│  │  │          CAÑA                           │  │      │
│  │  └────────────────────────────────────────┘  │      │
│  └──────────────────────────────────────────────┘      │
│                                                          │
│  ┌──────────────────────────────────────────────┐      │
│  │  ┌────────────────────────────────────────┐  │      │
│  │  │   [Imagen Limón con overlay]           │  │      │
│  │  │          LIMÓN                          │  │      │
│  │  └────────────────────────────────────────┘  │      │
│  └──────────────────────────────────────────────┘      │
│                                                          │
│                    ↓ Scroll ↓                           │
└─────────────────────────────────────────────────────────┘
                         │
                    Click en item
                         ▼
┌─────────────────────────────────────────────────────────┐
│              PRODUCT DETAIL SCREEN                       │
├─────────────────────────────────────────────────────────┤
│  ┌──────────────────────────────────────────────┐      │
│  │   [Imagen grande del producto]               │      │
│  │   [← Botón volver]                           │      │
│  └──────────────────────────────────────────────┘      │
│                                                          │
│  YUCA                                                    │
│                                                          │
│  Raíz comestible rica en almidón, cultivada             │
│  por pequeños productores...                            │
│  [Ver más ▼]                                            │
│                                                          │
│  ─────────────────────────────────────────────          │
│                                                          │
│  🌍 Origen                                               │
│     Planta de Yuca (Manihot esculenta)                  │
│                                                          │
│  🔧 Usos                                                 │
│     Sopas, frita, puré, snacks.                         │
│                                                          │
│  📍 Ubicación                                            │
│     Zona oriental de El Salvador                        │
│                                                          │
│  Fotos del árbol o planta:                              │
│  ┌────┐  ┌────┐                                         │
│  │img1│  │img2│  ← Scroll →                            │
│  └────┘  └────┘                                         │
└─────────────────────────────────────────────────────────┘
```

## 👤 Pantalla PROFILE (Perfil)

```
┌─────────────────────────────────────────────────────────┐
│                   PROFILE SCREEN                         │
├─────────────────────────────────────────────────────────┤
│  👤 Mi perfil                                           │
│                                                          │
│  ┌────────────────────────────────────────┐            │
│  │  ┌─────┐                                │            │
│  │  │     │  Usuario Nombre                │            │
│  │  │ 👤  │  📧 email@example.com         │            │
│  │  │     │  📞 +503 XXXX-XXXX            │            │
│  │  └─────┘  [✏️ Editar]                 │            │
│  │   [📷]                                 │            │
│  └────────────────────────────────────────┘            │
│                                                          │
│  Estadísticas                                            │
│  ┌──────────────┐  ┌──────────────┐                    │
│  │   Productos  │  │   Platillos  │                    │
│  │       7      │  │      11      │                    │
│  └──────────────┘  └──────────────┘                    │
│                                                          │
└─────────────────────────────────────────────────────────┘
```

## 💰 Pantalla SALES (Ventas)

```
┌─────────────────────────────────────────────────────────┐
│                    SALES SCREEN                          │
├─────────────────────────────────────────────────────────┤
│  💰 Ventas                                              │
│                                                          │
│  ┌───────┐  ┌───────┐  ┌───────┐  ┌───────┐          │
│  │  Hoy  │  │Semana │  │  Mes  │  │  Año  │          │
│  └───────┘  └───────┘  └───────┘  └───────┘          │
│                                                          │
│  ┌──────────────────────────────────────────────┐      │
│  │         GRÁFICO DE LÍNEAS                     │      │
│  │  $                                             │      │
│  │  │    ╱╲                                       │      │
│  │  │   ╱  ╲      ╱╲                             │      │
│  │  │  ╱    ╲    ╱  ╲    ╱╲                      │      │
│  │  │ ╱      ╲  ╱    ╲  ╱  ╲                     │      │
│  │  │╱        ╲╱      ╲╱    ╲                    │      │
│  │  └─────────────────────────────► Tiempo       │      │
│  │   L   M   M   J   V   S   D                   │      │
│  └──────────────────────────────────────────────┘      │
│                                                          │
│  Resumen:                                               │
│  • Total del período: $X,XXX.XX                         │
│  • Promedio diario: $XXX.XX                             │
│  • Mejor día: Viernes ($XXX.XX)                         │
│                                                          │
└─────────────────────────────────────────────────────────┘
```

## 🎨 Sistema de Temas (Theme System)

```
┌──────────────────────────────────────────────────┐
│              THEME CONFIGURATION                  │
├──────────────────────────────────────────────────┤
│                                                   │
│  LIGHT THEME                  DARK THEME         │
│  ┌─────────────────┐          ┌───────────────┐ │
│  │ Primary:        │          │ Primary:      │ │
│  │ #275448 🟢     │          │ #97c1e5 🔵   │ │
│  │ (Verde bosque) │          │ (Azul claro) │ │
│  ├─────────────────┤          ├───────────────┤ │
│  │ Secondary:      │          │ Secondary:    │ │
│  │ #efcb69 🟡     │          │ #efcb69 🟡   │ │
│  │ (Amarillo)     │          │ (Amarillo)   │ │
│  ├─────────────────┤          ├───────────────┤ │
│  │ Background:     │          │ Background:   │ │
│  │ #FFFFFF ⬜     │          │ #060604 ⬛   │ │
│  │ (Blanco)       │          │ (Negro)      │ │
│  └─────────────────┘          └───────────────┘ │
│                                                   │
└──────────────────────────────────────────────────┘
```

## 📂 Estructura de Archivos Detallada

```
el_mango/
│
├── lib/
│   ├── main.dart ⭐ (Punto de entrada)
│   │
│   ├── screens/ 📱 (Pantallas)
│   │   ├── splash_screen.dart
│   │   ├── main_screen.dart ⭐ (Navegación principal)
│   │   ├── home.dart 🏠
│   │   ├── add.dart ➕
│   │   ├── sales.dart 💰
│   │   │
│   │   ├── productsScreens/
│   │   │   ├── product_list.dart 🛒
│   │   │   └── product_detail.dart 📦
│   │   │
│   │   ├── platesScreens/
│   │   │   ├── platesList.dart 🍽️
│   │   │   └── food_detail.dart 🍔
│   │   │
│   │   └── profileScreens/
│   │       └── profile.dart 👤
│   │
│   ├── widgets/ 🧩 (Componentes)
│   │   ├── food_item.dart
│   │   ├── food_edit_item.dart
│   │   ├── food_delete_item.dart
│   │   ├── product_edit_item.dart
│   │   ├── product_delete_item.dart
│   │   ├── category_item.dart
│   │   ├── trending_item.dart
│   │   ├── friend_item.dart
│   │   ├── radial_transition_overlay.dart
│   │   └── homeWidgets/
│   │       └── food_slide_item.dart
│   │
│   └── util/ 🔧 (Utilidades)
│       ├── const.dart ⚙️ (Temas y constantes)
│       ├── foods.dart 🍔 (Datos de platillos)
│       ├── productsInfo.dart 🌾 (Datos de productos)
│       ├── restaurants.dart 👕 (Merchandising)
│       ├── food_valoration.dart ⭐
│       ├── friendships.dart 👥
│       └── friends.dart 👤
│
├── assets/ 🖼️ (Recursos)
│   ├── icon/
│   │   └── icon_logo.png
│   ├── hero.jpg
│   ├── food1.jpeg ... food11.jpeg
│   ├── yuca.png, caña.png, limón.png ...
│   ├── yuca_arbol1.jpg, yuca_arbol2.jpg ...
│   ├── polo.png, camisa 1.png ...
│   └── ...
│
├── android/ 📱
├── ios/ 🍎
├── test/ 🧪
├── pubspec.yaml ⚙️ (Configuración y dependencias)
└── README.md 📖
```

## 🔄 Flujo de Datos (Data Flow)

```
┌──────────────────────────────────────────────────────────┐
│                     ACTUAL (Sin Backend)                  │
└──────────────────────────────────────────────────────────┘

util/foods.dart ─────────┐
util/productsInfo.dart ──┼──► Widgets ──► UI (Pantallas)
util/restaurants.dart ───┘      │
                                │
                                ▼
                        shared_preferences
                        (Foto de perfil)


┌──────────────────────────────────────────────────────────┐
│                   FUTURO (Con Backend)                    │
└──────────────────────────────────────────────────────────┘

                    ┌─────────────┐
                    │   Backend   │
                    │   REST API  │
                    └──────┬──────┘
                           │
                    HTTP Requests
                           │
                    ┌──────▼──────┐
                    │ API Service │
                    │  (Dart)     │
                    └──────┬──────┘
                           │
                    ┌──────▼──────┐
                    │   Widgets   │
                    │  (setState) │
                    └──────┬──────┘
                           │
                    ┌──────▼──────┐
                    │     UI      │
                    │  (Screens)  │
                    └─────────────┘
```

## 🔐 Arquitectura de Autenticación (Futura)

```
┌─────────────────────────────────────────────────────────┐
│                 AUTHENTICATION FLOW                      │
└─────────────────────────────────────────────────────────┘

  [Login Screen]
       │
       │ email + password
       ▼
  POST /api/auth/login
       │
       │ Response: { token, user }
       ▼
  Save token (SharedPreferences)
       │
       ▼
  [Main Screen]
       │
       │ Cada request incluye:
       │ Header: "Authorization: Bearer {token}"
       ▼
  API Endpoints protegidos
       │
       ├──► GET /api/products
       ├──► GET /api/foods
       ├──► POST /api/sales
       └──► ...
```

## 🎯 Ciclo de Vida de un Widget

```
┌──────────────────────────────────────────────┐
│        STATELESS WIDGET LIFECYCLE             │
└──────────────────────────────────────────────┘

Constructor
    │
    ▼
build() ──► [UI renderizada]
    │
    ▼
dispose (destrucción)


┌──────────────────────────────────────────────┐
│        STATEFUL WIDGET LIFECYCLE              │
└──────────────────────────────────────────────┘

Constructor
    │
    ▼
createState()
    │
    ▼
initState() ◄───┐
    │           │
    ▼           │
build()         │
    │           │
    ▼           │
[UI renderizada]│
    │           │
    │ ◄─────────┘
    │ setState() llamado
    │
    ▼
didUpdateWidget()
    │
    ▼
build()
    │
    ▼
dispose() (destrucción)
```

## 📊 Modelo de Base de Datos Simplificado

```
┌─────────────┐
│    users    │
├─────────────┤
│ id          │◄─────┐
│ name        │      │
│ email       │      │ Many
│ password    │      │
│ profile_img │      │
└─────────────┘      │
                     │
┌─────────────┐      │
│   sales     │      │
├─────────────┤      │
│ id          │      │
│ user_id     │──────┘
│ total       │
│ date        │
└──────┬──────┘
       │
       │ One to Many
       │
       ▼
┌──────────────┐
│sale_details  │
├──────────────┤
│ id           │
│ sale_id      │
│ item_type    │ ──► 'food' or 'product'
│ item_id      │ ──► Referencia a food.id o product.id
│ quantity     │
│ price        │
└──────────────┘


┌──────────────┐      ┌────────────────┐
│food_categories│      │product_categories│
├──────────────┤      ├────────────────┤
│ id           │      │ id             │
│ name         │      │ name           │
└──────┬───────┘      └────┬───────────┘
       │                   │
       │ One to Many       │ One to Many
       │                   │
       ▼                   ▼
┌──────────────┐      ┌─────────────┐
│    foods     │      │  products   │
├──────────────┤      ├─────────────┤
│ id           │      │ id          │
│ title        │      │ name        │
│ description  │      │ description │
│ image_url    │      │ image_url   │
│ price        │      │ origin      │
│ rating       │      │ usage       │
│ category_id  │      │ location    │
└──────┬───────┘      └─────┬───────┘
       │                    │
       │ One to Many        │ One to Many
       │                    │
       ▼                    ▼
┌──────────────┐      ┌────────────────┐
│food_ratings  │      │product_images  │
├──────────────┤      ├────────────────┤
│ id           │      │ id             │
│ food_id      │      │ product_id     │
│ user_id      │      │ image_url      │
│ rating       │      │ image_type     │
│ comment      │      └────────────────┘
└──────────────┘
```

## 🚀 Roadmap de Implementación

```
FASE 1: Backend Setup
├── Configurar servidor (Node.js/Django/Laravel)
├── Configurar base de datos (PostgreSQL)
├── Implementar autenticación JWT
└── Crear endpoints básicos

FASE 2: Integración API
├── Añadir dependencia HTTP en Flutter
├── Crear ApiService class
├── Implementar manejo de errores
└── Implementar loading states

FASE 3: Migración de Datos
├── Migrar datos hardcoded a BD
├── Actualizar widgets para consumir API
├── Implementar caché local
└── Testing

FASE 4: Funcionalidades Avanzadas
├── Sistema de carrito de compras
├── Procesamiento de pagos
├── Notificaciones push
└── Chat en tiempo real

FASE 5: Deploy
├── Build APK/IPA
├── Publicar en Play Store
├── Publicar en App Store
└── Configurar CI/CD
```

---

**Documento creado:** Diciembre 2024  
**Propósito:** Guía visual de la arquitectura de la aplicación El Manguito
