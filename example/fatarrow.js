(function() {
  var $carA, $carB, Car, carA, carB;

  $carA = (($('<div>')).attr('id', 'car-a')).text('Car A');

  $carB = (($('<div>')).attr('id', 'car-b')).text('Car B');

  ($('body')).append($carA, $carB);

  Car = (function() {
    function Car(_at_$car, _at_engineCapacity) {
      this.$car = _at_$car;
      this.engineCapacity = _at_engineCapacity;
      this.startTellingEngineCapacity();
    }

    Car.prototype.startTellingEngineCapacity = function() {
      return this.$car.bind('click', (function(_this) {
        return function(event) {
          return console.log("This car is powered by a " + _this.engineCapacity + " cc engine.");
        };
      })(this));
    };

    return Car;

  })();

  carA = new Car($('#car-a'), 1000);

  carB = new Car($('#car-b'), 2000);

}).call(this);
