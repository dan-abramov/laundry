$( document ).ready(function() {
  $('a.navbar-brand.navigation-link[href$="' + window.location.pathname + '"]').addClass('current-page');

  //----------------------------------------- scripts for modal windows -----------------------------------------

  // enable modal window
  $('.clickable-service').on('click', function() {
    var modalContainerClass = $(this).attr('class').split(' ')[1];
    var modalWindowClass = $('.' + modalContainerClass + '-window');
    modalContainerClass = $('.modal-container.' + modalContainerClass +'');

    if ($(window).height() > $(window).width()) {
      //here we investigated that website opened on mobile
      //so we will do nothing with our modal windows
    } else if ($(window).height() <= modalWindowClass.height()) {
      modalWindowClass.css({height: '90%'});
    };

    modalContainerClass.css('display', 'flex');
  });

  // disable modal window
  $('.close-modal').on('click', function () {
    $('.modal-container').css('display', 'none');
  });
});
