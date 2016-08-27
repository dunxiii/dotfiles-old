from i3pystatus import Status
from i3pystatus.updates import pacman

"""
Python packet dependency:
colour
netifaces
basiciw
psutil
"""

status = Status(standalone=True)

status.register("clock",
                format="%d %B %H:%M",
                hints={"color":"#ffffff"},
                on_leftclick="xdg-open https://calendar.google.com")

status.register("battery",
                hints={"color":"#ffffff"},
                format="{status} {consumption:.0f}W {percentage:.2f}% {remaining:%E%hh:%Mm}",
                alert_percentage=15,
                charging_color="#F2FF00",
                status={
                    "DIS": "",
                    "CHR": "",
                    "FULL": "",
                })

status.register("pulseaudio",
                format="  {volume}%",
                hints={"color":"#ffffff"},
                on_upscroll="zenbook-audio.sh -v +",
                on_downscroll="zenbook-audio.sh -v -",
                on_leftclick="zenbook-audio.sh -m",
                on_rightclick="pavucontrol")

status.register("mem",
                format="MEM {percent_used_mem}%",
                on_leftclick="terminator --geometry=600x400 -x htop")

status.register("cpu_usage",
                format="CPU {usage}%",
                hints={ "color":        "#ffffff",
                        "full_text":    "CPU 4%",
                        "min_width":    "CPU 100%",
                        "align":        "center"
                },
                on_leftclick="terminator --geometry=600x400 -x htop")

status.register("dpms",
                format="DPMS: {status}",
                hints={"color":"#ffffff"})

status.register("network",
        interface="eth0",
        format_up="{v4cidr}",
        format_down="")

status.register("network",
        interface="wlp2s0",
        format_up="{essid}",
        interval=5)

'''
status.register("runwatch",
        path="/var/lib/plexmediaserver/Library/Application Support/Plex Media Server/plexmediaserver.pid",
        name="Plex")
'''

status.register("shell",
        command="pgrep insync || $(echo ERROR && exit 1)",
        format="Insync",
        on_leftclick="pgrep insync || insync start",
        on_rightclick="insync quit")

status.register("updates",
        backends = [pacman.Pacman()],
        format="Updates: {count}",
        interval=1800)

status.register("shell",
        command="docker ps | tail -n -1 | grep -v CREATED | wc --lines",
        format="DC: {output}")

status.register("shell",
        command="VBoxManage list runningvms | wc --lines",
        format="VB: {output}")

status.register("disk",
        hints={"color":"#ffffff"},
        path="/",
        format="root {percentage_used:.0f}%")

status.run()
