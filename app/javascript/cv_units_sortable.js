import Sortable from "sortablejs";

$( document ).ready(function() {

  const sortable = new Sortable(cv_units, {
      handle: '.handle', // handle's class
      animation: 150
  });

});
