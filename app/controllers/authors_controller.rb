class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end

  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      redirect_to @author, notice: 'Author was successfully created.'
    else
      render :new
    end
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])
    if @author.update(author_params)
      redirect_to @author, notice: 'Author was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @author = Author.find(params[:id])
    @author.destroy
    redirect_to authors_url, notice: 'Author was successfully destroyed.'
  end

  private

  def author_params
    params.require(:author).permit(:first_name, :last_name, :birth_date, :nationality)
  end
end
