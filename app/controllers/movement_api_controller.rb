class MovementApiController < ApiController
  before_action :set_client, only: [:transaction, :check_amount, :extract, :destroy_session]
  before_action :set_account, only: :transaction

  def transaction
    if !@client.nil? && !@account.nil?
      @total = @client.credit + @client.current_amount
      @value = params[:value].to_f
      if (@value > 0) && ((@total - @value) >= 0)
        if @value <= @client.current_amount
          @client.update(@client.current_amount - @value)
        else
          @value -= @client.current_amount
          @client.update(credit: @client.credit - @value, current_amount: 0.0)
        end

        @account.update(current_amount: @account.current_amount + @value)

        @transference = Transference.create(value: @value, account: @client, account_receiver_id: @account)
        render json: {"resp": "Transferência concluida com sucesso!", status: 200}
      else
        render json: {"erro": "Valor de Saldo + Crédito insuficiente!"}
      end
    else
      render json: {"erro": "Numero de agencia ou de conta invalidos!"}
    end
  end

  def check_amount
    if !@client.nil?
      render json: {"current_amount": @client.current_amount, "credit": @client.credit}
    end
    render json: ""
  end

  def extract
    require 'json'

    if !@client.nil?
      @extract = Transference.find_by(client: @client).or(Transference.find_by(account_receiver_id: @client.id))
      @extract = @extract.order(create_at: :desc)
      render json: JSON.generate(@extract)
    end
  end

  def create_session
    client = Account.find_by(number: params[:number], agency: params[:agency])
    if !client.nil? && client.authenticate(params[:password])
      token = SecureRandom.hex(16).to_s
      client.update(token: token.to_s)
      render json: {"token": client.token}
    end
  end

  def destroy_session
    unless @client.nil?
      @client.update(token: "")
    end
  end

  private
    def set_client
      account = Account.find_by(token: params[:token])
      if !account.nil?
        @client = account
      end
    end

    def set_account
      account = Account.find_by(number: params[:number], agency: params[:agency])
      if !account.nil?
        @account = account
      end
    end
end
