load("render.star", "render")
load("http.star", "http")
load("cache.star", "cache")
load ("math.star", "math")

LIFETIME_URL = "https://api.pubg.com/shards/xbox-na/players/account.004b9c76aa3c484d9e8d5d5a607a818f/seasons/lifetime"

def main():
    wins_cached = cache.get("wins")
    kills_cached = cache.get("kills")
    damage_cached = cache.get("damage")
    rounds_cached = cache.get("rounds")
    assists_cached = cache.get("assists")
    if wins_cached != None:
        print("Hit! Displaying cached data.")
        wins = int(wins_cached)
        kills = int(kills_cached)
        damage = int(damage_cached)
        rounds = int(rounds_cached)
        assists = int(assists_cached)
    else:
        print("Miss! Calling API")
        rep = http.get(LIFETIME_URL, headers = {
        'Accept': 'application/vnd.api+json',
        'Authorization': 'Bearer <<ADD API TOKEN>>'
        })
        if rep.status_code != 200:
            fail("PUBG API Failed %d", rep.status_code)

        wins = rep.json()["data"]["attributes"]["gameModeStats"]["duo"]["wins"]
        cache.set("wins", str(int(wins)), ttl_seconds=240)
        kills = rep.json()["data"]["attributes"]["gameModeStats"]["duo"]["kills"]
        cache.set("kills", str(int(kills)), ttl_seconds=240)
        damage = rep.json()["data"]["attributes"]["gameModeStats"]["duo"]["damageDealt"]
        cache.set("damage", str(int(damage)), ttl_seconds=240)
        rounds = rep.json()["data"]["attributes"]["gameModeStats"]["duo"]["roundsPlayed"]
        cache.set("rounds", str(int(rounds)), ttl_seconds=240)
        assists = rep.json()["data"]["attributes"]["gameModeStats"]["duo"]["assists"]
        cache.set("assists", str(int(assists)), ttl_seconds=240)

    # kd = (int)kills / ((int)rounds - (int)wins)
    print (rounds - wins)
    kd = kills/ (rounds-wins)
    v = str(int(math.round(kd * 100)))
    v = (v[0:-2] + "." + v[-2:]) 
    print(v)


    return render.Root(
        child = render.Column (
            cross_align="center",
            children = [
                render.Text("Wins: %d" % wins),
                # render.Text("Kills: %d" % kills, color="#FF0000")
                render.Marquee(
                    width=64, 
                    child=render.Row( # Row lays out its children horizontally
                        children = [
                            render.Text("Kills: %d " % kills, color="#FF0000"),
                            render.Text("Damage: %d " % damage, color="#FFFF00"),
                            render.Text("Assists: %d " % assists, color="#00FF00"),
                        ],
                    )

                ),
                render.Text("K/D: %s" % v, color="#099")
            ]
        )
    )