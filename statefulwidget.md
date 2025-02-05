### **Les widgets Stateful dans Flutter**  

Dans **Flutter**, il existe deux types de widgets :  
1. **StatelessWidget** : ne change pas après sa création (il est immuable).  
2. **StatefulWidget** : peut être mis à jour dynamiquement, car il possède un **état mutable**.

---

## **1. Qu'est-ce qu'un `StatefulWidget` ?**
Un `StatefulWidget` est un widget qui peut **changer dynamiquement** au fil du temps en réponse aux interactions de l'utilisateur, aux animations ou aux mises à jour de données. Contrairement à un `StatelessWidget`, un `StatefulWidget` possède un **État (`State`)** qui peut être modifié.

> 📌 **Exemple d'utilisation :**   
> - Bouton qui change de couleur lorsqu'on clique dessus  
> - Champ de texte qui enregistre ce que l'utilisateur écrit  
> - Minuteur ou animation en cours

---

## **2. Structure d'un `StatefulWidget`**
Un widget `StatefulWidget` est composé de **deux classes** :
- **La classe principale** qui étend `StatefulWidget`
- **La classe d'état** (`State`) qui gère les changements de l'interface

### **Exemple simple : Un bouton qui change de texte lorsqu'on appuie dessus**
```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("StatefulWidget Exemple")),
        body: Center(
          child: MyButton(),
        ),
      ),
    );
  }
}

// 1. Définition du StatefulWidget
class MyButton extends StatefulWidget {
  @override
  _MyButtonState createState() => _MyButtonState();
}

// 2. Définition de la classe State associée
class _MyButtonState extends State<MyButton> {
  String buttonText = "Clique-moi !";

  // Méthode pour changer le texte du bouton
  void _changeText() {
    setState(() {
      buttonText = "Bravo, tu as cliqué !";
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _changeText,
      child: Text(buttonText),
    );
  }
}
```

### **Explication du code :**
1. **Création du StatefulWidget (`MyButton`)**
   - La classe `MyButton` étend `StatefulWidget` et crée une instance de `_MyButtonState` en appelant `createState()`.
   
2. **Définition de la classe `State` (`_MyButtonState`)**
   - Contient une variable `buttonText` pour stocker le texte du bouton.
   - La méthode `_changeText()` est appelée lorsqu'on appuie sur le bouton.
   - **`setState()`** permet de notifier Flutter qu'il faut **reconstruire l'interface** avec le nouveau texte.

---

## **3. Pourquoi utiliser `setState()` ?**
### **Sans `setState()`**
Si tu modifies une variable dans la classe `State` **sans appeler `setState()`**, l'interface ne sera pas mise à jour. Par exemple :

```dart
void _changeText() {
  buttonText = "Bravo, tu as cliqué !";  // ⚠️ Ne met pas à jour l'UI
}
```
L'interface ne changera **pas** car Flutter ne sait pas qu'il doit reconstruire le widget.

### **Avec `setState()`**
```dart
void _changeText() {
  setState(() {
    buttonText = "Bravo, tu as cliqué !";  // ✅ Met à jour l'UI
  });
}
```
Flutter détecte le changement et **reconstruit le widget**, mettant à jour l'interface utilisateur.

---

## **4. Cycle de vie d'un `StatefulWidget`**
Un `StatefulWidget` passe par plusieurs étapes **du cycle de vie**, qui sont des méthodes pouvant être surchargées :

| Méthode        | Description |
|---------------|------------|
| `createState()` | Création de l'état (appelée une seule fois) |
| `initState()` | Initialisation de l'état (appelée une seule fois au début) |
| `build()` | Construction de l'interface utilisateur |
| `setState()` | Demande la reconstruction de l'UI |
| `didUpdateWidget()` | Appelée si le widget est mis à jour |
| `dispose()` | Nettoyage avant que le widget soit détruit |

### **Exemple de `initState()` et `dispose()` :**
```dart
class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  void initState() {
    super.initState();
    print("Widget créé !");
  }

  @override
  void dispose() {
    print("Widget supprimé !");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text("Hello, Flutter !");
  }
}
```
✅ `initState()` est appelé une seule fois lors de la création du widget.  
✅ `dispose()` est appelé avant la destruction du widget.

---

## **5. Autres exemples d'utilisation des `StatefulWidget`**
### **Exemple 1 : Compteur avec `setState()`**
Un simple **compteur** qui s'incrémente à chaque pression d'un bouton :
```dart
class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int count = 0;

  void _increment() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Compteur : $count", style: TextStyle(fontSize: 24)),
        ElevatedButton(
          onPressed: _increment,
          child: Text("Incrémenter"),
        ),
      ],
    );
  }
}
```

---

## **6. Quand utiliser un `StatefulWidget` ?**
Utilise un **`StatefulWidget`** lorsque **l'interface doit être mise à jour dynamiquement**, par exemple :
✅ Lorsqu'un **texte, une couleur ou une image** change en réponse à une action  
✅ Lorsqu'un **compteur, une animation ou un état d'entrée utilisateur** doit être suivi  
✅ Lorsqu'on récupère des **données dynamiques (API, base de données, etc.)**  

### **Quand utiliser un `StatelessWidget` ?**
Si le widget **n'a pas d'état modifiable**, utilise un **`StatelessWidget`** (exemple : un simple texte, une icône ou un bouton qui ne change pas).

---

## **7. Conclusion**
🔹 Un `StatefulWidget` est utile lorsque l'interface **doit être mise à jour dynamiquement**.  
🔹 `setState()` est **indispensable** pour mettre à jour l'UI.  
🔹 Comprendre le **cycle de vie (`initState()`, `dispose()`)** permet d'optimiser les performances.  
