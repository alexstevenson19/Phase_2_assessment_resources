$(document).ready(function() {
  $("#post_form").on("submit", function(event) {
    event.preventDefault();
    // console.log(this);
    var shareForm = this
    var urlShare = $(shareForm).attr("action");
    var dataShare = $(shareForm).children().serialize();
    console.log(dataShare);
    $.ajax({
      url: urlShare,
      type: "POST",
      data: dataShare
    }).done(function(response) {
      $("#posts").prepend(response);
    })
  })

  $("#posts").on("submit", ".post_like", function(event) {
    event.preventDefault();
    // console.log(this);
    var urlLike = $(this).attr("action");
    // * no data needed in this case, don't forget to first checkout what is in the params, and what is needed by the controller.
    // var dataLike = $(this).children().attr(".post_like_button");
    // console.log(dataLike);
    $.ajax({
      url: urlLike,
      type: "PUT"
    }).done(function(response) {
      // console.log(response);
      $(".post_details").find(".like_count").text(response);
    })
  });
});
