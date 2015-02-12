(function() {
  var functionA, functionB, functionC;

  functionA = function() {
    return variable;
  };

  functionB = function() {
    if (condition === true) {
      return 'bad';
    } else {
      return 'good';
    }
  };

  functionC = function() {};

}).call(this);
