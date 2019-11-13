$(document).ready(function(){
  $(".slide:gt(0)").hide();

  var interval = setInterval(slide, 5000);

  function intslide(func) {
  	if (func == 'start') {
   	interval = setInterval(slide, 5000);
  	} else {
  		clearInterval(interval);
	}};

  function slide() {
		sact('next', 0, 1200);
  };

  function sact(a, ix, it) {
    var currentSlide = $('.current');
    var nextSlide = currentSlide.next('.slide');
    var reqSlide = $('.slide').eq(ix);

    var currentDot = $('.current-dot');
	  var nextDot = currentDot.next();
    var reqDot = $('.dot').eq(ix);

    if (nextSlide.length == 0) {
  		nextDot = $('.dot').first();
      nextSlide = $('.slide').first();
    };

		if (a == 'next') {
			var Slide = nextSlide;
			var Dot = nextDot;
		} else {
			var Slide = reqSlide;
			var Dot = reqDot;
		};

    currentSlide.fadeOut(it).removeClass('current');
    Slide.fadeIn(it).addClass('current');

    currentDot.removeClass('current-dot');
    Dot.addClass('current-dot');
  };

  $('.dot').on('click', function(){
  		intslide('stop');
  		var index  = $(this).index();
  		sact('dot', index, 400);
  		intslide('start');
	});
});
