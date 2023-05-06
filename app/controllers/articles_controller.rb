class ArticlesController < ApplicationController
  # include Auth
  # skip_before_action :authenticate_user!, only: %i[ index show ]

  # notice we also removed show action from set_article before action
  # this is because we want to allow visitors not logged in to be able to view the show page
  before_action :set_article, only: %i[ edit update destroy ]

  after_action :verify_authorized, except: %i[ index show ]

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
    # because we removed set_article before action for show, we will add it back here
    @article = Article.find(params[:id])

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
    # we don't run set_article for create, so we need to authorize the resource here
    authorize article

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

      # we authorize the resource here so all actions that depends on set_article can use it as authorized
      authorize @article

      rescue ActiveRecord::RecordNotFound
        redirect_to articles_path
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.fetch(:article, {}).permit(:title, :body)
    end
end
