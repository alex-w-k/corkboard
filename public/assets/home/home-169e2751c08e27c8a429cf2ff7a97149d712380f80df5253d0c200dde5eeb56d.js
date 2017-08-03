$('.fa').mouseenter(function(e) {
    $(this).first().parent().siblings('span').toggle()
})

$('.fa').mouseleave(function(e) {
    $(this).first().parent().siblings('span').toggle()
})
;
