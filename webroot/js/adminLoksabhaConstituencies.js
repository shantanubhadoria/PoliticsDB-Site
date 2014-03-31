var adminLoksabhaConstituencies = {
  initialize: function(){
    var HTML = '';
    var loksabhaConstituencyList = app.getLoksabhaConstituencyList();
    $.each(loksabhaConstituencyList,function(key,value){
      HTML += ''
        + '<li>'
        + '<a href="#" id="loksabha_constituency_' + value.id + '" class="loksabha-a"">'
        + '<img src="../img/chakragray_animated.gif">'
        + '<h2 class="ui-li-heading">' + value.name + '</h2>'
        + '<p class="ui-li-desc">' + ((value.is_union_territory == 1)?'Union Territory':app.stateList[value.state_code].name) + '</p>'
        + '<p class="ui-li-aside">' + value.constituency_number + (value.reserved_for != 'None'?('(' + value.reserved_for + ')'):'') + '</p>'
        + '</a>'
        + '</li>'
        + '';
    });
    var HTML = ''
        + '<div data-role="content">'
        + '<ul data-role="listview">'

        + '<li>'
        + '<a href="#" id="loksabha_constituency" class="loksabha-a-add"">'
        + '<h2 class="ui-li-heading">Add</h2>'
        + '<p class="ui-li-desc">Add New</p>'
        + '<p class="ui-li-aside"></p>'
        + '</a>'
        + '</li>'

        + HTML
        + '</ul>'
        + '</div>'
        + '';
    $("#admin-loksabhaconstituency-content").html(HTML).trigger('create');

  },
  pagecreate: function(){
    $(".loksabha-a-add").on("click",function(){
      var form = ''
        + '<form action ="' + baseURL + 'loksabhaconstituency/add" class="popup-form">'
        + '<div data-role="controlgroup" data-type="horizontal">'
        + '<input type="text" name="state_code" value="" placeholder="state code" data-wrapper-class="controlgroup-textinput ui-btn" size="2">'
        + '<input type="number" name="constituency_number" value="" data-clear-btn="false" placeholder="num" data-wrapper-class="controlgroup-textinput ui-btn" size="2">'
        + '<input type="text" name="name" value="" placeholder="loksabha constituency name" data-wrapper-class="controlgroup-textinput ui-btn">'
        + '</div>'

        + '<div data-role="field-contain">'
        + '<fieldset data-role="controlgroup" data-type="horizontal">'
        + '<input name="reserved_for" id="reserved_for_none" value="None" type="radio">'
        + '<label for="reserved_for_none">None</label>'
        + '<input name="reserved_for" id="reserved_for_sc" value="SC" type="radio">'
        + '<label for="reserved_for_sc">SC</label>'
        + '<input name="reserved_for" id="reserved_for_st" value="ST" type="radio">'
        + '<label for="reserved_for_st">ST</label>'
        + '</fieldset>'
        + '</div>'

        + '<div data-role="field-contain">'
        + '<fieldset data-role="controlgroup" data-type="horizontal">'
        + '<label for="radio-union-territory">Union Territory</label>'
        + '<input name="is_union_territory" id="radio-union-territory" value="1" type="radio">'
        + '<label for="radio-state-city">Not a Union Territory</label>'
        + '<input name="is_union_territory" id="radio-state-city" value="0" type="radio">'
        + '</fieldset>'
        + '</div>'

        + '<div data-role="controlgroup" data-type="horizontal">'
        + '<input data-icon="plus" type="submit" value="Add">'
        + '</div><hr/>'

        + '</form>',
        closebtn = '<a href="#" data-rel="back" class="ui-btn ui-corner-all ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>',
        header = '<div data-role="header"><h2>Add</h2></div>';
      var popup = '<div data-role="popup" id="popup-add" data-short="add" data-theme="b" data-overlay-theme="a" data-corners="false" data-tolerance="15">' + closebtn + header + form + '</div>';
      $.mobile.activePage.append( popup ).trigger( "create" );
      $( ".photo", "#popup-add" ).load(function() {
        var height = $( this ).height(),
        width = $( this ).width();
      // Set height and width attribute of the image
      $( this ).attr({ "height": height, "width": width });
      // Open the popup
      $( "#popup-add" ).popup( "open" );
      // Clear the fallback
      clearTimeout( fallback );
      });
      // Fallback in case the browser doesn't fire a load event
      var fallback = setTimeout(function() {
        $( "#popup-add" ).popup( "open" );
      }, 2000);
      $("form").on("submit",function(event){
        event.preventDefault();
        $.ajax({
          type: 'POST',
          url: $( this ).attr("action"),
          data: $( this ).serialize(),
          async: false,
          success: function(json){
            console.log(json);
          }
        });
        return false;
      });
    });

    $(".loksabha-a").on("click",function(){
      var target = $( this ),
        brand = target.find( "h2" ).html(),
        model = target.find( "p" ).html(),
        fullid = target.attr( "id" ),
        constituencyid = fullid.substring(22),
        closebtn = '<a href="#" data-rel="back" class="ui-btn ui-corner-all ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>',
        header = '<div data-role="header"><h2>' + brand + ' ' + model + '</h2></div>',
        value = app.loksabhaConstituencyList[constituencyid];
      
      var form = ''
        + '<form action ="' + baseURL + 'loksabhaconstituency/update" class="popup-form">'
        + '<input type="hidden" name="id" value="' + value.id + '">'
        + '<div data-role="controlgroup" data-type="horizontal">'
        + '<input type="text" name="state_code" value="' + ((value.is_union_territory == 1)?'':value.state_code) + '" placeholder="state code" data-wrapper-class="controlgroup-textinput ui-btn" size="2">'
        + '<input type="constituency_number" name="number" value="' + value.constituency_number + '" data-clear-btn="false" placeholder="num" data-wrapper-class="controlgroup-textinput ui-btn" size="2">'
        + '<input type="text" name="name" value="' + value.name + '" placeholder="loksabha constituency name" data-wrapper-class="controlgroup-textinput ui-btn">'
        + '</div>'

        + '<div data-role="field-contain">'
        + '<fieldset data-role="controlgroup" data-type="horizontal">'
        + '<input name="reserved_for_' + value.id + '" id="reserved_for_none_' + value.id + '" value="None" checked="checked" type="radio"' + ((value.reserved_for == 'None')?'checked="checked"':'') + '>'
        + '<label for="reserved_for_none_' + value.id + '">None</label>'
        + '<input name="reserved_for_' + value.id + '" id="reserved_for_sc_' + value.id + '" value="SC" type="radio"' + ((value.reserved_for == 'SC')?'checked="checked"':'') + '>'
        + '<label for="reserved_for_sc_' + value.id + '">SC</label>'
        + '<input name="reserved_for_' + value.id + '" id="reserved_for_st_' + value.id + '" value="ST" type="radio"' + ((value.reserved_for == 'ST')?'checked="checked"':'') + '>'
        + '<label for="reserved_for_st_' + value.id + '">ST</label>'
        + '</fieldset>'
        + '</div>'

        + '<div data-role="field-contain">'
        + '<fieldset data-role="controlgroup" data-type="horizontal">'
        + '<label for="radio-union-territory-' + value.id + '">Union Territory</label>'
        + '<input name="is_union_territory" id="radio-union-territory-' + value.id + '" value="1" type="radio"' + ((value.union_territory == '1')?'checked="checked"':'') + '>'
        + '<label for="radio-state-city-' + value.id + '">Not a Union Territory</label>'
        + '<input name="is_union_territory" id="radio-state-city-' + value.id + '" value="0" type="radio"' + ((value.union_territory == '0')?'checked="checked"':'') + '>'
        + '</fieldset>'
        + '</div>'

        + '<div data-role="controlgroup" data-type="horizontal">'
        + '<input data-icon="check" type="submit" value="Update">'
        + '<input data-icon="delete" type="submit" value="Delete">'
        + '</div><hr/>'

        + '</form>';
      var popup = '<div data-role="popup" id="popup-' + fullid+ '" data-short="' + fullid+'" data-theme="b" data-overlay-theme="a" data-corners="false" data-tolerance="15">' + closebtn + header + form + '</div>';
      $.mobile.activePage.append( popup ).trigger( "create" );
      $( ".photo", "#popup-" + fullid ).load(function() {
        var height = $( this ).height(),
        width = $( this ).width();
      // Set height and width attribute of the image
      $( this ).attr({ "height": height, "width": width });
      // Open the popup
      $( "#popup-" + fullid ).popup( "open" );
      // Clear the fallback
      clearTimeout( fallback );
      });
      // Fallback in case the browser doesn't fire a load event
      var fallback = setTimeout(function() {
        $( "#popup-" + fullid ).popup( "open" );
      }, 2000);
      $("form").on("submit",function(event){
        event.preventDefault();
        $.ajax({
          type: 'POST',
          url: $( this ).attr("action"),
          data: $( this ).serialize(),
          async: false,
          success: function(json){
            console.log(json);
          }
        });
        return false;
      });
    });

    // Set a max-height to make large images shrink to fit the screen.
    $( document ).on( "popupbeforeposition", ".ui-popup", function() {
        // 68px: 2 * 15px for top/bottom tolerance, 38px for the header.
        var maxHeight = $( window ).height() - 68 + "px";
        $( "img.photo", this ).css( "max-height", maxHeight );
    });
    // Remove the popup after it has been closed to manage DOM size
    $( document ).on( "popupafterclose", ".ui-popup", function() {
        $( this ).remove();
    });
  },
};
