class TravelController < ApplicationController
  def index
  end

  def search
   countries = find_country(params[:country])
   unless countries
     flash[:alert] = 'Country not found'
     return render action: :index
   end
  end

  private
  def request_api(url)
    response = Excon.get( # solicitud get a la url especificada y envía mi clave RapidAPI (que toma
                          # que toma de nuestro entorno) y el host de la url (que RapidAPI usa para identifarme como desarrolador)
      url,
      headers: {
        'X-RapidAPI-Host' => URI.parse(url).host,
        'X-RapidAPI-Key' => ENV.fetch('RAPIDAPI_API_KEY')
      }
    ) # luego el método analiza la respuesta ylo convierte en un objeto ruby.
    # en caso de que la api devuelva algo diferente al estado 200 regresará nil
    return nil if response.status != 200
    JSON.parse(response.body)
  end
# el método find_country usa API REST Countries para obtener datos sobre un pais  
  def find_country(name)
    request_api(
      "https://restcountries-v1.p.rapidapi.com/name/#{URI.encode(name)}"
    )
  end

end
