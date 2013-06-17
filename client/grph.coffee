data = [
		["", "Maserati", "Mazda", "Mercedes", "Mini", "Mitsubishi"],
		["2009", 0, 2941, 4303, 354, 5814],
		["2010", 5, 2905, 2867, 412, 5284],
		["2011", 4, 2517, 4822, 552, 6127],
		["2012", 2, 2422, 5399, 776, 4151]
	]

				
Template.hello.events {
	'click #test': (e,t) ->
		console.log 'hello'
		tmp = $('#example').handsontable('getInstance')
		tmp1 = tmp.getData()
		console.log tmp1
}

Template.hello.rendered = ->
	$('#example').handsontable({
			data: data,
			minRows: 10,
			minCols: 10,
			minSpareRows: 1,
			minSpareCols: 1,
			autoWrapRow: true,
			colHeaders: true,
			contextMenu: true
		});