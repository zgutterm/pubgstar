load("render.star", "render")
load("http.star", "http")
load("cache.star", "cache")
load ("math.star", "math")
load("encoding/base64.star", "base64")
load("time.star", "time")

LIFETIME_URL = "https://api.pubg.com/shards/xbox-na/players/account.004b9c76aa3c484d9e8d5d5a607a818f/seasons/division.bro.official.console-21"
PUBG_REPORT_URL = "https://api.pubg.report/v1/players/account.004b9c76aa3c484d9e8d5d5a607a818f/streams"


def main():
    wins_cached = cache.get("wins")
    kills_cached = cache.get("kills")
    headshot_kills_cached = cache.get("headshot_kills")
    damage_cached = cache.get("damage")
    rounds_cached = cache.get("rounds")
    assists_cached = cache.get("assists")
    losses_cached = cache.get("losses")
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
        rep = http.get(LIFETIME_URL, headers = {
        'Accept': 'application/vnd.api+json',
        'Authorization': 'Bearer <TOKENHERE>'
        })
        if rep.status_code != 200:
            fail("PUBG API Failed %d", rep.status_code)

        wins = rep.json()["data"]["attributes"]["gameModeStats"]["duo"]["wins"]
        cache.set("wins", str(int(wins)), ttl_seconds=240)
        kills = rep.json()["data"]["attributes"]["gameModeStats"]["duo"]["kills"]
        cache.set("kills", str(int(kills)), ttl_seconds=240)
        headshot_kills = rep.json()["data"]["attributes"]["gameModeStats"]["duo"]["headshotKills"]
        cache.set("kills", str(int(headshot_kills)), ttl_seconds=240)
        damage = rep.json()["data"]["attributes"]["gameModeStats"]["duo"]["damageDealt"]
        cache.set("damage", str(int(damage)), ttl_seconds=240)
        rounds = rep.json()["data"]["attributes"]["gameModeStats"]["duo"]["roundsPlayed"]
        cache.set("rounds", str(int(rounds)), ttl_seconds=240)
        losses = rep.json()["data"]["attributes"]["gameModeStats"]["duo"]["losses"]
        cache.set("losses", str(int(rounds)), ttl_seconds=240)
        assists = rep.json()["data"]["attributes"]["gameModeStats"]["duo"]["assists"]
        cache.set("assists", str(int(assists)), ttl_seconds=240)

        pubgresp = http.get(PUBG_REPORT_URL, headers = {
        'Accept': 'application/vnd.api+json',
        'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJqdGkiOiJiN2IyODMwMC1lNTJlLTAxMzYtNjEwYS00ZjFjMTU0ZDcwZTEiLCJpc3MiOiJnYW1lbG9ja2VyIiwiaWF0IjoxNTQ1MTYzNzU1LCJwdWIiOiJibHVlaG9sZSIsInRpdGxlIjoicHViZyIsImFwcCI6InB1YmdmcmllbmRzIn0.INISNxfhgJgGY-0vAMBxQlYrQjL9u_5Ngob31Qr5zog'
        })
        if pubgresp.status_code != 200:
            fail("PUBG API Failed %d", pubgresp.status_code)
        keys = pubgresp.json().keys()
        print(keys)
        timeArray = []
        for k in keys:
            # print(pubgresp.json([k][0]["TimeEvent"]))
            foundTime = pubgresp.json()[k][0]["TimeEvent"]
            timeArray.append(foundTime)
        # matchId = keys[0]
        # print(matchId)
        # last = pubgresp.json()[matchId][0]["TimeEvent"]
        # print(last)
        print(timeArray)
        now = time.now()
        today = now.format("2006-01-02")
        print(today)

    # kd = (int)kills / ((int)rounds - (int)wins)
    kd = kills/ losses
    kd_str = str(int(math.round(kd * 100)))
    kd_str = (kd_str[0:-2] + "." + kd_str[-1:])
    print(kd_str)

    avg_dmg = damage / rounds
    avg_dmg_str  = str(int(math.round(avg_dmg * 100)))
    avg_dmg_str = (avg_dmg_str[0:-2])
    print(avg_dmg_str)

    win_percent = int(math.round((wins/rounds) * 100))

    return render.Root(
        child = render.Column (
            cross_align="center",
            main_align="center",
            expanded = True,
            children = [
                # render.Image(src=BTC_ICON,height=12),
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
                )
            ]
        )
    )