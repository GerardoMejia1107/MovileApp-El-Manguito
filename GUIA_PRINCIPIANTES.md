# Guía Completa para Principiantes: Tu Primera Vez con Flutter

## 👋 ¡Bienvenido a Flutter!

Esta guía está diseñada para personas que nunca han usado Flutter/Dart antes. Te explicaré todo de forma simple y paso a paso.

---

## 📚 ¿Qué es Flutter?

**Flutter** es como una caja de herramientas que te permite crear aplicaciones para teléfonos (Android e iOS) escribiendo el código una sola vez.

**Dart** es el lenguaje de programación que Flutter usa. Es similar a JavaScript, Java o C#.

### Analogía Simple:
- Si construir una app es como construir una casa...
- **Flutter** son las herramientas (martillo, sierra, taladro)
- **Dart** es el lenguaje que usas para dar las instrucciones
- **Widgets** son los bloques de construcción (ladrillos, ventanas, puertas)

---

## 🧱 Conceptos Básicos de Flutter

### 1. Todo es un Widget

En Flutter, **TODO** lo que ves en la pantalla es un "Widget". Un Widget es simplemente un componente visual.

**Ejemplos de Widgets:**
- Un botón = Widget
- Un texto = Widget
- Una imagen = Widget
- Una pantalla completa = Widget (compuesto de otros widgets)

```dart
// Ejemplo simple
Text("Hola Mundo")  // Este es un widget de texto
Button("Click aquí") // Este es un widget de botón
Image("logo.png")    // Este es un widget de imagen
```

### 2. Tipos de Widgets

Hay 2 tipos principales:

#### **StatelessWidget** (Sin Estado)
Es un widget que **NO cambia** después de crearse.

**Ejemplo del mundo real:** Una señal de tráfico que siempre dice "ALTO" - nunca cambia.

```dart
class MiTextoFijo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("Este texto nunca cambia");
  }
}
```

#### **StatefulWidget** (Con Estado)
Es un widget que **SÍ puede cambiar** durante su vida.

**Ejemplo del mundo real:** Un contador que aumenta cada vez que presionas un botón.

```dart
class MiContador extends StatefulWidget {
  @override
  _MiContadorState createState() => _MiContadorState();
}

class _MiContadorState extends State<MiContador> {
  int contador = 0;  // Este valor PUEDE cambiar
  
  void incrementar() {
    setState(() {
      contador++;  // Cuando cambias el valor con setState()
                   // Flutter redibuja el widget automáticamente
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Contador: $contador"),
        Button(
          onPressed: incrementar,
          child: Text("Incrementar"),
        ),
      ],
    );
  }
}
```

### 3. La Función `build()`

**Toda pantalla o widget tiene una función `build()`** que le dice a Flutter cómo dibujar ese widget.

```dart
@override
Widget build(BuildContext context) {
  return Container(
    child: Text("Mi contenido"),
  );
}
```

**Piensa en `build()` como una receta de cocina:**
- Le dices a Flutter: "Para hacer esta pantalla, necesitas un Container, y dentro pon un Text"
- Flutter sigue las instrucciones y dibuja la pantalla

---

## 📦 Estructura de un Proyecto Flutter

Cuando abres el proyecto, verás esta estructura:

```
mi_proyecto/
├── lib/              ← AQUÍ está tu código Dart
│   ├── main.dart     ← El archivo principal (¡EMPIEZA AQUÍ!)
│   ├── screens/      ← Las pantallas de tu app
│   └── widgets/      ← Componentes reutilizables
├── assets/           ← Imágenes, fuentes, etc.
├── android/          ← Configuración de Android
├── ios/              ← Configuración de iOS
└── pubspec.yaml      ← Configuración del proyecto (como package.json en Node)
```

### ¿Por dónde empezar a leer el código?

1. **SIEMPRE empieza por `lib/main.dart`** - Es la puerta de entrada
2. Luego ve a la primera pantalla que se muestra
3. De ahí sigue el flujo de navegación

---

## 🎯 Conceptos Clave de Dart (El Lenguaje)

### Variables y Tipos

```dart
// Tipos básicos
String nombre = "Juan";              // Texto
int edad = 25;                       // Número entero
double precio = 19.99;               // Número decimal
bool activo = true;                  // Verdadero/Falso
List<String> frutas = ["🍎", "🍌"]; // Lista (como array)
Map<String, int> edades = {          // Mapa (como objeto/diccionario)
  "Juan": 25,
  "Ana": 30,
};

// Variables que pueden ser null
String? apellido;  // El "?" significa que puede ser null
apellido = null;   // Esto es válido
// apellido = "Pérez"; // Esto también es válido
```

### Funciones

```dart
// Función simple
void saludar() {
  print("¡Hola!");
}

// Función con parámetros
void saludarA(String nombre) {
  print("¡Hola $nombre!");  // $nombre inserta el valor
}

// Función que retorna algo
String obtenerSaludo(String nombre) {
  return "¡Hola $nombre!";
}

// Función flecha (shorthand)
String obtenerSaludo(String nombre) => "¡Hola $nombre!";

// Función con parámetros con nombre
void crearUsuario({
  required String nombre,  // required = obligatorio
  int edad = 18,           // valor por defecto
}) {
  print("Usuario: $nombre, edad: $edad");
}

// Uso: crearUsuario(nombre: "Juan", edad: 25);
```

### Clases

```dart
class Persona {
  // Propiedades
  String nombre;
  int edad;
  
  // Constructor
  Persona({required this.nombre, required this.edad});
  
  // Método
  void saludar() {
    print("Hola, soy $nombre y tengo $edad años");
  }
}

// Uso
Persona persona = Persona(nombre: "Juan", edad: 25);
persona.saludar();
```

### Null Safety (Seguridad de Nulos)

Dart tiene un sistema para evitar errores por valores `null`:

```dart
String? nombre;  // Puede ser null

// Forma segura de usar:
if (nombre != null) {
  print(nombre.length);
}

// O usando el operador ?.
print(nombre?.length);  // Si nombre es null, devuelve null

// Operador ?? (si es null, usa este valor)
String nombreFinal = nombre ?? "Anónimo";
```

### Async/Await (Operaciones Asíncronas)

Cuando haces llamadas a internet o bases de datos, usas async/await:

```dart
// Función asíncrona
Future<String> obtenerDatosDeInternet() async {
  // Simula esperar 2 segundos
  await Future.delayed(Duration(seconds: 2));
  return "Datos recibidos";
}

// Uso
void cargar() async {
  String datos = await obtenerDatosDeInternet();
  print(datos);
}
```

**Piensa en `async/await` como:**
- `async`: "Esta función tomará tiempo"
- `await`: "Espera aquí hasta que termine"

---

## 🎨 Layouts Básicos en Flutter

### Column (Apilar Verticalmente)

```dart
Column(
  children: [
    Text("Arriba"),
    Text("Medio"),
    Text("Abajo"),
  ],
)
```

```
┌─────────────┐
│   Arriba    │
│   Medio     │
│   Abajo     │
└─────────────┘
```

### Row (Apilar Horizontalmente)

```dart
Row(
  children: [
    Text("Izq"),
    Text("Centro"),
    Text("Der"),
  ],
)
```

```
┌─────────────────────────┐
│ Izq  Centro  Der        │
└─────────────────────────┘
```

### Container (Caja Versátil)

```dart
Container(
  width: 100,
  height: 100,
  color: Colors.blue,
  child: Text("Dentro"),
)
```

### Stack (Apilar Elementos Encima de Otros)

```dart
Stack(
  children: [
    Image.asset("fondo.jpg"),      // Abajo
    Positioned(
      top: 20,
      left: 20,
      child: Text("Texto encima"),  // Encima
    ),
  ],
)
```

### ListView (Lista con Scroll)

```dart
ListView(
  children: [
    Text("Item 1"),
    Text("Item 2"),
    Text("Item 3"),
  ],
)
```

---

## 🚀 Cómo Leer el Código de Esta App

### Paso 1: Lee `main.dart`

```dart
void main() {
  runApp(const MyApp());  // ← Inicia la app con MyApp
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(     // ← Configura la app
      home: SplashScreen(), // ← Primera pantalla
    );
  }
}
```

**Traducción:** "Cuando la app inicia, muestra SplashScreen"

### Paso 2: Sigue a `SplashScreen`

```dart
class SplashScreen extends StatefulWidget {
  // Muestra logo por 2 segundos
  // Luego navega a MainScreen
}
```

### Paso 3: Ve a `MainScreen`

```dart
class MainScreen extends StatefulWidget {
  // Esta pantalla tiene:
  // - PageView con 5 páginas
  // - BottomNavigationBar con 5 botones
}
```

### Paso 4: Explora cada Pantalla

```dart
// screens/home.dart
class Home extends StatelessWidget {
  // Pantalla de inicio
  // Muestra productos y platillos
}

// screens/platesScreens/platesList.dart
class PlatesList extends StatefulWidget {
  // Lista de platillos
  // Filtros por categoría
}
```

---

## 🎯 Patrones Comunes en el Código

### 1. Mostrar Datos en una Lista

```dart
List<String> items = ["Item 1", "Item 2", "Item 3"];

ListView.builder(
  itemCount: items.length,           // Cantidad de items
  itemBuilder: (context, index) {    // Función para construir cada item
    return Text(items[index]);
  },
)
```

**Traducción:** "Por cada elemento en la lista, crea un widget Text"

### 2. Navegar a Otra Pantalla

```dart
// Ir a otra pantalla
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => OtraPantalla(),
  ),
);

// Volver atrás
Navigator.pop(context);
```

### 3. Cambiar Estado (Actualizar UI)

```dart
class MiWidget extends StatefulWidget {
  @override
  _MiWidgetState createState() => _MiWidgetState();
}

class _MiWidgetState extends State<MiWidget> {
  String texto = "Hola";
  
  void cambiarTexto() {
    setState(() {          // ← Esto redibuja el widget
      texto = "Adiós";
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(texto),
        Button(
          onPressed: cambiarTexto,
          child: Text("Cambiar"),
        ),
      ],
    );
  }
}
```

### 4. Cargar Datos desde Archivo

```dart
// En util/foods.dart está la lista de platillos
List<Map<String, dynamic>> categorizedFoods = [
  {
    "category": "Italianos",
    "plates": [...]
  }
];

// En la pantalla:
import '../util/foods.dart';

// Ahora puedes usar categorizedFoods
ListView.builder(
  itemCount: categorizedFoods.length,
  itemBuilder: (context, index) {
    return Text(categorizedFoods[index]["category"]);
  },
)
```

---

## 🔍 Debugging (Encontrar Errores)

### Usar `print()` para ver valores

```dart
void miFunction() {
  String nombre = "Juan";
  print("El nombre es: $nombre");  // Se muestra en la consola
  
  int edad = 25;
  print("La edad es: $edad");
}
```

### Errores Comunes

#### 1. "Null check operator used on a null value"
**Problema:** Intentas usar una variable que es `null`

```dart
String? nombre;
print(nombre.length);  // ❌ Error

// Solución:
if (nombre != null) {
  print(nombre.length);  // ✅ Bien
}
```

#### 2. "setState() called after dispose()"
**Problema:** Intentas actualizar un widget que ya fue destruido

```dart
// Solución: Verificar antes de setState
if (mounted) {  // mounted = el widget aún existe
  setState(() {
    // ...
  });
}
```

#### 3. "A RenderFlex overflowed by X pixels"
**Problema:** Tu contenido no cabe en el espacio disponible

```dart
// Solución: Envuelve en SingleChildScrollView
SingleChildScrollView(
  child: Column(
    children: [
      // Mucho contenido...
    ],
  ),
)
```

---

## 📖 Términos Importantes

| Término | Significado |
|---------|-------------|
| **Widget** | Cualquier componente visual (botón, texto, imagen, etc.) |
| **StatelessWidget** | Widget que no cambia |
| **StatefulWidget** | Widget que puede cambiar |
| **setState()** | Función que actualiza la interfaz |
| **Context** | Información sobre dónde está el widget en el árbol |
| **build()** | Función que describe cómo dibujar el widget |
| **Scaffold** | Estructura básica de una pantalla (appbar, body, etc.) |
| **Navigator** | Maneja la navegación entre pantallas |
| **Future** | Representa un valor que estará disponible en el futuro |
| **async/await** | Para operaciones que toman tiempo (internet, BD, etc.) |

---

## 🎓 Ejercicios Prácticos para Empezar

### Ejercicio 1: Cambiar un Texto

**Objetivo:** Hacer un botón que cambie el texto mostrado

```dart
class MiPrimeraApp extends StatefulWidget {
  @override
  _MiPrimeraAppState createState() => _MiPrimeraAppState();
}

class _MiPrimeraAppState extends State<MiPrimeraApp> {
  String mensaje = "Hola Mundo";
  
  void cambiarMensaje() {
    setState(() {
      mensaje = "¡Texto cambiado!";
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mi App")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(mensaje, style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: cambiarMensaje,
              child: Text("Cambiar Texto"),
            ),
          ],
        ),
      ),
    );
  }
}
```

### Ejercicio 2: Contador

**Objetivo:** Crear un contador que aumente con un botón

```dart
class Contador extends StatefulWidget {
  @override
  _ContadorState createState() => _ContadorState();
}

class _ContadorState extends State<Contador> {
  int numero = 0;
  
  void incrementar() {
    setState(() {
      numero++;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Contador")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$numero",
              style: TextStyle(fontSize: 48),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: incrementar,
              child: Text("+ 1"),
            ),
          ],
        ),
      ),
    );
  }
}
```

### Ejercicio 3: Lista Simple

**Objetivo:** Mostrar una lista de elementos

```dart
class ListaSimple extends StatelessWidget {
  final List<String> frutas = [
    "🍎 Manzana",
    "🍌 Plátano",
    "🍊 Naranja",
    "🍇 Uvas",
    "🍓 Fresa",
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Frutas")),
      body: ListView.builder(
        itemCount: frutas.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(frutas[index]),
            onTap: () {
              print("Tocaste: ${frutas[index]}");
            },
          );
        },
      ),
    );
  }
}
```

---

## 🚀 Próximos Pasos

1. **Lee el código de esta app línea por línea**
   - Empieza por `main.dart`
   - Usa `print()` para ver qué valores tienen las variables

2. **Haz pequeños cambios**
   - Cambia colores
   - Cambia textos
   - Añade un botón

3. **Experimenta**
   - Crea un nuevo widget simple
   - Añade una nueva pantalla
   - Modifica una pantalla existente

4. **Estudia estos temas en orden:**
   - Widgets básicos (Text, Button, Image, Container)
   - Layouts (Column, Row, Stack)
   - Navigation (Navigator.push/pop)
   - State management (setState)
   - Async/await y Future
   - HTTP requests

---

## 📚 Recursos Recomendados

### Documentación Oficial
- [Flutter.dev](https://flutter.dev) - Sitio oficial
- [Widget Catalog](https://docs.flutter.dev/ui/widgets) - Todos los widgets

### Videos (YouTube)
- "Flutter Tutorial for Beginners" por The Net Ninja
- Canal oficial de Flutter
- Curso de Flutter en español (múltiples canales)

### Práctica
- [DartPad](https://dartpad.dev) - Editor online para practicar
- [Flutter Codelabs](https://docs.flutter.dev/codelabs) - Tutoriales interactivos

---

## ❓ Preguntas Frecuentes

### ¿Necesito saber Kotlin o Swift?
**No.** Flutter te permite hacer apps para Android e iOS sin saber esos lenguajes.

### ¿Es Dart difícil de aprender?
**No.** Si sabes JavaScript, Java o C#, Dart es muy similar.

### ¿Puedo hacer apps reales con Flutter?
**Sí.** Apps como Google Ads, Alibaba y muchas más usan Flutter.

### ¿Cómo instalo Flutter?
Visita: https://docs.flutter.dev/get-started/install

### ¿Puedo usar Flutter sin internet?
Sí, una vez instalado. Solo necesitas internet para descargar paquetes.

---

## 💡 Consejos Finales

1. **No te frustres** - Todos empezamos sin saber nada
2. **Practica diario** - Aunque sean 15 minutos
3. **Lee código de otros** - Aprende viendo ejemplos
4. **Usa `print()` liberalmente** - Para entender qué está pasando
5. **Pregunta en comunidades** - StackOverflow, Reddit, Discord

---

**¡Buena suerte en tu viaje con Flutter! 🚀**

Si tienes dudas sobre esta app específica, revisa los otros documentos de documentación:
- `DOCUMENTACION_APP.md` - Documentación completa
- `ARQUITECTURA_VISUAL.md` - Diagramas visuales
