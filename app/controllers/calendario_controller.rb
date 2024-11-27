class CalendarioController < ApplicationController
  def index
    @meses = %w[January February March April May June July August September October November December]
  end

  def show
    @mes = params[:mes]
    @ano = params[:ano].to_i

    meses = {
      "January" => 1, "February" => 2, "March" => 3, "April" => 4, "May" => 5, "June" => 6,
      "July" => 7, "August" => 8, "September" => 9, "October" => 10, "November" => 11, "December" => 12
    }

    @mes_numero = meses[@mes]

    @dias = (Date.new(@ano, @mes_numero).beginning_of_month..Date.new(@ano, @mes_numero).end_of_month).to_a
  end

  def mes_atual
    data_atual = Time.zone.today
    mes = l(data_atual, format: '%B')
    ano = data_atual.year

    redirect_to calendario_mes_path(ano: ano, mes: mes.capitalize)
  end
end
