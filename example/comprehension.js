(function() {
  var array, i, index, item, len, process;

  array = ['itemA', 'itemB', 'itemC'];

  process = function(item, number) {
    return console.log(number + " is " + item);
  };

  for (index = i = 0, len = array.length; i < len; index = ++i) {
    item = array[index];
    process(item, index);
  }

}).call(this);
