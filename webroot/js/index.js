/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

var app = {
  // Application Constructor
  initialize: function() {
    this.bindEvents();

    // Initialize Storage
    this.getStateList();
    this.getLoksabhaConstituencyList();
    this.getPartyList();
  },
  // Bind Event Listeners
  //
  // Bind any events that are required on startup. Common events are:
  // 'load', 'deviceready', 'offline', and 'online'.
  bindEvents: function() {
    document.addEventListener('deviceready', this.onDeviceReady, false);
  },
  // deviceready Event Handler
  //
  // The scope of 'this' is the event. In order to call the 'receivedEvent'
  // function, we must explicity call 'app.receivedEvent(...);'
  onDeviceReady: function() {
    app.receivedEvent('deviceready');
  },
  // Update DOM on a Received Event
  receivedEvent: function(id) {
    parentElement = document.getElementById(id);
    var listeningElement = parentElement.querySelector('.listening');
    var receivedElement = parentElement.querySelector('.received');

    listeningElement.setAttribute('style', 'display:none;');
    receivedElement.setAttribute('style', 'display:block;');

    // Activate the Login Form
    $("#login-form").css('display', 'block');
    app.checkPreAuth();
    $("#loginForm").on("submit",function(e) {
      return app.handleLogin();
    });
  },
  checkPreAuth: function() {
    var form = $("#loginForm");
    if(window.localStorage["username"] != undefined && window.localStorage["password"] != undefined) {
      $("#username", form).val(window.localStorage["username"]);
      $("#password", form).val(window.localStorage["password"]);
      return app.handleLogin();
    }
  },
  handleLogin: function() {
      // disable the button so we can't resubmit while we wait
      $("#submitButton",this).attr("disabled","disabled");
      $('#deviceready').hide();
      var u = $("#username").val();
      var p = $("#password").val();
      if(u != '' && p!= '') {
        showLoader('Authenticating');
        $.post(baseURL + 'user/login/', {username:u,password:p}, function(res) {
          if(res.success == true){
            window.localStorage["username"] = u;
            window.localStorage["password"] = p;
            if(res.admin == 1){
              console.log('redirect to admin');
              //$.mobile.navigate("admin/admin-aggregated.html");
              window.location = "admin/admin-states.html";
            }else{
              $.mobile.changePage("main.html");
            }
          } else {
            $('#deviceready').show();
            $.mobile.loading( "hide" );
            $("#ready-status").html("Invalid Login");
            $("#ready-status").css("background-color", "red");
            $("#submitButton").removeAttr("disabled");
          }
        },"json");
      } else {
        $('#deviceready').show();
        $("#ready-status").html("Username/Password Required");
        $("#ready-status").css("background-color", "red");
        $("#submitButton").removeAttr("disabled");
      }
      return false;
  },
  stateList: null,
  getStateList: function(){
   // Function caches results of PLUs list once retrieved
    if(this.stateList == null){
      $.ajax({
        url: baseURL + 'state/list/',
        crossDomain: true,
        data: {
        },
        async: false,
        success: function(json){
          var states = Object();
          $.each(json.states,function(key,value){
            states[value.state_code] = value;
          });
          app.stateList = states;
        }
      });
    }
    return this.stateList;
  },
  loksabhaConstituencyList: null,
  getLoksabhaConstituencyList: function(){
    if(this.loksabhaConstituencyList == null){
      $.ajax({
        url: baseURL + 'loksabhaconstituency/list/',
        crossDomain: true,
        data: {
        },
        async: false,
        success: function(json){
          var loksabhaConstituencyList = Object(); 
          $.each(json.loksabhaconstituencies,function(key,value){
            loksabhaConstituencyList[value.id] = value;
          });
          app.loksabhaConstituencyList = loksabhaConstituencyList;
        }
      });
    }
    return this.loksabhaConstituencyList;
  },
  partyList: null,
  getPartyList: function(){
    if(this.partyList == null){
      $.ajax({
        url: baseURL + 'party/list/',
        crossDomain: true,
        data: {
        },
        async: false,
        success: function(json){
          var partyList = Object(); 
          $.each(json.parties,function(key,value){
            partyList[value.id] = value;
          });
          app.partyList = partyList;
        }
      });
    }
    return this.partyList;
  },
};
