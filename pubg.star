load("render.star", "render")
load("http.star", "http")
load("cache.star", "cache")
load("schema.star", "schema")
load ("math.star", "math")
load("encoding/base64.star", "base64")
load("time.star", "time")

PUBG_LOGO = base64.decode("""
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
48jIRBYHHV5WJup0LbpAJMcniQdYPmTtJEhC4I2Qya8io0o8jvpVLdTtgx/XudChLRYGcLU9qDOo
perIMOvRQHivjVSdeHr+YyCO4Yd85gJe4aVbznTv0AY8/c7dDDH892VA2uasb3YnIokBo/TDYhav
tsj0bYAAxC35fd3cVMc4yeD+HxClv65DPCR9AAABhGlDQ1BJQ0MgcHJvZmlsZQAAeJx9kTtIw1AU
hv+mSkVqHewg4pChOtlFRRxrFYpQIdQKrTqY3PQFTRqSFBdHwbXg4GOx6uDirKuDqyAIPkBcXZwU
XaTEc5NCixgPXO7Hf89/OPccQGhWmWb1JABNt81MKinm8qti6BUBRADMIiIzy5iTpDR84+uesinu
4ryWf96fMaAWLAYEROIEM0ybeIN4ZtM2OO8TR1lZVonPiSdMapD4keuKx2+cSy4LvGbUzGbmiaPE
YqmLlS5mZVMjniaOqZpO9YWcxyrnLc5atc7affIfhgv6yjLX6YwihUUsQYIIBXVUUIWNON06KRYy
9J708Y+4folcCrkqYORYQA0aZNcPvoPfs7WKU5NepXAS6H1xnI8xILQLtBqO833sOK0TIPgMXOkd
f61JS/wkvdHRYkfA4DZwcd3RlD3gcgcYfjJkU3alIB2hWATez2hNeWDoFuhf8+bWfsfpA5ClWaVv
gINDYLxEtdd9/t3XPbd/c9rz+wFvcXKlDw2qogAADXhpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAA
ADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+Cjx4
OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IlhNUCBDb3JlIDQuNC4w
LUV4aXYyIj4KIDxyZGY6UkRGIHhtbG5zOnJkZj0iaHR0cDovL3d3dy53My5vcmcvMTk5OS8wMi8y
Mi1yZGYtc3ludGF4LW5zIyI+CiAgPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIKICAgIHht
bG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIgogICAgeG1sbnM6c3RF
dnQ9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZUV2ZW50IyIKICAg
IHhtbG5zOmRjPSJodHRwOi8vcHVybC5vcmcvZGMvZWxlbWVudHMvMS4xLyIKICAgIHhtbG5zOkdJ
TVA9Imh0dHA6Ly93d3cuZ2ltcC5vcmcveG1wLyIKICAgIHhtbG5zOnRpZmY9Imh0dHA6Ly9ucy5h
ZG9iZS5jb20vdGlmZi8xLjAvIgogICAgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hh
cC8xLjAvIgogICB4bXBNTTpEb2N1bWVudElEPSJnaW1wOmRvY2lkOmdpbXA6MWVlNmQwM2MtMjBm
My00MmM3LWJkOGUtMjhiYTRiNjZlOTAyIgogICB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOjI4
ZjcyN2FmLTMzMWUtNDU0OS04ZjQ0LTE3MTQ3NTcyMDMwNiIKICAgeG1wTU06T3JpZ2luYWxEb2N1
bWVudElEPSJ4bXAuZGlkOjExZGY5N2IzLTM0YmItNGI3NS1hNTMzLWExNzgwNDJmOWFiZiIKICAg
ZGM6Rm9ybWF0PSJpbWFnZS9wbmciCiAgIEdJTVA6QVBJPSIyLjAiCiAgIEdJTVA6UGxhdGZvcm09
IkxpbnV4IgogICBHSU1QOlRpbWVTdGFtcD0iMTY3MzY1ODczNjU4ODM4OCIKICAgR0lNUDpWZXJz
aW9uPSIyLjEwLjMyIgogICB0aWZmOk9yaWVudGF0aW9uPSIxIgogICB4bXA6Q3JlYXRvclRvb2w9
IkdJTVAgMi4xMCIKICAgeG1wOk1ldGFkYXRhRGF0ZT0iMjAyMzowMToxM1QyMDoxMjoxNi0wNTow
MCIKICAgeG1wOk1vZGlmeURhdGU9IjIwMjM6MDE6MTNUMjA6MTI6MTYtMDU6MDAiPgogICA8eG1w
TU06SGlzdG9yeT4KICAgIDxyZGY6U2VxPgogICAgIDxyZGY6bGkKICAgICAgc3RFdnQ6YWN0aW9u
PSJzYXZlZCIKICAgICAgc3RFdnQ6Y2hhbmdlZD0iLyIKICAgICAgc3RFdnQ6aW5zdGFuY2VJRD0i
eG1wLmlpZDoxMmMxNjJjYS03Y2RmLTQ4YjYtYjI2NC1jZTg1MTU2N2ViNjUiCiAgICAgIHN0RXZ0
OnNvZnR3YXJlQWdlbnQ9IkdpbXAgMi4xMCAoTGludXgpIgogICAgICBzdEV2dDp3aGVuPSIyMDIz
LTAxLTEzVDIwOjEyOjE2LTA1OjAwIi8+CiAgICA8L3JkZjpTZXE+CiAgIDwveG1wTU06SGlzdG9y
eT4KICA8L3JkZjpEZXNjcmlwdGlvbj4KIDwvcmRmOlJERj4KPC94OnhtcG1ldGE+CiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAKPD94cGFja2V0IGVu
ZD0idyI/Pv1zvc4AAAAGYktHRADwAAAAGKIbc3QAAAAJcEhZcwAACxMAAAsTAQCanBgAAAAHdElN
RQfnAQ4BDBCq6upGAAAHXklEQVR42u2dTYgcRRTHX8fRBKLGQ9CoQSXgmgQUIu6SDTlkVXLwJosX
IXjRS8Crlxxy8pKr4imXmKMEb4KCroewG3dFQQ+7riJGYozBg59g1sT2MFPZnrddU68+uquq+/+H
Yeju1x/VXfPrN69eVRW0qZKaUcGWS8N2V5We15WSykjnLTpQprEybCMI6rAK/gu7uR72BIOp8WV+
fL7dgSIlEdGNBbudts+Jz1cGuLdOtAv9LGyfVYgy6J57C2UoQHCo8xr4HuDWT8PvOx6u365+ucpO
t73yCyyJ6HUieltw+rfaulEOb4gylq9/4+v69Strw++jL01+FjUkT/7tU1OGMmWC/yW0uxuMghoh
uI7IOqKrZb6fhvxShqzjEda8PZ6sXz/dw3uRKsHnhHYLqM5QUILbkltnb9hvhoh2EdHvhstZHtns
wqM0++KK7Gq9jvRdKGPqBN9GRM8K7P4jok9QlSExwTlRTQSWEt7gc9fpABG9L7BbJaIXdRuXFseX
Z4/0j9y69YFJHiV6wq89pzj4nUK7f8EpSExwKbkvrw6/p05qaLEgI7w6zqMHtpj+KSzDPZM29onY
O+frt/99YbIvHtMnN107LwO/dl6mXOLgRESXhHaHwSnI2ge3IHdtS51qyVt/p57Q6jgT9LmwDM/0
/SFW6FdotpdVCup89BSvnZdB5+Pr3kKpEvwHItoQ2D1GRHeBU5CY4CZyW6gYkX6M5FA86fxXroof
e4KIzhsO+y4RnYhVli0VGtmEkE09kvxP7ATBHWRFboc3RG/E/UvfqIdpvwoFzwoO99roU6Z470Bw
CD54BO0V2l3pA7mly1A+cfABEe2QlIeI/sFjhbwJXtPSaLWfg4+9h4bhQpOu0TBc2N1/enlkARZV
cvLW09DHl9rDB4f6TXBOXl+SQ/bk1i13qWy2JJcKBIf6TXDuQ4eKV0/IIlTaEB4KTfWW0kVfQr4h
TFl/bSllgl8V2j2EKgs5E1xHcpXv7Tr+B3zydPzfLsfTUyX4daHd/aiuUBCCO5C3qBLecmQoaQvl
XjxCf1+8Cb84tu+dOsF/E9rdh2oKBSV4S/pRaPcIHmE4XzyXY3eB4BAUl+AW45tMtDeNTgt1w8+P
RXgQHALBHSUa6UhD7h3Cc+SQKnuciD4S2n5IRMdtR4fiOdBcn76ZDrld65GDks4m3CO0u5ZBBT9k
YfslmNsywXW+Me+9rPsFKarc7O9I3vstbNd8aCm9xzHzyi3O6VVvUu/RI80vuUoQZCD42C+Fj2yl
i3IIclGcZj8bSZohuIFH6O8X14wP6D2vkC6bsO28F0RRoH774Jzk3DevITkRbY6HorIP9/U3Dm7z
lnHKbXfNDozhi6uZ3qb32+3nmtsCgjcvm/8JyG2PRXAT0R19bbRgWvjKut71vn5tE36x7pi25IYP
nr5sUnqv4HZFIrgplwRE1uopC9uvbKgYmuQ1LaJF7Jsn9b1zGx+8S7LpdXQdt6shgtvOZ+kb/VD7
346yPO8UecihR73NNW64ENk0z43KRTH5v7xFNAWSqzKZZqfQkT1Vgn8jtHsigwpuExlBy2wsH9xE
YlcfXtPH84zw9G9kcI9t6VfYju9naoE8dqqx8QJbu298nqGcffBLRHRRYHeYiI6CUZAVwU0jToWK
mqj9KlmJSrMWP4SCmp9ZwGd0ACiyEEWBOk9wL0LVELhpH7U3ChXfDqAZIlo22HxGRDPKR3bNOQHB
oRh6QGDzSxY+uNQX3z4HAudGdI/99wlsvq+eYxo+OJSRbkniBlkRHKO/3la06Eno3jAe+38rsHm8
eo4V1ru0LV+clxEEhySSDKWX5DB6g64+kaXF8eXZI6ilHpLM63GQaLPFMcZYLNX/ACA41Av1poIv
LW6lOoQKDkFZa4Bb0F812VKqoiYra+2WCVEUCATvglTUBH63nHZNjI+CXBQISpHgvvNktk3ypnVu
lEX3ynz+RE9lfh0QHIKaIjjGPxlXzuQ2+eYhFCs/HASHQPCcpaIobfniKefJx8rwi0FuEBzqN8FN
PXoEc/REJTaUNtFBcAhqkuBd69HTFtlTbh/ghOYET6UnPAgOQb4E77pUjxM1bp+JyOfYmHg87t1m
SyYnr6ksanvbmX0SqXFUVE8gkx0IDkFdJrgui1C33tR30ERuvr7JOLgu6qHWSymXMsnhg0NQEwS/
vJp3QV2jKFMPDr/Xf55M+CZ8b97jxjYKoiN+zlES3dtHVyYQHOonwU0tmWom46mTaeaD89yTpuLg
bWYR6uj1wRfD79Mvhzn+sVPt/Y8wEZjv9+sfw+/d98reaiA41C+Cc19bkU9R4tXnJpM9gkTjm7v2
0VS+dwr53jrf+oWnwx6/if8PpjLoiM2vafm7yW8r/vYBwaFOq+pj1RKQE/3sx8PvMxea89McNdYS
ZjsabCV+PSYVJ9flk9fsV4Qqi5qvkuvie34E3jlvVS+8yqDi275jsJh895oygeBQvwheS0LHYyRH
dI9ylBHLX7b43HMrg6hMIDjUaf0PuIJeGlhjvTsAAAAASUVORK5CYII=
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
