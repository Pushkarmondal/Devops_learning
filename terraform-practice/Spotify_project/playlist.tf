resource "spotify_playlist" "Songs" {
  name = "All"
  tracks = ["3G0gdqt4LTreFwBYaymUhp"]
}

data "spotify_search_track" "krsna" {
  artist = "KR$NA"
}

resource "spotify_playlist" "dollar" {
  name = "KR$NA Playlist"
  tracks = [
    data.spotify_search_track.krsna.tracks[0].id,
    data.spotify_search_track.krsna.tracks[1].id,
    data.spotify_search_track.krsna.tracks[2].id,
    data.spotify_search_track.krsna.tracks[3].id,
  ]
}
