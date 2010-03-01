Event.observe(document, 'dom:loaded', function() {
    $$('form a.add_nested_fields').each(function(a){
        a.observe('click', addNestedField);  
    });
});

function addNestedField(ev) {
    var element = ev.element();
    
    // Setup
    var assoc   = element.readAttribute('data-association');
    var content = $(assoc + '_fields_blueprint').innerHTML;
    
    // Make the context correct by replacing new_<parents> with the generated ID
    // of each of the parent objects
    var input = element.previous('.fields').select('input')[0];
    var name = input.readAttribute('name'); // name = kebab[transportations_attributes][0][_destroy]
    var context = name.gsub(new RegExp('[[a-z]+]$'), ''); // context = kebab[transportations_attributes][0][_
    alert(context);
    
    // context will be something like this for a brand new form:
    // project[tasks_attributes][1255929127459][assignments_attributes][1255929128105]
    // or for an edit form:
    // project[tasks_attributes][0][assignments_attributes][1]
    
    if(context) {
      var parent_names = context.match(/[a-z]+_attributes/g) || []
      var parent_ids   = context.match(/[0-9]+/g)
      
      for(i = 0; i < parent_names.length; i++) {
        if(parent_ids[i]) {
          content = content.replace(
            new RegExp('(\[' + parent_names[i] + '\])\[.+?\]', 'g'),
            '$1[' + parent_ids[i] + ']'
          )
        }
      }
    }
    
  
  element.select('input[type=text]').each(function (e){
    if ( e.value == e.getAttribute('title') )
      e.value = '';
  });
}

//$(function() {
//  $('form a.add_nested_fields').live('click', function() {
//    // Setup
//    var assoc   = $(this).attr('data-association');           // Name of child
//    var content = $('#' + assoc + '_fields_blueprint').html(); // Fields template
//    
//    // Make the context correct by replacing new_<parents> with the generated ID
//    // of each of the parent objects
//    var context = ($(this).parents('.fields').children('input:first').attr('name') || '').replace(new RegExp('[[a-z]+]$'), '');
//    
//    // context will be something like this for a brand new form:
//    // project[tasks_attributes][1255929127459][assignments_attributes][1255929128105]
//    // or for an edit form:
//    // project[tasks_attributes][0][assignments_attributes][1]
//    if(context) {
//      var parent_names = context.match(/[a-z]+_attributes/g) || []
//      var parent_ids   = context.match(/[0-9]+/g)
//      
//      for(i = 0; i < parent_names.length; i++) {
//        if(parent_ids[i]) {
//          content = content.replace(
//            new RegExp('(\[' + parent_names[i] + '\])\[.+?\]', 'g'),
//            '$1[' + parent_ids[i] + ']'
//          )
//        }
//      }
//    }
//    
//    // Make a unique ID for the new child
//    var regexp  = new RegExp('new_' + assoc, 'g');
//    var new_id  = new Date().getTime();
//    content     = content.replace(regexp, new_id)
//    
//    $(this).parent().before(content);
//    return false;
//  });
//  
//  $('form a.remove_nested_fields').live('click', function() {
//    var hidden_field = $(this).prev('input[type=hidden]')[0];
//    if(hidden_field) {
//      hidden_field.value = '1';
//    }
//    $(this).closest('.fields').hide();
//    return false;
//  });
//});
