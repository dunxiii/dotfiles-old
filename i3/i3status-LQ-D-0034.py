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

status.register("network",
        interface="eno1",
        format_up="{v4cidr}",
        format_down="")

status.register("updates",
        backends = [pacman.Pacman()],
        format="Updates: {count}")

status.register("disk",
        hints={"color":"#ffffff"},
        path="/",
        format=" root {percentage_used:.0f}% ")

status.run()
