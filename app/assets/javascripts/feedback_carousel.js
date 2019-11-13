$(document).ready(function() {
  $('.customer-review').first().addClass('current-review');
  $('.customer-review:gt(0)').hide();

  var interval = setInterval(slide, 5000);

  function intslide(func) {
  	if (func == 'start') {
   	interval = setInterval(slide, 5000);
  	} else {
  		clearInterval(interval);
	}};

  function slide() {
		autoSlide(1200);
  };




  function autoSlide(time) {
    var currentReview = $('.current-review');
    var nextReview = currentReview.next('.customer-review');
    var prevReview = currentReview.prev('.customer-review');

    if (nextReview.length == 0) {
      nextReview = $('.customer-review').first();
    } else if (prevReview.length == 0) {
      prevReview = $('.customer-review').last();
    };

    currentReview.fadeOut(time).removeClass('current-review');
    nextReview.fadeIn(time).addClass('current-review');
  };




  $('.next-review').on('click', function() {
    intslide('stop');
    var currentReview = $('.current-review');
    var nextReview = currentReview.next('.customer-review');

    if (nextReview.length == 0) {
      nextReview = $('.customer-review').first();
    };

    currentReview.fadeOut(300).removeClass('current-review');
    nextReview.fadeIn(300).addClass('current-review');
  });




  $('.prev-review').on('click', function() {
    intslide('stop');
    var currentReview = $('.current-review');
    var prevReview = currentReview.prev('.customer-review');

    if (prevReview.length == 0) {
      prevReview = $('.customer-review').last();
    };

    currentReview.fadeOut(300).removeClass('current-review');
    prevReview.fadeIn(300).addClass('current-review');
  });

});
