// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require popper
//= require bootstrap-sprockets

//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
 document.addEventListener("turbolinks:load"
, function () {
  $(function(){
  ScrollReveal().reveal('.top_text', {
  duration: 1600,
   origin: 'bottom',
  distance: '50px',
  reset: true
});
});
 })

 document.addEventListener("turbolinks:load"
, function () {
$(function(){
  ScrollReveal().reveal('.new_arrival_content', {
  duration: 1600,
  origin: 'bottom',
  distance: '50px',
  reset: true
});
});
 })


 document.addEventListener("turbolinks:load"
, function () {
$(function(){
  ScrollReveal().reveal('.concept_title', {
  duration: 1600,
  origin: 'right',
  distance: '50px',
  reset: true
});
});
 })

 document.addEventListener("turbolinks:load"
, function () {
$(function(){
  ScrollReveal().reveal('.concept_text', {
  duration: 4000,

  reset: true
});
});
 })
 document.addEventListener("turbolinks:load"
, function () {
  $(function(){
  ScrollReveal().reveal('.top_message1', {
  duration: 1600,
  origin: 'right',
  distance: '50px',
  reset: true
});
});
 })
  document.addEventListener("turbolinks:load"
, function () {
  $(function(){
  ScrollReveal().reveal('.top_message2', {
  duration: 2600,
  reset: true
});
});
 })
  document.addEventListener("turbolinks:load"
, function () {
  $(function(){
  ScrollReveal().reveal('.top_message3', {
  duration: 1600,
  origin: 'right',
  distance: '100px',
  reset: true
});
});
 })
   document.addEventListener("turbolinks:load"
, function () {
  $(function(){
  ScrollReveal().reveal('.top_message4', {
  duration: 1600,
  reset: true
});
});
 })
  document.addEventListener("turbolinks:load"
, function () {
 $(function(){

$('div.product-boxs dl').hide();

$('div.product-boxs dl').each(function(i) {

$(this).delay(300 * i).fadeIn(500);
});
});
 })