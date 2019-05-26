let shareBtn = document.getElementById('nativeShare');
if(shareBtn){
    shareBtn.onclick = function(){
        let title = document.title;
        let text = document.getElementsByName('description').item(0).content;
        let url = window.location.href;
        navigator.share({title: title, text: text, url: url}).catch(function(error){console.error('Error sharing: ' + error)});
    };
}

$.ajax({
    url: '/search.json',
    cache: true,
    method: 'GET',
    success: function(data) {
        console.log('Downloaded Search JSON.');
        setupSearch(data);
    }
});

function setupSearch(lunrData) {
    console.log('Creating search index.');
    let lunrIndex = lunr.Index.load(lunrData.index);
    let lunrMap = lunrData.docs;
    $('#search').unwrap();
    $('#search-result-group').remove();
    $("#search").bind("keyup", function(){
        $(".search-results").empty();

        var query = $(this).val();
        if (query.length <= 2) { return; }
        var options = { year: "numeric", month: "long", day: "numeric" };
        var results = lunrIndex.search(query)
        if (results.length == 0) {
            $(".search-results").append('<p>No results.</p>');
        } else {
            $.each(results, function(index, result) {
                page = lunrMap[result.ref];
                date = new Date(page.date.match(/\d{4}-\d{2}-\d{2}/)).toLocaleDateString("en-US", options);
                $(".search-results").append(
                    '<div class="result">' +
                        '<a href="' + page.url + '">' +
                            page.title +
                        '</a> &nbsp; ' +
                        '<div class="post-meta">' + date + '</div>' +
                    '</div>'
                );
            });
        }
    }).keyup();
}