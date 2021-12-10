require 'securerandom'

class UrlsController < ApplicationController
  before_action :set_url, only: %i[ show edit update destroy ]

  def index
    @urls = Url.all
  end

  def show
  end

  def new
    @url = Url.new
  end

  def create
    @alias = url_params[:short_url]
    @url_expiration = DateTime.now + 30

    if @alias.empty?
      @alias = SecureRandom.uuid[0..4]
    end

    @mini_url = "www.miniurl.com/urls/#{@alias}"
    @url = Url.new(:original_url => url_params[:original_url], :created_by => url_params[:created_by], :short_url => @mini_url, :url_slug => @alias, :url_expiration => @url_expiration, :url_usage => 0)
    respond_to do |format|
      if @url.save
        format.html { redirect_to @url, notice: "Url was successfully created." }
        format.json { render :show, status: :created, location: @url }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @url.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @url.destroy
    respond_to do |format|
      format.html { redirect_to urls_url, notice: "Url was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_url
      @url = Url.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def url_params
      params.require(:url).permit(:original_url, :short_url, :url_slug, :url_expiration, :url_usage, :created_by)
    end
end
