var adminStates = {
  initialize: function(){
    var HTML = '';
    var stateList = app.getStateList();
    $.each(stateList,function(key,value){
      HTML += ''
        + '<form>'
        + '<div data-role="controlgroup" data-type="horizontal">'
        + '<input type="text" name="statecode" value="' + value.state_code + '" placeholder="state code" data-wrapper-class="controlgroup-textinput ui-btn">'
        + '<input type="text" name="statename" value="' + value.name + '" placeholder="state name" data-wrapper-class="controlgroup-textinput ui-btn">'
        + '</div>'
        + '<div data-role="controlgroup" data-type="horizontal">'
        + '<input data-icon="check" type="submit" value="Update">'
        + '<input data-icon="delete" type="submit" value="Delete">'
        + '</div><hr/>'
        + '</form>'
        ;
    });
    HTML = ''
      + '<form>'
      + '<div data-role="controlgroup" data-type="horizontal">'
      + '<input type="text" name="statecode" value="" placeholder="state code" data-wrapper-class="controlgroup-textinput ui-btn">'
      + '<input type="text" name="statename" value="" placeholder="state name" data-wrapper-class="controlgroup-textinput ui-btn">'
      + '</div>'
      + '<div data-role="controlgroup" data-type="horizontal">'
      + '<input data-icon="plus" type="submit" value="Add">'
      + '</div><hr/>'
      + '</form>'
      + HTML
      + '</div>';
    $("#admin-states-content").html(HTML).trigger('create');
  },
};
