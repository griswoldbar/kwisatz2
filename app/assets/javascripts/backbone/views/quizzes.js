kwisatz.views.QuizListView = Backbone.View.extend({
  container: '#quizList',
  initialize: function() { this.model.bind("reset", this.render, this);},
  render: function(eventName) {
    _.each(this.model.models, function(quiz) {
     $(this.container).append(new kwisatz.views.QuizListItemView({model: quiz}).render().el);
    }, this);
    return this;
  }
});

kwisatz.views.QuizListItemView = Backbone.View.extend({
  tagName: "li",
  template: JST["backbone/templates/quiz_list_item"],
  render: function() {
    //$(this.el).html("blah");
     $(this.el).html(this.template(this.model.toJSON()));
    //var h = this.template(this.model);
    return this;
  }
});
