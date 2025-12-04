# Cooperativa el Manguito - Aplicación Móvil

## 📱 Aplicación Móvil Flutter para la Cooperativa El Manguito

Esta es una aplicación móvil desarrollada en Flutter/Dart para la Cooperativa El Manguito en El Salvador. La aplicación permite gestionar productos agrícolas locales, menú de platillos de comida, ventas y perfiles de usuario.

### 🚀 Estado del Proyecto

✅ **UI/UX completamente implementada**  
✅ Navegación funcional con 5 pantallas principales  
✅ Sistema de temas claro/oscuro  
⏳ Pendiente: Integración con backend (por implementar por otro equipo)  

---

## 📚 Documentación Completa

Hemos creado documentación exhaustiva para ayudarte a entender y trabajar con esta aplicación:

### 🎯 **[LEEME_PRIMERO.md](./LEEME_PRIMERO.md)** ← **EMPIEZA AQUÍ**
Índice completo de toda la documentación con guías sobre qué leer según tus necesidades.

### 📖 Documentos Disponibles:

1. **[DOCUMENTACION_APP.md](./DOCUMENTACION_APP.md)** - Documentación técnica completa
   - Estructura del proyecto
   - Todas las funcionalidades implementadas
   - Recomendaciones de base de datos (11 entidades)
   - Endpoints del backend recomendados
   - Guía de funcionamiento del código

2. **[ARQUITECTURA_VISUAL.md](./ARQUITECTURA_VISUAL.md)** - Diagramas y visualizaciones
   - Diagramas de flujo de navegación
   - Wireframes de pantallas
   - Estructura de archivos
   - Modelos de base de datos

3. **[GUIA_PRINCIPIANTES.md](./GUIA_PRINCIPIANTES.md)** - Para quienes NO conocen Flutter
   - Conceptos básicos de Flutter y Dart
   - Cómo leer el código
   - Ejercicios prácticos
   - Recursos de aprendizaje

4. **[BACKEND_INTEGRATION.md](./BACKEND_INTEGRATION.md)** - Integración con backend
   - Ejemplo completo con Node.js + Express + PostgreSQL
   - Código de API Service en Flutter
   - Guía de despliegue
   - Consideraciones de seguridad

---

## 🎯 Funcionalidades Implementadas

### Pantallas Principales:
- 🏠 **Home** - Inicio con productos y platillos destacados
- 🍽️ **Menu** - Lista completa de platillos por categorías
- ➕ **Add** - Opciones para añadir productos/platillos
- 🛒 **Products** - Catálogo de productos agrícolas
- 👤 **Profile** - Perfil de usuario con foto editable

### Características:
- ✅ Splash screen con animación
- ✅ Navegación con bottom bar y transiciones
- ✅ 11 platillos organizados en 4 categorías
- ✅ 7 productos agrícolas con detalles
- ✅ Gráficos de ventas (fl_chart)
- ✅ Sistema de temas claro/oscuro
- ✅ Almacenamiento local (SharedPreferences)
- ✅ Selector de imágenes

---

## 🗄️ Base de Datos Recomendada

La documentación incluye el diseño completo de base de datos con **11 entidades**:

1. Users (Usuarios)
2. Food Categories (Categorías de platillos)
3. Foods (Platillos)
4. Food Ratings (Valoraciones)
5. Product Categories (Categorías de productos)
6. Products (Productos agrícolas)
7. Product Images (Imágenes de productos)
8. Sales (Ventas)
9. Sale Details (Detalles de ventas)
10. Friendships (Amistades - opcional)
11. Merch Products (Merchandising)

**Ver:** `DOCUMENTACION_APP.md` para scripts SQL completos

---

## 🚀 Cómo Empezar

### Prerrequisitos
- Flutter SDK 3.7.2 o superior
- Dart 3.7.2 o superior
- Android Studio / VS Code
- Emulador o dispositivo físico

### Instalación

```bash
# Clonar el repositorio
git clone https://github.com/GerardoMejia1107/MovileApp-El-Manguito.git

# Entrar al directorio
cd MovileApp-El-Manguito

# Instalar dependencias
flutter pub get

# Ejecutar la aplicación
flutter run
```

### Build para producción

```bash
# Android APK
flutter build apk --release

# iOS (requiere Mac)
flutter build ios --release
```

---

## 📦 Dependencias Principales

```yaml
dependencies:
  flutter:
    sdk: flutter
  fl_chart: ^0.66.0              # Gráficos y charts
  image_picker: ^1.1.0           # Selector de imágenes
  path_provider: ^2.0.15         # Acceso a directorios
  shared_preferences: ^2.2.2     # Almacenamiento local
```

---

## 🎨 Paleta de Colores

- **Primary (Verde bosque):** `#275448`
- **Secondary (Amarillo):** `#efcb69`
- **Third (Azul claro):** `#97c1e5`
- **Accent Green:** `#a7d5a2`

---

## 📱 Capturas de Pantalla

(Añadir capturas de pantalla aquí cuando estén disponibles)

---

## 🛣️ Roadmap

### Fase 1: Backend (Pendiente)
- [ ] Configurar servidor y base de datos
- [ ] Implementar autenticación JWT
- [ ] Crear endpoints REST API
- [ ] Integrar con Flutter

### Fase 2: Funcionalidades Adicionales (Futuro)
- [ ] Sistema de carrito de compras
- [ ] Procesamiento de pagos
- [ ] Notificaciones push
- [ ] Chat en tiempo real

### Fase 3: Deploy (Futuro)
- [ ] Publicar en Google Play Store
- [ ] Publicar en Apple App Store

---

## 👥 Equipo de Desarrollo

**Cooperativa El Manguito - Equipo de Desarrollo**

---

## 📄 Licencia

Este proyecto es propiedad de la Cooperativa El Manguito, El Salvador.

---

## 📞 Contacto

Para más información, contactar al equipo de desarrollo de la Cooperativa El Manguito.

---

## 🎓 Recursos

- [Documentación de Flutter](https://flutter.dev/docs)
- [Dart Language Tour](https://dart.dev/guides/language/language-tour)
- [Flutter Widget Catalog](https://docs.flutter.dev/ui/widgets)

---

**¡Gracias por tu interés en nuestro proyecto!** 🚀

Para detalles técnicos completos, **lee [LEEME_PRIMERO.md](./LEEME_PRIMERO.md)**