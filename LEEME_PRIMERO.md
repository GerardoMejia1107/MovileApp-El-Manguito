# README - Documentación de la Aplicación El Manguito

## 📋 Índice de Documentación

Esta carpeta contiene toda la documentación necesaria para entender y trabajar con la aplicación móvil "El Manguito" desarrollada en Flutter.

---

## 📚 Documentos Disponibles

### 1. **DOCUMENTACION_APP.md** 📱
**Archivo principal con toda la información técnica**

**Contenido:**
- Descripción general de la aplicación
- Estructura completa del proyecto Flutter
- Todas las funcionalidades implementadas (10 funcionalidades principales)
- Sistema de diseño y temas
- Modelos de datos actuales (hardcoded)
- **Recomendaciones completas de base de datos**
  - 11 entidades con sus campos
  - Relaciones entre tablas
  - Scripts SQL para crear tablas
- Dependencias utilizadas
- Guía de funcionamiento del código Flutter
- Endpoints del backend recomendados (30+ endpoints)

**¿Cuándo leerlo?**
- Cuando necesites una visión completa del proyecto
- Para entender qué hace cada pantalla
- Para diseñar la base de datos
- Para conocer los endpoints que necesitas crear

---

### 2. **ARQUITECTURA_VISUAL.md** 🎨
**Diagramas y visualizaciones de la arquitectura**

**Contenido:**
- Diagrama de flujo de navegación
- Wireframes de cada pantalla
- Sistema de temas con colores
- Estructura de archivos detallada con emojis
- Flujo de datos (actual vs futuro con backend)
- Arquitectura de autenticación
- Ciclo de vida de widgets
- Modelo de base de datos simplificado
- Roadmap de implementación

**¿Cuándo leerlo?**
- Para visualizar cómo funciona la navegación
- Para entender la estructura de carpetas
- Para ver el diseño de cada pantalla
- Para planificar la integración con backend

---

### 3. **GUIA_PRINCIPIANTES.md** 🎓
**Guía paso a paso para quienes NO conocen Flutter/Dart**

**Contenido:**
- ¿Qué es Flutter? Explicación simple
- Conceptos básicos: Widgets, StatelessWidget, StatefulWidget
- Introducción a Dart (variables, funciones, clases)
- Layouts básicos (Column, Row, ListView, etc.)
- Cómo leer el código de esta app
- Patrones comunes en el código
- Debugging y errores frecuentes
- Términos importantes
- 3 ejercicios prácticos para empezar
- Recursos de aprendizaje

**¿Cuándo leerlo?**
- Si es tu **primera vez con Flutter**
- Si no entiendes la sintaxis de Dart
- Si quieres aprender los conceptos básicos
- Antes de leer el código de la aplicación

---

### 4. **BACKEND_INTEGRATION.md** 🔧
**Guía completa para conectar la app con un backend**

**Contenido:**
- Arquitectura backend recomendada
- Tecnologías recomendadas (Node.js, Python, PHP, Firebase)
- **Ejemplo completo con Node.js + Express + PostgreSQL**
  - Estructura del proyecto backend
  - Configuración de base de datos
  - Rutas de productos (GET, POST, PUT, DELETE)
  - Autenticación con JWT
  - Código completo funcional
- **Código Flutter para consumir la API**
  - Servicio API completo (ApiService)
  - Pantalla de login funcional
  - Pantalla de productos con API
  - Manejo de errores y loading states
- Guía de despliegue (Heroku, Railway, AWS, etc.)
- Consideraciones de seguridad
- Checklist de implementación

**¿Cuándo leerlo?**
- Cuando estés listo para conectar con backend
- Para ver código de ejemplo completo
- Para implementar autenticación
- Para deployar la aplicación

---

## 🎯 ¿Por Dónde Empezar?

### Si NO conoces Flutter:
1. Lee **GUIA_PRINCIPIANTES.md** completo
2. Practica los ejercicios
3. Lee **DOCUMENTACION_APP.md** (secciones de estructura)
4. Mira **ARQUITECTURA_VISUAL.md** para visualizar
5. Explora el código de la app

### Si YA conoces Flutter:
1. Lee **DOCUMENTACION_APP.md** completo
2. Mira **ARQUITECTURA_VISUAL.md** para entender la estructura
3. Lee **BACKEND_INTEGRATION.md** cuando necesites backend
4. Empieza a trabajar

### Si solo quieres entender las funcionalidades:
1. Lee la sección "Funcionalidades Implementadas" en **DOCUMENTACION_APP.md**
2. Mira los wireframes en **ARQUITECTURA_VISUAL.md**

### Si necesitas diseñar la base de datos:
1. Lee la sección "Recomendaciones para Base de Datos" en **DOCUMENTACION_APP.md**
2. Mira el diagrama ERD en **ARQUITECTURA_VISUAL.md**
3. Usa los scripts SQL proporcionados

### Si vas a desarrollar el backend:
1. Lee "Endpoints del Backend Recomendados" en **DOCUMENTACION_APP.md**
2. Estudia el código de ejemplo en **BACKEND_INTEGRATION.md**
3. Implementa los endpoints uno por uno

---

## 📊 Resumen de la Aplicación

### Nombre
**Foody Bite** (El Manguito)

### Propósito
Aplicación móvil para la Cooperativa El Manguito en El Salvador que permite:
- Visualizar productos agrícolas locales (Yuca, Caña, Limón, etc.)
- Ver menú de platillos de comida
- Gestionar ventas con gráficos
- Perfil de usuario con foto
- Opciones para añadir productos y platillos

### Tecnologías
- **Frontend:** Flutter (Dart)
- **Backend (recomendado):** Node.js + Express + PostgreSQL
- **Alternativas:** Python/Django, PHP/Laravel, Firebase

### Estado Actual
✅ UI/UX completamente implementada  
✅ Navegación funcional  
✅ Datos hardcoded (en archivos util/)  
⏳ Pendiente: Integración con backend  
⏳ Pendiente: Base de datos  
⏳ Pendiente: Autenticación real  

---

## 🗂️ Estructura de la Aplicación

```
El Manguito App
│
├── 🏠 Home (Inicio)
│   ├── Imagen hero con bienvenida
│   ├── Lista de 5 platillos destacados
│   └── Lista de 5 productos destacados
│
├── 🍽️ Menu (A la Carta)
│   ├── Filtros por categoría
│   ├── 4 categorías de comida
│   └── 11 platillos en total
│
├── ➕ Add (Opciones)
│   ├── Añadir nuevo producto
│   ├── Añadir nuevo platillo
│   ├── Ver platillos añadidos
│   ├── Ver productos añadidos
│   ├── Ver amigos/relaciones
│   ├── Ver valoraciones
│   └── Ver ventas
│
├── 🛒 Products (Productos Agrícolas)
│   ├── Lista de 7 productos
│   └── Detalle con fotos del árbol/planta
│
└── 👤 Profile (Perfil)
    ├── Foto de perfil editable
    ├── Información del usuario
    └── Estadísticas
```

---

## 🗄️ Entidades de Base de Datos Recomendadas

1. **users** - Usuarios del sistema
2. **food_categories** - Categorías de platillos
3. **foods** - Platillos de comida
4. **food_ratings** - Valoraciones de platillos
5. **product_categories** - Categorías de productos
6. **products** - Productos agrícolas
7. **product_images** - Imágenes de productos
8. **sales** - Ventas realizadas
9. **sale_details** - Detalles de cada venta
10. **friendships** - Relaciones entre usuarios (opcional)
11. **merch_products** - Productos de merchandising

**Total:** 11 tablas principales

---

## 🚀 Próximos Pasos Recomendados

### Fase 1: Preparación (1-2 semanas)
- [ ] Estudiar documentación completa
- [ ] Entender el código actual de Flutter
- [ ] Decidir tecnología de backend
- [ ] Diseñar base de datos definitiva

### Fase 2: Backend (2-4 semanas)
- [ ] Configurar servidor y base de datos
- [ ] Crear tablas en PostgreSQL
- [ ] Implementar autenticación JWT
- [ ] Desarrollar endpoints de productos
- [ ] Desarrollar endpoints de platillos
- [ ] Desarrollar endpoints de ventas
- [ ] Probar con Postman/Insomnia

### Fase 3: Integración (2-3 semanas)
- [ ] Actualizar Flutter para consumir API
- [ ] Implementar pantalla de login/registro
- [ ] Migrar productos a API
- [ ] Migrar platillos a API
- [ ] Implementar sistema de ventas real
- [ ] Probar flujo completo

### Fase 4: Pulido (1-2 semanas)
- [ ] Manejar errores correctamente
- [ ] Añadir loading states
- [ ] Implementar caché local
- [ ] Optimizar rendimiento
- [ ] Testing de usuario

### Fase 5: Deploy (1 semana)
- [ ] Deployar backend (Heroku/Railway/AWS)
- [ ] Configurar dominio y HTTPS
- [ ] Build APK para Android
- [ ] Build IPA para iOS (si aplica)
- [ ] Publicar en tiendas (opcional)

**Tiempo estimado total:** 7-12 semanas

---

## 🆘 ¿Necesitas Ayuda?

### Recursos de Aprendizaje
- **Flutter:** https://flutter.dev/docs
- **Dart:** https://dart.dev/guides
- **Node.js:** https://nodejs.org/docs
- **PostgreSQL:** https://www.postgresql.org/docs

### Comunidades
- Flutter Discord
- Stack Overflow
- Reddit r/FlutterDev
- GitHub Discussions

---

## 📞 Contacto

Para dudas específicas sobre esta aplicación, contactar al equipo de desarrollo de la Cooperativa El Manguito.

---

## 📄 Licencia

Este proyecto es propiedad de la Cooperativa El Manguito, El Salvador.

---

## 🎉 ¡Éxito con el Proyecto!

Esta documentación fue creada para que puedas entender y continuar el desarrollo de esta aplicación sin problemas. Tómate tu tiempo para leer cada documento según tus necesidades.

**Recuerda:**
- No hay preguntas tontas
- Practica mucho
- Empieza con lo simple
- Pide ayuda cuando la necesites

---

**Documentación creada:** Diciembre 2024  
**Versión:** 1.0  
**Última actualización:** Diciembre 2024
