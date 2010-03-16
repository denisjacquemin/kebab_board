document.observe('click', function(e,el) {
  if (el = e.findElement('form a.add_nested_fields')) {
    el.observe('click', addNestedField);
  }
  if (el = e.findElement('form a.remove_nested_fields')) {
    el.observe('click', removeField);
  } 
});

function addNestedField(ev) {
    var element = ev.element();

    // Setup
    var assoc   = element.readAttribute('data-association');
    var content = $(assoc + '_fields_blueprint').innerHTML;

    // Make the context correct by replacing new_<parents> with the generated ID
    // of each of the parent objects
    var input = element.up('.fields').next('input');
    var name = '';
    if (input != undefined) name = input.readAttribute('name');
    var context = name.gsub(new RegExp('[[a-z]+]$'), ''); 

    // context will be something like this for a brand new form:
    // project[tasks_attributes][1255929127459][assignments_attributes][1255929128105]
    // or for an edit form:
    // project[tasks_attributes][0][assignments_attributes][1]

    if(context) {
      var parent_names = context.match(/[a-z]+_attributes/g) || [];
      var parent_ids   = context.match(/[0-9]+/g);

      for(i = 0; i < parent_names.length; i++) {
        if(parent_ids[i]) {
          content = content.replace(
            new RegExp('(\[' + parent_names[i] + '\])\[.+?\]', 'g'),
            '$1[' + parent_ids[i] + ']'
          );
        }
      }
    }

   // Make a unique ID for the new child          
   var regexp  = new RegExp('new_' + assoc, 'g');
   var new_id  = new Date().getTime();
   content     = content.replace(regexp, new_id);

   element.up('.fields').select('*').last().insert({before:content});
   return false;
}


function removeField(ev) {
    var element = ev.element();
    var hidden_field = element.next('input[type=hidden]'); // TODO trouver le closest
    if(hidden_field) {
        hidden_field.value = '1';
    }
    element.up('.fields').hide();
    return false;
}