/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

jQuery.noConflict();
window.onload = function() {
//    jQueryEngine.navbar_set();
}

$(document).bind("mobileinit", function(){
  $.extend(  $.mobile , {
    ajaxLinksEnabled: false,
    ajaxFormsEnabled: false
  });
});


if(typeof jQueryEngine == 'undefined') {
    jQueryEngine = { };
}

jQueryEngine.navbar_set = function(){
    jQuery("div[data-role='navbar'] a").each( function(index, element){
        jQuery(element).parent().addClass("ui-btn-active")
    })
}

