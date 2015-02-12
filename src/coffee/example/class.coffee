# Class declaration.
# (Which will be transcompiled into a prototypical object)

class ClassA

  # "@" means "this."
  constructor: (instanceVariable) ->
    @instanceVariable = instanceVariable
    @method @instanceVariable 

  # Proto
  method: (parameter) ->
    console.log "ClassA#method is called with parameter: #{parameter}"

# Test the class.

objectA = new ClassA 'Hello'
objectA.method 'World'