// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

document.getElementById('my-pledges').style.display = "none";
document.getElementById('my-projects').style.display = "grid";

function toggleState(tab, section) {
  document.getElementById(tab).addEventListener('click', function() {
    console.log('hello');

    document.getElementById('my-pledges').style.display = "none";
    document.getElementById('my-projects').style.display = "none";

    document.getElementById(section).style.display = 'grid';

    // a = document.getElementsByClassName("project-list");
    // for (i=0; i<a.length; i++) {
    //   a[i].classList.toggle('changed');
    // };

  });
};

toggleState('projects', 'my-projects');
toggleState('pledges', 'my-pledges');
