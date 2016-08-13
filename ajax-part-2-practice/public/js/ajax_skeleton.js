
// Only text/html can be sent between controller and page, not numbers!!!

// https://oscarotero.com/jquery/
// don't forget find()!!


// Phase 2 assessment ====================================================

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





// Hacker news =============================================================
$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them
  $(".post-container").on("click", ".vote-button", function(event) {
    event.preventDefault();
    console.log(this);
    var upvotedPost = $(this)
    var url = $(this).parent().attr('action');
    console.log(url)
    $.ajax({
      url: url,
      type: 'POST',
      // data: {button: 'value1'},
    })
    .done(function(response) {
      // non-json solution below -------------------------------------
      // upvoted_post.parent().next().next().children('.points').text(response);
      // upvoted_post.css('color', 'red');
      // end non-json solution---------------------------------------------

      console.log(response.postId);
      // console.log("article #" + response.postId);
        $("#" + response.postId).children().first().next().next().children('.points').text(response.points);
        $("#" + response.postId).children().first().children().css('color', 'red');
    })
    .fail(function() {
      alert("Your vote could not be counted at this time")
      console.log("error");
    });
  });

  $(".post-container").on("click", ".delete", function(event) {
    event.preventDefault();
    // console.log(this);
    var urlDelete = $(this).attr("href")
    console.log(urlDelete)
    $.ajax({
      url: urlDelete,
      type: "delete"
    }).done(function(response) {
      // console.log(response);
      $("#" + response).remove();
    });
  });

  $("#posts").on("submit", function(event) {
    event.preventDefault();
    var postData = $(this).serialize();
    var urlNewPost = $(this).attr("action");
    $.ajax({
      url: urlNewPost,
      type: "post",
      data: postData
    }).done( function(response) {
      console.log(response);
      $(".post-container").append(response);
    }).fail(function() {
      alert("Status 422")
      console.log("error");
  });
  });
});



// Lucky Ajax ====================================================
$(document).ready(function () {

  $('form').on("submit", function(event) {
    event.preventDefault();
    console.log(this);
    console.log($(this).find("input[name=sides]").val());
    var sides = $(this).find("input[name=sides]").val();
    // console.log($(this).find("action"));

    $.ajax({
      url : '/rolls',
      method : "post",
      data : { "sides" : sides }
    }).done(function(response) {
      console.log(response);
      $(".roll").html(response)
    });
  })
});



