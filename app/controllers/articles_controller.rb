class ArticlesController < ApplicationController
    def index
        @articles = Article.all
    end
    def new 
        @article = Article.new
    end
    
    def create
        article = Article.new
        article.name = params[:article][:name]
        article.content = params[:article][:content]
        if article.save
            flash[:notice] = "Article save successfully."
        else
            flash[:notice] = "Article not save."
        end
        redirect_to "/articles"
    end

    def show
        @article = Article.find(params[:id])
    end

    def edit
        @article = Article.find(params[:id])
    end

    def update
        article = Article.find(params[:id])
        article.content = params[:article][:content]
        if article.save
            flash[:notice] = "Article updated."
        else
            flash[:notice] = "Article updated Fails. Try later."
        end
        redirect_to "/articles"
    end

    def makecomment
        @article = Article.find(params[:article_id])
        Comment.create(commentable: @article,comment_body: params[:comment],
                        user_name: params[:name])
        flash[:notice] = "you commented on an article."               
        #  p params[:name]
        #  p params[:comment]
        redirect_to "/articles"
    end
end
