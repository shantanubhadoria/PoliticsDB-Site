adminParties = {
  initialize: function(){
    var HTML = '';
    var partyList = app.getPartyList();
    $.each(partyList, function(key,value){
      HTML += ''
        + '<li>'
        + '<a href="#admin-party-panel" id="party_' + value.id + '" class="party-a"">'
        + '<img src="../img/chakragray_animated.gif">'
        + '<h2 class="ui-li-heading">' + value.name + '</h2>'
        + '<p class="ui-li-aside">' + value.type_of_party + '</p>'
        + '<p class="ui-li-desc">' + value.election_symbol + '</p>'
        + '</a>'
        + '</li>'
        + '';
    });
    var HTML = ''
        + '<div data-role="content">'
        + '<ul data-role="listview">'

        + '<li>'
        + '<a href="#admin-party-panel" id="party" class="party-a-add"">'
        + '<h2 class="ui-li-heading">Add</h2>'
        + '<p class="ui-li-desc">Add New</p>'
        + '<p class="ui-li-aside"></p>'
        + '</a>'
        + '</li>'

        + '<div data-role="content">'
        + '<ul data-role="listview">'
        + HTML
        + '</ul>'
        + '</div>'
        + '';
    $("#admin-party-content").html(HTML).trigger('create');
  },
  pagecreate: function(){
    $(".party-a-add").on("click",function(){
    });
    $(".party-a").on("click",function(){
      var target = $( this ),
        fullid = target.attr( "id" ),
        partyid = fullid.substring(6),
        value = app.partyList[partyid];
      console.log(value);
      var HTML = ''
        + ''
        + '<h2 class="ui-li-heading">' + value.name + '</h2>'
        + '<p class="ui-li-desc">' + value.type_of_party + '</p>'
        + '<p class="ui-li-desc">' + value.election_symbol + '</p>'
        + '<p class="ui-li-desc">' + value.founding_year + '</p>'
        + ''
        + '';
      $("#admin-party-panel").html(HTML).trigger('updatelayout');
    });
  },
};
