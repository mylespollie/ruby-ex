require 'rack/lobster'

map '/health' do
  health = proc do |env|
    [200, { "Content-Type" => "text/html" }, ["1"]]
  end
  run health
end

map '/lobster' do
  run Rack::Lobster.new
end

map '/' do
  welcome = proc do |env|
    [200, { "Content-Type" => "text/html" }, [<<WELCOME_CONTENTS

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Who Does What</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

  <script src="test.js"></script>

<link rel="stylesheet" type="text/css" href="style.css">


<div class="featurette">
   <div class="featurette-inner text-center">
      <form role="form" class="search">
         <h3 class="no-margin-top h3">
           <div class="tab">
            <button class="tablinks in active" id = "PeopleTab">People</button>
            <button class="tablinks" id = "ServicesTab">Services</button>
          </div>
         </h3>
         <div class="input-group input-group-lg">
            <input type="search" id="mySearch" placeholder="Search People..." class="form-control">
            <span class="input-group-btn">
            <button class="btn btn-danger" type="button" id="searchButton">Search</button>
            </span>
         </div>
         <!-- /input-group -->
      </form>
      <!-- /.max-width on this form -->

   </div>
   <!-- /.featurette-inner (display:table-cell) -->

</div>
<!-- /.featurette (display:table) -->

<style>
html {
    font-family: Lato, 'Helvetica Neue', Arial, Helvetica, sans-serif;
    font-size: 14px;
}

h5 {
    font-size: 1.28571429em;
    font-weight: 700;
    line-height: 1.2857em;
    margin: 0;
}

.card {
    font-size: 1em;
    overflow: hidden;
    padding: 0;
    border: none;
    border-radius: .28571429rem;
    box-shadow: 0 1px 3px 0 #d4d4d5, 0 0 0 1px #d4d4d5;
}

.col-sm-6
{
    width: 100% !important;
}

.card-block {
    font-size: 1em;
    position: relative;
    margin: 0;
    padding: 1em;
    border: none;
    border-top: 1px solid rgba(34, 36, 38, .1);
    box-shadow: none;
}

.card-img-top {
    display: block;
    width: 100%;
    height: auto;
}

.card-title {
    font-size: 1.28571429em;
    font-weight: 700;
    line-height: 1.2857em;
}

.card-text {
    clear: both;
    margin-top: .5em;
    color: rgba(0, 0, 0, .68);
}

.card-footer {
    font-size: 1em;
    position: static;
    top: 0;
    left: 0;
    max-width: 100%;
    padding: .75em 1em;
    color: rgba(0, 0, 0, .4);
    border-top: 1px solid rgba(0, 0, 0, .05) !important;
    background: #fff;
}

.card-inverse .btn {
    border: 1px solid rgba(0, 0, 0, .05);
}

.profile {
    position: absolute;
    top: -12px;
    display: inline-block;
    overflow: hidden;
    box-sizing: border-box;
    width: 25px;
    height: 25px;
    margin: 0;
    border: 1px solid #fff;
    border-radius: 50%;
}

.profile-avatar {
    display: block;
    width: 100%;
    height: auto;
    border-radius: 50%;
}

.profile-inline {
    position: relative;
    top: 0;
    display: inline-block;
}

.profile-inline ~ .card-title {
    display: inline-block;
    margin-left: 4px;
    vertical-align: top;
}

.text-bold {
    font-weight: 700;
}

.meta {
    font-size: 1em;
    color: rgba(0, 0, 0, .4);
}

.meta a {
    text-decoration: none;
    color: rgba(0, 0, 0, .4);
}

.meta a:hover {
    color: rgba(0, 0, 0, .87);
}
/* Style the tab */
div.tab {
    overflow: hidden;
    border: none;
    background-color: inherit;
}

/* Style the buttons inside the tab */
div.tab button {
    background-color: #484D51;
    float: left;
    border: none;
    outline: none;
    cursor: pointer;
    padding: 14px 16px;
    transition: 0.3s;
}

/* Change background color of buttons on hover */
div.tab button:hover {
    background-color: #484D51;
}

/* Create an active/current tablink class */
div.tab button.active {
    background-color: #ffcb05;
}

/* Style the tab content */
.tabcontent {
    display: none;
    padding: 6px 12px;
    border: 1px solid #555;
    border-top: none;
}

html,
body {
    height: 100% /* not necessary if you have a fixed height on the feature area */
}
/* ------ featurette */
.featurette {
    display: table;
    width: 100%;
    height: 30%; /* set a pixel height and then remove the body,html height */
    vertical-align: middle;
    background: white;
    color: #fff;
}
.featurette-inner {
    display: table-cell;
    vertical-align: middle;
}
.featurette .search {
    padding: 3%;
    max-width: 980px; /*max width of search*/
    margin: 0 auto;
}
.no-margin-top {
    margin-top: 0
}


/* ------ form-control-lg */
.form-control-lg {
    min-height: 46px;
    border-radius: 6px;
    font-size: 18px;
    line-height: normal;
}

.btn-danger {
    color: #fff;
    background-color: #484D51;
    border-color: #484D51;
}

/* ------ disjointed form group custom */
.featurette .search.has-button .btn {
    margin-top: 5px;
    width: 100%;
}

@media (min-width:480px) {
    .featurette .search.has-button .form-group {
        position: relative;
        padding-right: 99px; /*space for button*/
    }
    .featurette .search.has-button .btn {
        position: absolute;
        top: 0;
        right: 0;
        width: auto;
        margin: 0;
    }
}

.noresults {
    height: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
}

.row + .row {
    margin-top: 15px;
}

.td {
    overflow: hidden;
    white-space: nowrap;
}

.list-group-item{
    display: inline-block;
}
.list-group-item:hover{
    background-color: #ffcb05;
    cursor: pointer;
}

.button{
    background:none!important;
    color:inherit;
    border:none;
    padding:0!important;
    font: inherit;
}

#modalCard{
    background-color: white!important;
}
</style>

</head>
<body>
  <div class="container">
  </div>
  <div class="modal fade bs-example-modal-lg" id="modalClick" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-lg" role="document">
      <div class="modal-content">
      </div>
    </div>
  </div>
</body>
</html>

<script>

/*Will need to adjust these URLs later*/
var searchAll = "http://localhost:9200/whodoeswhat/_search?q=";
var searchPeople = "http://localhost:9200/whodoeswhat/person/_search?q=";
var searchService = "http://localhost:9200/whodoeswhat/service/_search?q=";
var searchOffering = "http://localhost:9200/whodoeswhat/serviceoffering/_search?q=";

$(document).ready(function(){
  $(".tablinks").click(function(event) {
    event.preventDefault();             //prevent reloading the page
    $(".tablinks").removeClass('active');
    $(this).addClass('active');
    var domElement = $ ( this ).get( 0 );
    var searchType = domElement.textContent;       //Get the text content of whichever tab was clicked
    var placeholder = "Search ";
    placeholder = placeholder.concat(searchType).concat("...");
    document.getElementById("mySearch").placeholder = placeholder;
  });

  /*Click event for clicking Service Offerings*/
  $(document).on('click', 'li.list-group-item', function (){
    $("#modalClick").modal("show");

    var domElement = $(this).get(0);
    var url = (searchOffering + (domElement.textContent));
    $(".modal-content").empty();

    /*Grab JSON and create card with service offering information*/
    $.getJSON(url, function(result){
      var typeName = result.hits.hits[0]._source["type name"];
      var engEmail = result.hits.hits[0]._source["engineering email"];
      var engContacts = result.hits.hits[0]._source["engineering contacts"];
      var opEmail = result.hits.hits[0]._source["operations email"]
      var opContacts = result.hits.hits[0]._source["operations contacts"];
      var tags = result.hits.hits[0]._source.tags;
      console.log(result);
      htmlText = '<div class="col-sm-6 col-md-4 col-lg-3 mt-4>';
      htmlText += '<div class="card id="modalCard">';
      htmlText += '<div class="card-block">';
      htmlText += '<h4 class="card-title">' + domElement.textContent + '</h4>';
      htmlText += '<div class="meta">';
      htmlText += '<a>' + result.hits.hits[0]._source["type name"] + '</a>';
      htmlText += '</div>';
      htmlText += '<div class="card-text">';
      htmlText += '<table class="table table-user-information">';
      htmlText += '<tbody>';
      htmlText += '<tr>';
      htmlText += '<td>Engineering Email</td>';
      htmlText += '<td><a href="mailto:' + engEmail +'">' + engEmail + '</a></td>';
      htmlText += '</tr>';
      htmlText += '<tr>';
      htmlText += '<td>Engineering Contacts</td>';
      htmlText += '<td>';
      for(var i = 0; i < engContacts.length; i++){
        htmlText += '<ul class="list-inline">';
        htmlText += '<li class="list-inline-item"><a href="mailto:' + engContacts[i] +'@umich.edu">' + engContacts[i] + '@umich.edu</a></li>';
        htmlText += '</ul>';
      }
      htmlText += '</td>';
      htmlText += '</tr>';

      htmlText += '<tr>';
      htmlText += '<td>Operations Email</td>';
      htmlText += '<td><a href="mailto:' + opEmail +'">' + opEmail + '</a></td>';
      htmlText += '</tr>';
      htmlText += '<tr>';
      htmlText += '<td>Operations Contacts</td>';
      htmlText += '<td>';
      for(var i = 0; i < opContacts.length; i++){
        htmlText += '<ul class="list-inline">';
        htmlText += '<li class="list-inline-item"><a href="mailto:' + opContacts[i] +'@umich.edu">' + opContacts[i] + '@umich.edu</a></li>';
        htmlText += '</ul>';
      }
      htmlText += '</td>';
      htmlText += '</tr>';

      htmlText += '<tr>';
      htmlText += '<td>Tags</td>';
      htmlText += '<td>';
      htmlText += '<ul class="list-inline">';
      for(var i = 0; i < tags.length; i++){
        htmlText += '<li class="list-inline-item">' + tags[i] + '</li>';
      }
      htmlText += '</ul>';
      htmlText += '</td>';
      htmlText += '</tr>';

      htmlText += '</tbody>';
      htmlText += '</table>';
      htmlText += '</div>' + '</div>' + '</div>' + '</div>' + '</div>';
      $(".modal-content").append(htmlText);
    });
  });

  /*Make pressing enter trigger search button*/
  $('.featurette').keypress(function (e) {
    var key = e.which;
    if(key == 13)
    {
      $('#searchButton').click();
      return false;
    }
  });

  /*Perform search for people or services depending on which tab is active*/
  $('#searchButton').click(function (){
    var url;
    if($('#PeopleTab').hasClass('active')){
      url = searchPeople;
      searchType = 'person';
    }
    else if($('#ServicesTab').hasClass('active')){
      url = searchService;
      searchType = 'service';
    }
    var searchTerm = document.getElementById("mySearch").value;
    url = url.concat(searchTerm);
    var result;

    $.getJSON(url, function(result){
      $('.container').empty();

      console.log(result);      //FOR DEBUGGING
      if(!result.hits.hits.length){
        $(".container").append("<div class = noresults>No results</div>");
      }
      if(searchType == "person"){
        for(var i = 0; i < result.hits.hits.length; i++){
          var first;
          var last = result.hits.hits[i]._source.last;
          var uniqname = result.hits.hits[i]._source.uniqname;
          var email = result.hits.hits[i]._source.email;
          var number = result.hits.hits[i]._source.phone;

          /* If first name field contains multiple names only use the first*/
          if(Array.isArray(result.hits.hits[i]._source.first)){
            first = result.hits.hits[i]._source.first["0"];
          }
          else{
            first = result.hits.hits[i]._source.first;
          }

          var htmlText = '<div class="row">';
          htmlText += '<div class="col-sm-6 col-md-4 col-lg-3 mt-4">';
          htmlText += '<div class="card">';
          htmlText += '<div class="card-block">';
          htmlText += '<h4 class="card-title">' + first + " " + last + '</h4>';
          htmlText += '<div class="meta">';
          htmlText += '<a>' + uniqname + '</a>';
          htmlText += '</div>';
          htmlText += '<div class="card-text">';
          htmlText += '<table class="table table-user-information">';
          htmlText += '<tbody>';
          htmlText += '<tr>';
          htmlText += '<td>Email:</td>';
          htmlText += '<td><a href="mailto:' + uniqname +'@umich.edu">' + email + '</a></td>';
          htmlText += '</tr>';
          htmlText += '<tr>';
          htmlText += '<td>Phone No.</td>';
          htmlText += '<td>' + number + '</td>';
          htmlText += '</tr>';
          htmlText += '</tbody>';
          htmlText += '</table>';
          htmlText += '</div>' + '</div>' + '</div>' + '</div>' + '</div>' + '</div>';
          $(".container").append(htmlText);
        }
      }
      else if(searchType == "service"){
        for(var i = 0; i < result.hits.hits.length; i++){
          var name = result.hits.hits[i]._source.name;
          var svcOwner = result.hits.hits[i]._source["Service Owner"];
          var ieIndicator = result.hits.hits[i]._source["I/E Indicator"];
          var htmlText = '<div class="row">';
          htmlText += '<div class="col-sm-6 col-md-4 col-lg-3 mt-4">';
          htmlText += '<div class="card">';
          htmlText += '<div class="card-block">';
          htmlText += '<h4 class="card-title">' + name + '</h4>';
          htmlText += '<div class="meta">';
          htmlText += '<a>' + "Service Owner: " + svcOwner + '</a>';
          htmlText += '</div>';
          htmlText += '<div class="card-text">';
          htmlText += '<table class="table table-user-information">';
          htmlText += '<tbody>';
          htmlText += '<tr>';
          htmlText += '<td>Service Offerings: </td>';
          htmlText += '<td>';
          htmlText += '<div id="svcOfferings">';
          for(var j = 0; j < result.hits.hits[i]._source.Offerings.length; j++){
            htmlText += '<li class="list-group-item" data-toggle="modal" data-target="#myModal">' + result.hits.hits[i]._source.Offerings[j] + '</li>';
          }
          htmlText += '</div>';
          htmlText += '</td>';
          htmlText += '</tr>';
          htmlText += '</tbody>';
          htmlText += '</table>';
          htmlText += '</div>' + '</div>' + '</div>' + '</div>' + '</div>' + '</div>';
          $(".container").append(htmlText);
        }
      }
    });
  });
});
</script>
