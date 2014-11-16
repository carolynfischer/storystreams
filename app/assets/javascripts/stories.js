function addPicture() {
    console.log("Clicked");
    var fields = $('.addPictureFields').clone();
    fields.removeClass("hidden addPictureFields");
    fields.appendTo($('.picturesFields'));
    fields.find('.is_cover_rb').val($('.story_picture_fields').length-2);
}


$(document).ready(function() {

});
