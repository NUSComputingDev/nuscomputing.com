$(document).ready(function() {
    $('.ajax-popup').magnificPopup({
        type: 'ajax'
    });

    initialiseMCPhoto();
});

function initialiseMCPhoto() {
    var fadeSpeed = 300;
    var $thumbnail = $(".about-thumbnail");
    var $casualImage = $(".about-thumbnail img:last-child");

    $casualImage.hide();

    $thumbnail.hover(function () {
        $(this).find("img").stop();
        $(this).find("img:first-child").fadeOut(fadeSpeed);
        $(this).find("img:last-child").fadeIn(fadeSpeed);
    }, function() {
        $(this).find("img").stop();
        $(this).find("img:first-child").fadeIn(fadeSpeed);
        $(this).find("img:last-child").fadeOut(fadeSpeed);
    });
}
