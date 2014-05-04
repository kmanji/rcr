// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require js-routes
//= require_tree .

// Loads all Semantic javascripts
//= require semantic-ui

$(document).ready(function() {



	$('#signup').click(function(event){
		event.preventDefault()
		$('.ui.modal.signup').modal('setting', {
			closable: false,
			onApprove : function () {
				user = { user: {username: $(".signup_username").val(), email: $(".signup_email").val(), password: $(".signup_password").val(), password_confirmation: $('.signup_password_confirmation').val() } }
				promise = $.post("/users", user);
				promise.done(function(data) {
					alert("Logged in successfuly");
					location.reload();
				})

				promise.fail(function(data) {
					$('.ui.modal.signup .message.signup').html(data.responseJSON.errors.join("." + "<br>"));
				})
				return false
			}
		}).modal('show');
	}); 

	$('#login').click(function(event){
		event.preventDefault()

		$('.ui.modal.login').modal('setting', {
			closable: false,
			onApprove : function () {
				user = { user: {username: $(".login_username").val(), email: $(".login_username").val(), password: $(".login_password").val() } }
				response = $.post( "/users/sign_in", user, function(data){
					if(data.message == "not ok"){
						$('.ui.modal.login .message.login').html("Invalid username and password");
					}
					else{
						alert("Logged in successfuly");
						location.reload();
					}
				});
				return false;
			}
		}).modal('show');
	});

// dropdown for login and password reset
	$('.ui.dropdown.login').click(function(event){
		event.preventDefault()
		$('.ui.dropdown.login').dropdown('show');
	});

// dropdown for edit profile and logout.
	$('.ui.dropdown.user').click(function(event){
		event.preventDefault()
		$('.ui.dropdown.user').dropdown('show');
	});
});