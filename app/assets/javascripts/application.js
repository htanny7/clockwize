// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
// REMOVE FOR ANGULAR require turbolinks

// ANGULAR
//= require vendor/angular/angular.js
//= require vendor/angular/angular-route.min.js
//= require vendor/angular/angular-resource.min.js
//= require angular-rails-templates

// ANGULAR PLUG-INS
// http://sagrawal14.github.io/bootstrap-angular-validation/#/
//= require vendor/bootstrap-angular-validation/bootstrap-angular-validation-all.min
// https://angular-ui.github.io/bootstrap/
//= require vendor/bootstrap-angular-ui/position

// BOOTSTRAP
//= require vendor/bootstrap/bootstrap.min

// APPLICATION
// Templates in app/assets/templates (but see step 5)
//= require_tree ../templates
//= require angular/app
//= require_tree ./angular/factories
//= require_tree ./angular/controllers
