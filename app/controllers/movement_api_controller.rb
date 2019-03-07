class MovementApiController < ApiController
  before_action :set_client
  before_action :set_account
  before_action :set_destiny, only: :transaction


  def transaction
    if !@client.nil? && !@account.nil? && !@destiny.nil?
      @total = @account.credit + @account.current_amount
      @value = params[:value].to_f
      if (@value > 0) && ((@total - @value) >= 0)
        if @value <= @account.current_amount
          @account.update(@account.current_amount - @value)
        else
          @value -= @account.current_amount
          @account.update(credit: @account.credit - @value, current_amount: 0.0)
        end

        @destiny.update(current_amount: @destiny.current_amount + @value)
        render json: {"resp": "Transferencia concluida com sucesso!", status: 200}
      end
    end
  end

  def show
    if !@client.nil? && !@account.nil?
      render json: {"current_amount": @account.current_amount, "credit": @account.credit}
    end
    render json: "client ou conta incorreta"
  end

  private
    def set_client
      client = Client.find_by(token: params[:token])
      if client
        @client = client
      end
    end

    def set_account
      agency = Agency.find_by(number: params[:account][:agency])
      if !agency.nil?
        account = Account.find_by(number: params[:account][:number], agency: agency)
        if account && account.authenticate(params[:account][:password])
          @account = account
        end
      end
    end

    def set_destiny
      agency = Agency.find_by(number: params[:destiny][:agency])
      if !agency.nil?
        account = Account.find_by(number: params[:destiny][:number], agency: agency)
        if !account.nil?
          @destiny = account
        end
      end
    end
end
