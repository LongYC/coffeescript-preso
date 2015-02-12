(function() {
  var ClassA, objectA;

  ClassA = (function() {
    function ClassA(instanceVariable) {
      this.instanceVariable = instanceVariable;
      this.method(this.instanceVariable);
    }

    ClassA.prototype.method = function(parameter) {
      return console.log("ClassA#method is called with parameter: " + parameter);
    };

    return ClassA;

  })();

  objectA = new ClassA('Hello');

  objectA.method('World');

}).call(this);
