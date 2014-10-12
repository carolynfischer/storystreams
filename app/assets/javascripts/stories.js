$(function(){
    $('#addPicture').click(function(){
        console.log("Clicked");
        var fields = $('.addPictureFields').clone();
        fields.removeClass("hidden addPictureFields");
        fields.appendTo($('.picturesFields'));
    });
});