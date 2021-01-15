final String apiKey = "3216e8bedd123b8726d20ea3fd2e7cd0";
final String mainUrl = "https://api.themoviedb.org/3";
var getPopularUrl = '$mainUrl/movie/top_rated';
var getMoviesUrl = '$mainUrl/discover/movie';
var getPlayingUrl = '$mainUrl/movie/now_playing';
var getGenresUrl = "$mainUrl/genre/movie/list";
var getPersonsUrl = "$mainUrl/trending/person/week";
var movieUrl = "$mainUrl/movie";

var movieParams = {"api_key": apiKey, "language": "en-US", "page": 1};
var genreParams = {"api_key": apiKey, "language": "en-US"};
var personParams = {"api_key": apiKey};
