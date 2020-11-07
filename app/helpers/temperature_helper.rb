module TemperatureHelper
  def to_fahrenheit(temp)
    # Kelvin * 9/5 - 459.67
    fahrenheit = (temp.to_f * 9.fdiv(5) - 459.67).round(2)

    "#{fahrenheit}ºF"
  end
end
# Creamos un to_fahrenheitayudante, que es necesario
#para convertir la temperatura que obtuvimos de Kelvin a Fahrenheit
