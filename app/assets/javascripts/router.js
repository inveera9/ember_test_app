// For more information see: http://emberjs.com/guides/routing/

App.Router.map(function() {
  // this.resource('posts');
    this.resource('posts',{path:"/posts"})
    this.resource("new_post",{path: "/posts/new"})
    this.resource('post', {path: '/posts/:post_id'});
    this.resource('edit_post', {path: '/posts/:post_id/edit'});
    this.route("home");
    this.route("help");
    this.route("login");
    return this.route("registration");
  
  
});

App.PostsRoute = Ember.Route.extend({
  model: function(params) {
    return this.store.find('post');
  }
});

App.NewPostRoute = Ember.Route.extend({
  model: function(params) {
    return params;
  }
});
App.PostRoute = Ember.Route.extend({
  model: function(params) {
    return this.store.find('post', params.post_id);
  }
});

App.EditPostRoute = Ember.Route.extend({
  model: function(params) {
    return this.store.find('post',params.post_id);
  }
});

App.IndexRoute = Ember.Route.extend({
    beforeModel: function(transition) {
      return this.transitionTo('home');
    }
  });

  App.LoginRoute = Ember.Route.extend({
    model: function() {
      return Ember.Object.create();
    },
    setupController: function(controller, model) {
      controller.set('content', model);
      return controller.set("errorMsg", "");
    },
    actions: {
      login: function() {
        log.info("Logging in...");
        return this.controllerFor("auth").login(this);
      },
      cancel: function() {
        log.info("cancelling login");
        return this.transitionTo('home');
      }
    }
  });

  App.RegistrationRoute = Ember.Route.extend({
    model: function() {
      return Ember.Object.create();
    },
    actions: {
      register: function() {
        log.info("Registering...");
        return this.controllerFor("auth").register(this);
      },
      cancel: function() {
        log.info("cancelling registration");
        return this.transitionTo('home');
      }
    }
  });