kwisatz.views.QuizListView = Backbone.View.extend({
    el: $('#quizList'),
    initialize: function() {
        this.model.bind("reset", this.render, this);
    },
    render: function(eventName) {
        _.each(this.model.models, function(quiz) {
            $(this.el).append(
                new kwisatz.views.QuizListItemView({model: quiz}).render().el);
        }, this);
        return this;
    }
});

kwisatz.views.QuizListItemView = Backbone.View.extend({
    tagName: "li",
    render: function(eventName) {
        $(this.el).html(this.template(this.model.toJSON()));
        return this;
    }
});
