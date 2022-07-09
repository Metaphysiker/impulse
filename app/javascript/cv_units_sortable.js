import Sortable from "sortablejs";

$( document ).ready(function() {

  const sortable = new Sortable(cv_units, {
      handle: '.handle', // handle's class
      animation: 150
  });


  $( "#cv-units-sortable-update-order" ).click(function() {
    $.ajax({
      type: "POST",
      url: "/cv_units/update_order",
      data: {order: sortable.toArray()},
      headers: {
        'X-CSRF-Token': document.querySelector("meta[name=csrf-token]").content
      },
      context: document.body
    }).done(function(response) {
      //location.reload();
    });
  });

});
