# frozen_string_literal: true
class ArticlesController < ApplicationController
  before_action :find_article, only: %i[show edit create destroy]

  def index
    @articles = Article.where(id: params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params_article)
    if @article.save
      redirect_to articles_path, notice: 'An article has been created!'
    else
      render :new
    end
  end

  def show
    find_article
  end

  def edit
    find_article
  end

  def update
    if @article.update(params_article)
      redirect_to articles_path, notice: 'An article has been update!'
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path, notice: 'An article has been deleted!'
  end

  private

  def params_article
    params.require(:article).permit(:title, :body)
  end

  def find_article
    @article = Article.find(id: parmas[:id])
  end
end
