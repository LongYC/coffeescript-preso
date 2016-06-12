array = ['itemA', 'itemB', 'itemC']

process = (item, number) -> console.log "#{number} is #{item}"

process item, index for item, index in array