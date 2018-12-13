var song_List;

var dataSongId  =$('#songById').val();

getSingerRankingList(dataSongId)
function getSingerRankingList(dataSongId) {

    $.ajax({
        url: "/musicPlayer/songListById.do",
        method: "get",
        data: {"id": dataSongId},
        async: false,
        success: function (data) {
            song_List=data.data;
        }
    });
}