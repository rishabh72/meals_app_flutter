### onGenerateRoute

It takes a function which executes for any named navigation action(= pushNamed) for which no registered route was founed in the routes table. You should return a navigation action(eg MaterialPageRoute) in onGenerateRoute.

### onUnknownRoute

onGenerateRoute executes for any unregistered named route, onUnknownRoute executes if onGenerateRoute isn't defined or does not return a valid navigation action.
