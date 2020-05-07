# DOTA 2 Draft Planner

<h3>About</h3>
This is my first project built using Ruby on Rails. The goal of this project was to create a single page where you can get a brief overview of what heroes your upcoming opponents have been playing in their recent games in order to help you prepare some draft ideas.
<br><br>

This project has been deployed through Heroku and is available to view/use <a href = "https://dota-draft-planner.herokuapp.com/" target = "_blank">here</a>. I did not create the templates used for this website. They were found on the internet (creators are credited in comments on respective .erb view files) and edited to satisfy my requirements.
<br><br>

<h3>Usage</h3>
When using this web application, you can input links for up to five player's <a href = "https://www.dotabuff.com/" target = "_blank">dotabuff</a> profiles, as well as a team's eSports dotabuff profile. After providing the proper links, and clicking the "GET STATS" button at the bottom of the homepage, a webscraper is run that finds available data on the respective players most recent 50 games and displays any heroes with more than one game played along with their total winrate in the last 50 games in a table format. If you input a team eSports link, that teams top ten most picked heroes along with winrates will also be displayed.
<br><br>

<h3>Sample Run</h3>
Below is a sample run using the professional team OG's player/team profiles.
<br>
<h4>Home page, filled with dotabuff profiles</h4>
<img src = "https://github.com/FerruccioSisti/DotaDraftPlanner/blob/master/Media/homepage.png">
<br>

<h4>The following images are all displayed in the same window, but I wasn't able to capture them all in a single screenshot</h4>
<img src = "https://github.com/FerruccioSisti/DotaDraftPlanner/blob/master/Media/testrun1.png">
<img src = "https://github.com/FerruccioSisti/DotaDraftPlanner/blob/master/Media/notail.png">
<img src = "https://github.com/FerruccioSisti/DotaDraftPlanner/blob/master/Media/topson.png">
<img src = "https://github.com/FerruccioSisti/DotaDraftPlanner/blob/master/Media/sumail.png">
<img src = "https://github.com/FerruccioSisti/DotaDraftPlanner/blob/master/Media/midone.png">
<img src = "https://github.com/FerruccioSisti/DotaDraftPlanner/blob/master/Media/saksa.png">
