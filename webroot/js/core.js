var baseURL = "http://localhost:3000/";

var showLoader = function(text) {
  $.mobile.loading( "show", {
    textVisible: false,
    theme: "a",
    textonly: false,
    html: "<span style='margin:0 auto;' ><img src='img/chakragray_animated.gif'><h2>" + text + "</h2></span>"
  });
}

$(document).ready(function(){
  console.log('initialize app');
  app.initialize();
  $(document).on('pagebeforeshow','#admin-states', function (event,ui) {
    adminStates.initialize();
  });
  $(document).on('pagebeforeshow','#admin-loksabhaconstituency', function (event,ui) {
    adminLoksabhaConstituencies.initialize();
  });

  document.addEventListener("backbutton", function(e){
    if($.mobile.activePage.is('#admin-page')){
      e.preventDefault();
      navigator.app.exitApp();
    }
    else {
      navigator.app.backHistory()
    }
  }, false);
});
