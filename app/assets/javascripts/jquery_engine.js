/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */




if(typeof jQueryEngine == 'undefined') {
    jQueryEngine = { };
}

/**
 * Removes from each Activated Entry-Classes the active-class
 * and activate the given Element with a class-attribute
 */
jQueryEngine.activate_entry = function(selector){
    jQuery('.entry').each(function(index, element){
        jQuery(element).removeClass('active');
    })
    jQuery(selector).addClass('active');
}

jQueryEngine.remove_entry = function(selector){
    var element =  jQuery(selector);
    element.nextAll().each(function(index, sibling_selector){
        var sibling = jQuery(sibling_selector)
        if(sibling.hasClass('odd')){
            sibling.removeClass('odd');
            sibling.addClass('even');
        }else{
            sibling.removeClass('even');
            sibling.addClass('odd');
        }
    });

    element.slideUp();
}

