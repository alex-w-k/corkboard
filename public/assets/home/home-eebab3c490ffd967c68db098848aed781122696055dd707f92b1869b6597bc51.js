$('.fa').mouseenter(function(e) {
    $(this).first().parent().siblings('span').toggle()
})

$('.fa').mouseleave(function(e) {
    $(this).first().parent().siblings('span').toggle()
        // $(this).animate({ width: "28%" }, 'slow');
})
;
