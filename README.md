# Flutter

# Basic Concepts

## 1. Widgets

Widgets are the basic building blocks of a Flutter app's user interface. Everything in Flutter is a widget, including layout models, controls, and even the app itself. Widgets are used to create complex UIs by composing smaller, reusable components.
example:
- MaterialApp 
	- Scaffold 
		- AppBar 
			- Title
			- Actions 
				- IconButton 
				- IconButton


## runApp()
1. **Sets Up the Root Widget**
`runApp()` takes a `Widget` as an argument. This widget becomes the root of the widget tree. The entire application’s widget hierarchy is built from this root widget.

3. **Attaches the Widget Tree to the Screen**
`runApp()` attaches the given widget tree to the screen. It creates an instance of `WidgetsFlutterBinding` if one doesn’t already exist, ensuring that the Flutter framework is properly initialized.

4. **Initializes the Rendering Process**
`runApp()` sets up the rendering pipeline. It starts the process of converting the widget tree into a render tree, which is then displayed on the screen.

4. **Handles App Lifecycle**
By initializing the root widget, `runApp()` also sets up the app’s lifecycle management. This includes responding to various app lifecycle events, such as starting, pausing, resuming, and stopping.

