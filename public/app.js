$('#updateForm').hide();

$('#updateBtn').on('click',function(){
    $('#updateForm').toggle();
})

function myFunction() {
    var x = document.getElementById("myLinks");
    if (x.style.display === "block") {
      x.style.display = "none";
    } else {
      x.style.display = "block";
    }
  }