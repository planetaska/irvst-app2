class ArticlesController < ApplicationController
  include Auth

  before_action :set_article, only: %i[ show edit update destroy ]
  skip_before_action :authenticate_user!, only: %i[ index show ]

  # GET /articles or /articles.json
  def index
    articles = Article.all

    render inertia: 'Articles/Index', props: {
      articles: articles.as_json(
        only: [:id, :title]
      )
    }
  end

  # GET /articles/1 or /articles/1.json
  def show
    render inertia: 'Articles/Show', props: {
      article: @article.as_json(
        only: [:id, :title, :body]
      )
    }
  end

  # GET /articles/new
  def new
    render inertia: 'Articles/New'
  end

  # GET /articles/1/edit
  def edit
    render inertia: 'Articles/Edit', props: {
      article: @article.as_json(
        only: [:id, :title, :body]
      )
    }
  end

  # POST /articles or /articles.json
  def create
    article = Article.new(article_params)

    if article.save
      redirect_to articles_path, notice: 'Article created.'
    else
      redirect_to new_article_path, inertia: { errors: article.errors }
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    if @article.update(article_params)
      redirect_to article_path(@article), notice: 'Article was successfully updated.'
    else
      redirect_to edit_article_path(@article), inertia: { errors: @article.errors }
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    if @article.destroy
      redirect_to articles_path, notice: 'Article was successfully destroyed.'
    else
      redirect_to articles_path, alert: 'Article cannot be deleted!'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.fetch(:article, {}).permit(:title, :body)
    end
end
