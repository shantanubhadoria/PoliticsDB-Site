var adminStates = {
  initialize: function(){
    var HTML = '';
    var stateList = app.getStateList();
    $.each(stateList,function(key,value){
      HTML += '<div data-role="field-contain" class="ui-block-a"><label><input type="text" name="statecode" value="' + value.state_code + '" placeholder="state code"></label></div>'
        + '<div data-role="field-contain" class="ui-block-b"><label><input type="text" name="statename" value="' + value.name + '" placeholder="state name"></label></div>'
        + '<div data-role="field-contain" class="ui-block-c"><input data-icon="disk" type="submit" value="update"></div>'
        + '<div data-role="field-contain" class="ui-block-d "><input data-icon="delete" type="submit" value="delete"></div>';
    });
    HTML = '<div class="ui-grid-c">'
      + '<div data-role="field-contain" class="ui-block-a"><label><input type="text" name="statecode" value="" placeholder="state code"></label></div>'
      + '<div data-role="field-contain" class="ui-block-b"><label><input type="text" name="statename" value="" placeholder="state name"></label></div>'
      + '<div data-role="field-contain" class="ui-block-c"><input data-icon="plus" type="submit" value="Add"></div>'
      + '<div data-role="field-contain" class="ui-block-d"></div>'
      + HTML
      + '</div>';
    $("#admin-states-content").html(HTML).trigger('create');
    //$("#admin-main").html(content).trigger('create');
   //$("#admin-page").trigger('create');
    //$("#admin-states").html(HTML);
  },
};
