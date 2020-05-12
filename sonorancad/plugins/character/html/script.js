$(function() {
	window.addEventListener('message', function(event) {
		if (event.data.type == "enableui") {
			document.body.style.display = event.data.enable ? "block" : "none";
		}
	});

	document.onkeyup = function (data) {
		if (data.which == 27) { // Escape key
			$.post('http://Sonorancad/escape', JSON.stringify({}));
		}
	};
	
	$("#register").submit(function(e) {
		e.preventDefault(); // Prevent form from submitting
		
		// Verify date
		var date = $("#dateofbirth").val();
		var dateCheck = new Date($("#dateofbirth").val());
		if (dateCheck == "Invalid Date") {
			date == "invalid";
		}
		$.post('http://Sonorancad/register', JSON.stringify({
			firstname: $("#firstname").val(),
			lastname: $("#lastname").val(),
			mi: $("#middleinitial").val(),
			aka: $("#aka").val(),
			dateofbirth: date,
			sex: $("input[type='radio'][name='sex']:checked").val(),
			height: $("#height").val(),
			weight: $("#height").val(),
			skin: $("#skin").val(),
			hair: $("#hair").val(),
			eyes: $("#eyes").val(),
			residence: $("#residence").val(),
			zip: $("#zip").val(),
			occupation: $("#occupation").val()
		}));
	});
});