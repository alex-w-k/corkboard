$('.fa').mouseenter(function(e) {
    $(this).first().parent().siblings('span').toggle()
})

$('.fa').mouseleave(function(e) {
    $(this).first().parent().siblings('span').toggle()
})

$('.result').on('click', function() {
    $(this).addClass('click-res')
})