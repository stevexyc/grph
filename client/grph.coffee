# tmp1 = [
# 		["", "Maserati", "Mazda", "Mercedes", "Mini", "Mitsubishi"],
# 		["2009", 34, 2941, 4303, 354, 5814],
# 		["2010", 23, 2905, 2867, 412, 5284],
# 		["2011", 21, 2517, 4822, 552, 6127],
# 		["2012", 35, 2422, 5399, 776, 4151]
# 	]
tmp1 = [
		["2009", 134],
		["2010", 123],
		["2011", 121],
		["2012", 135]
	]

data = null
				
Template.hello.events {
	'click #test': (e,t) ->
		console.log 'hello'
		tmp = $('#table').handsontable('getInstance')
		tmp1 = tmp.getData()
		console.log tmp1
	'click #testdata': (e,t) ->
		console.log data
	'click #graphdata': (e,t) ->
		graphData()
}

Template.hello.rendered = ->
	if data is null 
		tmp = tmp1
	else 
		tmp = data
	$('#table').handsontable({
			data: tmp,
			minRows: 10,
			minCols: 10,
			minSpareRows: 1,
			minSpareCols: 1,
			autoWrapRow: true,
			colHeaders: true,
			contextMenu: true,
			afterChange: (change, source) ->
				console.log change
				save2Data(change)
				graphData()
	})

save2Data = (change) ->
	if data is null 
		data = tmp1
	if change?
		for cell in change
			data[cell[0]][cell[1]] = Number(cell[3])

graphData = ->
	$('#chart').html('')
	strn = ''
	# $('#chart').append('<p class="bar">TEST<p><p>TEST 2</p>')
	if data isnt null 
		for bar in data
			if bar[1] isnt null
				strn += '<div class="bar" style="text-align:center; width:' + bar[1] + 'px">'+ bar[0]+ '</div>'
	console.log strn
	$('#chart').append(strn)
	
