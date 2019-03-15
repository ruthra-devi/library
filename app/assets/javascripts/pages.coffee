# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$( document ).ready ->
  $.ajax '/search',
        type: 'GET'
        parameters: $( "#autocomplete_search" ).val()
        dataType: 'json'
        success: ( data ) ->
            #  here you'll have to append the results to whichever div/container you have in place
            $( '#autocomplete_search_results' ).append "#{ data }"