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
  $.mobile.page.prototype.options.domCache = true;
  console.log('initialize app');
  app.initialize();
  $(document).on('pagebeforecreate','#admin-states', function (event,ui) {
    adminStates.initialize();
  });
  $(document).on('pagebeforecreate','#admin-loksabhaconstituency', function (event,ui) {
    adminLoksabhaConstituencies.initialize();
  });
  $(document).on('pagecreate','#admin-loksabhaconstituency', function (event,ui) {
    adminLoksabhaConstituencies.pagecreate();
  });
  $(document).on('pagebeforecreate','#admin-party', function (event,ui) {
    adminParties.initialize();
  });
  $(document).on('pagecreate','#admin-party', function (event,ui) {
    adminParties.pagecreate();
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

