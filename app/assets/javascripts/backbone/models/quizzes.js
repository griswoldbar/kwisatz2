kwisatz.models.Quiz = Backbone.Model.extend({
})

kwisatz.models.QuizSet = Backbone.Collection.extend({
 model : kwisatz.models.Quiz,
 url : '/quizzes',
 //find quiz by title
 findByTitle : function(title){},
 findByAuthor : function(author){}
})

