class ClientSessionController < ApplicationController
  before_action :new_client, only: [:create]
  before_action :set_client, only: [:update, :destroy]

  def create
    if !@client.nil?
      token = SecureRandom.hex(16).to_s
      @client.update(token: ""+token)
      render json: @client.token
    else
      puts(token)
      render json: "Cliente invalido"
    end
  end

  def update
    if !@client.nil?
      render json: @client.token
    end
  end

  def destroy
    if !@client.nil?
      @client.update(token: "")
    end
  end

  private
    def new_client
      if params[:token].nil?
        client = Client.find_by(login: params[:login])
        if client && client.authenticate(params[:password])
          @client = client
        end
      end
    end

    def set_client
      @client = Client.find_by(token: params[:token])
    end
end
