function getServerStats(){
  $.ajax(
    {
      url: '/api/server_stats.json',
      dataType: 'json',
      type: 'get',
      success: function(data) {
        if (data){
          updateStatusBar(data);
        }
      }
    }
  );
}

function updateStatusBar(data){
  var players = data.online_players;
  var status = data.server_stat
  var statusSpan = $('#online_status');
  var playerSpan = $('#player_count');
  if (status == 'UP'){
    statusSpan.toggleClass('label label-success');
  } else {
    statusSpan.toggleClass('label label-warning');
  }
  statusSpan.text(status);
  playerSpan.text(players);
}
