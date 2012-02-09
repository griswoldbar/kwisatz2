kwisatz.routers.AppRouter = Backbone.Router.extend({
    routes: {
        ""         : "list",
        "quiz/:id" : "quizDetails"
    },
 
    list: function() {
        console.log('list');
        this.quizList = new kwisatz.models.QuizSet();
        this.quizListView = new kwisatz.views.QuizListView({model: this.quizList});
        this.quizList.fetch();
    },
 
    quizDetails: function(id) {
    }
});