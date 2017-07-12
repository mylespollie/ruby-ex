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
WELCOME_CONTENTS
    ]]
  end
  run welcome
end
