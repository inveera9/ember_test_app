// for more details see: http://emberjs.com/guides/models/defining-models/

App.Post = DS.Model.extend({
  title: DS.attr('string'),
  body: DS.attr('string')
});
