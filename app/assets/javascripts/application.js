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

//= require jquery_ujs
//= require activestorage
//= require turbolinks

//= require jquery.jpostal
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
 
 $(function() {
  $(document).on('turbolinks:load', () => {
    $('#customer_postal_code').jpostal({
      postcode : [
        '#customer_postal_code'
      ],
      address: {
        "#customer_prefecture_code": "%3", // # 都道府県が入力される
        "#customer_address": "%4%5%6"
      }
    });
  });
});
