# Prepare environment, requires jQuery.

$carA = (($ '<div>').attr 'id', 'car-a').text 'Car A'
$carB = (($ '<div>').attr 'id', 'car-b').text 'Car B'
($ 'body').append $carA, $carB

# Test it.

class Car

  constructor: (@$car, @engineCapacity) ->
  	@startTellingEngineCapacity()

  startTellingEngineCapacity: () ->
    @$car.bind 'click', (event) =>
      console.log "This car is powered by a #{@engineCapacity} cc engine."

carA = new Car ($ '#car-a'), 1000
carB = new Car ($ '#car-b'), 2000