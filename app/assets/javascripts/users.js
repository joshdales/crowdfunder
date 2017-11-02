// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

document.getElementById('my-projects').style.display = "grid";
document.getElementById('projects').style.backgroundColor = "white";
document.getElementById('projects').style.color = "black";

document.getElementById('my-pledges').style.display = "none";
document.getElementById('pledges').style.backgroundColor = "cadetblue";

function toggleState(tab, section) {
  document.getElementById(tab).addEventListener('click', function() {

    document.getElementById('my-pledges').style.display = "none";
    document.getElementById('my-projects').style.display = "none";

    document.getElementById('pledges').style.backgroundColor = "cadetblue";
    document.getElementById('projects').style.backgroundColor = "cadetblue";

    document.getElementById('pledges').style.color = "white";
    document.getElementById('projects').style.color = "white";


    document.getElementById(section).style.display = 'grid';
    document.getElementById(tab).style.backgroundColor = "white";
    document.getElementById(tab).style.color = "black";
    // a = document.getElementsByClassName("project-list");
    // for (i=0; i<a.length; i++) {
    //   a[i].classList.toggle('changed');
    // };

  });
};

toggleState('projects', 'my-projects');
toggleState('pledges', 'my-pledges');
