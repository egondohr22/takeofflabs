class HomeController < ApplicationController
    def new
        @products = Product.includes(:category).includes(image_attachment: :blob).all
        @products = @products.where("name LIKE ? OR description LIKE ?","%#{params[:search]}%","%#{params[:search]}%") if params[:search].present?

    end 
 end