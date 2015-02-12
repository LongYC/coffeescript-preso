(function() {
  var array, index, item, process, _i, _len;

  array = ['itemA', 'itemB', 'itemC'];

  process = function(item, number) {
    return console.log(number + " is " + item);
  };

  for (index = _i = 0, _len = array.length; _i < _len; index = ++_i) {
    item = array[index];
    process(item, index);
  }

}).call(this);
