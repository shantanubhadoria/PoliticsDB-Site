var adminLoksabhaConstituencies = {
  initialize: function(){
    var HTML = '';
    var loksabhaConstituencyList = app.getLoksabhaConstituencyList();
    $.each(loksabhaConstituencyList,function(key,value){
      HTML += '<div data-role="field-contain" class="ui-block-a"><label><input type="text" name="loksabhaconstituencycode" value="' + value.loksabhaconstituency_code + '" placeholder="loksabhaconstituency code"></label></div>'
        + '<div data-role="field-contain" class="ui-block-b"><label><input type="text" name="loksabhaconstituencyname" value="' + value.name + '" placeholder="loksabhaconstituency name"></label></div>'
        + '<div data-role="field-contain" class="ui-block-c"><input data-icon="disk" type="submit" value="update"></div>'
        + '<div data-role="field-contain" class="ui-block-d "><input data-icon="delete" type="submit" value="delete"></div>';
    });
    HTML = '<div class="ui-grid-c">'
      + '<div data-role="field-contain" class="ui-block-a"><label><input type="text" name="loksabhaconstituencycode" value="" placeholder="loksabhaconstituency code"></label></div>'
      + '<div data-role="field-contain" class="ui-block-b"><label><input type="text" name="loksabhaconstituencyname" value="" placeholder="loksabhaconstituency name"></label></div>'
      + '<div data-role="field-contain" class="ui-block-c"><input data-icon="plus" type="submit" value="Add"></div>'
      + '<div data-role="field-contain" class="ui-block-d"></div>'
      + HTML
      + '</div>';
    $("#admin-loksabhaconstituency-content").html(HTML);
    $("#admin-loksabhaconstituency").trigger('create');
  },
};
