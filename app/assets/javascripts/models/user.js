// for more details see: http://emberjs.com/guides/models/defining-models/

App.User = DS.Model.extend({
  role: DS.attr('string'),
  email: DS.attr('string'),
  password: DS.attr('string'),
  password_confirmation: DS.attr('string')
});
