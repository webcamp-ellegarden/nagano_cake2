# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $("#delivery_address_postal_code").jpostal({
    postcode : [ "#delivery_address_postal_code" ],
    address  : {
                  "#delivery_address_prefecture_code" : "%3",
                  "#delivery_address_address_city"            : "%4",
                  "#delivery_address_address_street"          : "%5%6%7"
                }
  });