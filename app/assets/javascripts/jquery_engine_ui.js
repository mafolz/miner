/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
jQuery.noConflict();
window.onload = function() {
    //    jQueryEngine.select();
    jQueryEngine.dialog();
    jQueryEngine.tab();
    jQueryEngine.buttons();
    jQueryEngine.accordion();
}


if(typeof jQueryEngine == 'undefined') {
    jQueryEngine = { };
}

jQueryEngine.select = function(){
    var selectTags = jQuery('select');
    jQuery.each(selectTags, function(){
        var selectTag = jQuery(this);
        selectTag.selectmenu({
            style: 'dropdown',
            width: '300px'
        });
    });
};

jQueryEngine.dialog = function(){
    jQuery(".dialog").each(function(index,element){
        jQuery(element).dialog(
            jQuery.parseJSON(jQuery(element).attr("data"))
            );
    });
};

jQueryEngine.tab = function(){
    jQuery(".tabs").each(function(index,element){
        jQuery(element).tabs();
    });
};


jQueryEngine.buttons = function(){
    jQuery("a[data-role='button']").each(function(index,element){
        jQuery(element).button(
            jQuery.parseJSON(jQuery(element).attr("data"))
            );
    });
    jQuery("button[data-role='button']").each(function(index,element){
        jQuery(element).button(
            jQuery.parseJSON(jQuery(element).attr("data"))
            );
    });
    jQuery(".button-set").each(function(index,element){
        jQuery(element).buttonset(
            jQuery.parseJSON(jQuery(element).attr("data"))
            );
    });
    jQuery(".button").each(function(index,element){
        jQuery(element).button(
            jQuery.parseJSON(jQuery(element).attr("data"))
            );
    });


};

jQueryEngine.accordion = function(){
    jQuery(".accordion").each(function(index,element){
        jQuery(element).accordion({
            autoHeight: true,
            navigation: true
        });
    });
};

