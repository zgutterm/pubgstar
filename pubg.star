load("render.star", "render")
load("http.star", "http")
load("cache.star", "cache")
load("schema.star", "schema")
load ("math.star", "math")
load("encoding/base64.star", "base64")
load("time.star", "time")

PUBG_LOGO = base64.decode("""
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
""")

FIND_PLAYER_URL = "https://api.pubg.com/shards/$platform/players?filter[playerNames]=$playerName"
LIFETIME_URL = "https://api.pubg.com/shards/$platform/players/$playerId/seasons/$season"
PUBG_REPORT_URL = "https://api.pubg.report/v1/players/$playerId/streams"
PUBG_SEASSON_URL = "https://api.pubg.com/shards/$platform/seasons"

DEFAULT_USERNAME = "heelsfan23r"
DEFAULT_PLATFORM = "xbox"
DEFAULT_GAME_MODE = "duo"

DEFAULT_BEARER_TOKEN = "changeme"



def main(config):
    playerName = config.get("username", DEFAULT_USERNAME)
    platform = config.get("platform", DEFAULT_PLATFORM)
    mode = config.get("mode", DEFAULT_GAME_MODE)
    pubg_api_bearer_token = config.get("pubg_api_key", DEFAULT_BEARER_TOKEN)
    pubg_api_headers = { 'Accept': 'application/vnd.api+json','Authorization': 'Bearer %s' % pubg_api_bearer_token }

    playerId_cached = cache.get("playerId" + playerName)
    wins_cached = cache.get("wins" + playerName)
    kills_cached = cache.get("kills" + playerName)
    headshot_kills_cached = cache.get("headshot_kills" + playerName)
    damage_cached = cache.get("damage" + playerName)
    rounds_cached = cache.get("rounds" + playerName)
    assists_cached = cache.get("assists" + playerName)
    losses_cached = cache.get("losses" + playerName)
    current_season_cached = cache.get("current_season" + playerName)

    print(current_season_cached)
    if (playerId_cached == None):
        print("Looking up player")
        player_id_url = FIND_PLAYER_URL.replace("$playerName", playerName).replace("$platform", platform)
        player_id_rep = http.get(player_id_url, headers = pubg_api_headers)
        if player_id_rep.status_code != 200:
            fail("PUBG API Failed %d" % player_id_rep.status_code, player_id_rep.status_code)

        playerId = player_id_rep.json()["data"][0]["id"]
        cache.set("playerId" + playerName, playerId, ttl_seconds=600)
        print(playerId)

    else:
        playerId = str(playerId_cached)
    
    if (current_season_cached == None):
        platform_seasons_url = PUBG_SEASSON_URL.replace("$platform", platform)
        platform_seasons_rep = http.get(platform_seasons_url, headers = pubg_api_headers)
        if platform_seasons_rep.status_code != 200:
            fail("PUBG API Failed %d" % platform_seasons_rep.status_code, platform_seasons_rep.status_code)

        seasons = platform_seasons_rep.json()["data"]
        for season in seasons:
            # print(season)
            if season["attributes"]["isCurrentSeason"]:
                current_season = season["id"]
                print(current_season)
                cache.set("current_season" + playerName, current_season, ttl_seconds=600)
    else:
        current_season = str(current_season_cached)

    if (wins_cached != None) and (headshot_kills_cached != None):
        print("Hit! Displaying cached data.")
        wins = int(wins_cached)
        kills = int(kills_cached)
        headshot_kills = int(headshot_kills_cached)
        damage = int(damage_cached)
        rounds = int(rounds_cached)
        assists = int(assists_cached)
        losses = int(losses_cached)
    else:
        print("Miss! Calling API")
        lifetime_url_for_player = LIFETIME_URL.replace("$playerId", playerId).replace("$season", current_season).replace("$platform", platform)
        rep = http.get(lifetime_url_for_player, headers = pubg_api_headers)
        if rep.status_code != 200:
            fail("PUBG API Failed %d" % rep.status_code, rep.status_code)

        print(rep.json()["data"]["attributes"])
        wins = rep.json()["data"]["attributes"]["gameModeStats"]["%s" % mode]["wins"]
        cache.set("wins" + playerName, str(int(wins)), ttl_seconds=240)
        kills = rep.json()["data"]["attributes"]["gameModeStats"]["%s" % mode]["kills"]
        cache.set("kills" + playerName, str(int(kills)), ttl_seconds=240)
        headshot_kills = rep.json()["data"]["attributes"]["gameModeStats"]["%s" % mode]["headshotKills"]
        cache.set("kills" + playerName, str(int(headshot_kills)), ttl_seconds=240)
        damage = rep.json()["data"]["attributes"]["gameModeStats"]["%s" % mode]["damageDealt"]
        cache.set("damage" + playerName, str(int(damage)), ttl_seconds=240)
        rounds = rep.json()["data"]["attributes"]["gameModeStats"]["%s" % mode]["roundsPlayed"]
        cache.set("rounds" + playerName, str(int(rounds)), ttl_seconds=240)
        losses = rep.json()["data"]["attributes"]["gameModeStats"]["%s" % mode]["losses"]
        cache.set("losses" + playerName, str(int(rounds)), ttl_seconds=240)
        assists = rep.json()["data"]["attributes"]["gameModeStats"]["%s" % mode]["assists"]
        cache.set("assists" + playerName, str(int(assists)), ttl_seconds=240)


        pubg_report_url_for_player = PUBG_REPORT_URL.replace("$playerId", playerId)
        pubgresp = http.get(pubg_report_url_for_player, headers = {
        'Accept': 'application/vnd.api+json'
        })
        if pubgresp.status_code != 200:
            fail("PUBG API Failed %d" % pubgresp.status_code, pubgresp.status_code)
        keys = pubgresp.json().keys()
        print(keys)
        timeArray = []
        for k in keys:
            foundTime = pubgresp.json()[k][0]["TimeEvent"]
            foundTime = foundTime[0:10]
            timeArray.append(foundTime)
        print(timeArray)
        now = time.now()
        today = now.format("2006-01-02")
        oneday = time.parse_duration("24h")
        yesterday = now - oneday

        yesterday_formatted = yesterday.format("2006-01-02")
        print(yesterday_formatted)
        print(today)
        reportColor = "#000000"
        if (yesterday_formatted in timeArray):
            print("New PUBG REPORT")
            reportColor = "#FFFF00"
        elif (today in timeArray):
            reportColor = "#FF0000"
        else:
            print("No recent pubg report")
            reportColor = "#000000"

    # kd = (int)kills / ((int)rounds - (int)wins)
    if losses > 0:
        kd = kills/ losses
    else:
        kd = 0
    kd_str = str(int(math.round(kd * 100)))
    kd_str = (kd_str[0:-2] + "." + kd_str[-2:])
    print(kd_str)
    if rounds > 0:
        avg_dmg = damage / rounds
        win_percent = int(math.round((wins/rounds) * 100))
    else:
        avg_dmg = 0
        win_percent = 0
    avg_dmg_str  = str(int(math.round(avg_dmg * 100)))
    avg_dmg_str = (avg_dmg_str[0:-2])
    print(avg_dmg_str)

   
    return render.Root(
        child = render.Column (
            cross_align="center",
            main_align="center",
            expanded = True,
            children = [
                render.Row(
                    main_align = "center",
                    cross_align="center",
                    children = [
                        render.Image(src=PUBG_LOGO,height=8),
                        render.Text("%s" % playerName, font="tom-thumb")
                    ]
                ),
                render.Row(
                    children = [
                        render.Text("%d Wins "%(wins)),
                        render.Text("(%d%%)"%(win_percent), color="#b434eb")
                    ]
                ),
                render.Row(
                    children = [
                        render.Text("K/D",color="#FF0000", font="tom-thumb"),
                        render.Text("%s " % (kd_str), font="tom-thumb"),
                        render.Text("AD", color="#FFFF00", font="tom-thumb"),
                        render.Text("%s" % (avg_dmg_str), font="tom-thumb"),
                    ]
                ),
                render.Marquee(
                    width=64,
                    # offset_start = 0,
                    # offset_end = 32,
                    child=render.Row( # Row lays out its children horizontally
                        children = [
                            render.Text("K", color="#FF0000", font="tom-thumb"),
                            render.Text("%d " % kills, font="tom-thumb"),
                            render.Text("HS", color="#fc9403", font="tom-thumb"),
                            render.Text("%d " % headshot_kills, font="tom-thumb"),
                            render.Text("D", color="#FFFF00", font="tom-thumb"),
                            render.Text("%d " % damage, font="tom-thumb"),
                            render.Text("A", color="#00FF00", font="tom-thumb"),
                            render.Text("%d" % assists, font="tom-thumb"),
                        ],
                    )
                ),
                render.Row(
                    main_align="end",
                    cross_align="end",
                    expanded=True,
                    children=
                        [render.Circle(
                        color=reportColor,
                        diameter=2
                    )]
                )
            ]
        )
    )

def get_schema():
    mode_options = [
        schema.Option(
            display = "Solo",
            value = "solo",
        ),
        schema.Option(
            display = "Solo FPP",
            value = "solo-fpp",
        ),
        schema.Option(
            display = "Duos",
            value = "duo",
        ),
        schema.Option(
            display = "Duos FPP",
            value = "duo-fpp",
        ),
        schema.Option(
            display = "Squads",
            value = "squad",
        ),
        schema.Option(
            display = "Squads FPP",
            value = "squad-fpp",
        ),
    ]
    platform_options = [
        schema.Option(
            display = "Steam",
            value = "steam",
        ),
        schema.Option(
            display = "Xbox",
            value = "xbox",
        ),
        schema.Option(
            display = "PSN",
            value = "psn",
        ),
        schema.Option(
            display = "Stadia",
            value = "stadia",
        ),
        schema.Option(
            display = "Kakao",
            value = "kakao",
        ),
    ]
    return schema.Schema(
        version = "1",
        fields = [
            schema.Text(
                id = "username",
                name = "Username",
                desc = "What is your PUBG username?",
                icon = "user",
            ),
            schema.Dropdown(
                id = "platform",
                name = "Platform",
                desc = "Which platform do you play on?",
                icon = "computer",
                default = platform_options[0].value,
                options = platform_options,
            ),
            schema.Dropdown(
                id = "mode",
                name = "Game Mode",
                desc = "Which game mode do you want stats for?",
                icon = "person",
                default = mode_options[0].value,
                options = mode_options,
            ),
            schema.Text(
                id = "pubg_api_key",
                name = "PUBG API Key",
                desc = "What is your PUBG API Key? (to create an API key see https://developer.pubg.com/)",
                icon = "key",
            ),
        ],
    )
