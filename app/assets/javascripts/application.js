// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require_tree .

function PrecisionInputCorrect(sent_id)
{
    boxName = "#PrecInContainer"+sent_id;
    inputterName = "#UserInputter"+sent_id;
    $(inputterName).addClass("hideUserInputter");

    $.ajax({
    type: "POST",
    contentType: "application/json; charset=utf-8",
    url: "saveCorrect",
    data: JSON.stringify({id:sent_id}),
    dataType:"json",
    success: function(result){
      $(boxName).addClass("InputComplete");
    },
    error: function(){
      $(boxName).addClass("InputError");
    }
  });
}

function PrecisionError(sent_id)
{
  queryString = "#PrecInError" + sent_id;
  responseText = $(queryString).val();

  boxName = "#PrecInContainer"+sent_id;
  inputterName = "#UserInputter"+sent_id;
  $(inputterName).addClass("hideUserInputter");

  $.ajax({
    type: "POST",
    contentType: "application/json; charset=utf-8",
    url: "saveWrong",
    data: JSON.stringify({id:sent_id, precError:responseText}),
    dataType:"json",
    success: function(result){
      $(boxName).addClass("InputWrong");
    },
    error: function(){
      $(boxName).addClass("InputError");
    }
  });
}

function CleanPrecisionInput()
{
  $.ajax({
    type: "POST",
    contentType: "application/json; charset=utf-8",
    url: "cleanOut",
    dataType:"json",
    success: function(result){
      alert("Cleaned Out!!");
    },
    error: function(){
      
    }
  }); 
}