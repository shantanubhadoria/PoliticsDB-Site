var adminLoksabhaConstituencies = {
  initialize: function(){
    var HTML = '';
    var loksabhaConstituencyList = app.getLoksabhaConstituencyList();
    $.each(loksabhaConstituencyList,function(key,value){

      HTML += ''
        + '<div data-role="field-contain" class="ui-block-a"><label><input type="text" name="name" value="' + value.name + '" placeholder="loksabha constituency name"></label></div>'
        + '<div data-role="field-contain" class="ui-block-b"><label><input type="text" name="state_code" value="' + value.state_code + '" placeholder="loksabhaconstituency code"></label></div>';

      HTML += ''
        + '<div data-role="field-contain" class="ui-block-a">'
        + '<fieldset data-role="controlgroup" data-type="horizontal">'
        + '<input name="reserved_for" id="reserved_for_none_' + value.id + '" value="None" checked="checked" type="radio">'
        + '<label for="reserved_for_none_' + value.id + '">None</label>'
        + '<input name="reserved_for" id="reserved_for_sc_' + value.id + '" value="SC" checked="checked" type="radio">'
        + '<label for="reserved_for_sc_' + value.id + '">SC</label>'
        + '<input name="reserved_for" id="reserved_for_st_' + value.id + '" value="ST" checked="checked" type="radio">'
        + '<label for="reserved_for_st_' + value.id + '">ST</label>'
        + '</fieldset>'
        + '</div><div data-role="field-contain" class="ui-block-b">';

      HTML += ''
        + '<div data-role="field-contain" class="ui-block-a"><input data-icon="disk" type="submit" value="update"></div>'
        + '<div data-role="field-contain" class="ui-block-b "><input data-icon="delete" type="submit" value="delete"></div>';

    });
    HTML = '<div class="ui-grid-a">'
      + '<div data-role="field-contain" class="ui-block-a"><label><input type="text" name="loksabhaconstituencycode" value="" placeholder="loksabhaconstituency code"></label></div>'
      + '<div data-role="field-contain" class="ui-block-b"><label><input type="text" name="loksabhaconstituencyname" value="" placeholder="loksabhaconstituency name"></label></div>'
      + '<div data-role="field-contain" class="ui-block-a"><input data-icon="plus" type="submit" value="Add"></div>'
      + '<div data-role="field-contain" class="ui-block-b"></div>'
      + HTML
      + '</div>';
    $("#admin-loksabhaconstituency-content").html(HTML).trigger('create');
  },
};
