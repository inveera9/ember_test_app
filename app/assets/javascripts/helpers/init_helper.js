App.initApp = function(currentUser) {
    return App.__container__.lookup('controller:auth').set('currentUser', currentUser);
  };