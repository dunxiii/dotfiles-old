from i3pystatus import Status

"""
Python packet dependency:
colour
netifaces
basiciw
psutil
"""

status = Status(standalone=True)

status.register("clock", format="  %d %B %H:%M",hints={"color":"#ffffff"})

status.register("battery",
                hints={ "color":"#ffffff",
                        "markup": "pango"},
                format=" <span font-family=\"FontAwesome\">{status}</span> {consumption:.0f}W {percentage:.2f}% {remaining:%E%hh:%Mm} ",
                alert_percentage=15,
                charging_color="#F2FF00",
                status={
                    "DIS": "",
                    "CHR": "",
                    "FULL": "",
                })

status.register("pulseaudio",
                format="   {volume}% ",
                hints={"color":"#ffffff"})

status.register("mem", format=" MEM {percent_used_mem}%")

status.register("cpu_usage",
                format= "CPU {usage}%",
                hints={ "color":        "#ffffff",
                        "full_text":    "CPU 4%",
                        "min_width":    "CPU 100%",
                        "align":        "center"
                })

status.register("dpms", hints={"color":"#ffffff"})

status.register("network",
        interface="enp0s20u1",
        format_up=" {v4cidr} ",
        format_down="")

status.register("network",
        interface=" enp0s20u2 ",
        format_up="{v4cidr}",
        format_down="")

status.register("network",
        interface=" enp0s20u3 ",
        format_up="{v4cidr}",
        format_down="")

status.register("network",
        interface="wlp2s0",
        format_up=" {essid} {quality:03.0f}% <span color=\"#ffffff\">{v4cidr}</span> ",
        interval=5,
        hints={"markup": "pango"})

status.register("disk",
        hints={"color":"#ffffff"},
        path="/home",
        format=" home {percentage_used:.0f}% ")

status.register("disk",
        hints={"color":"#ffffff"},
        path="/",
        format="root {percentage_used:.0f}% ")

status.register("disk",
        hints={"color":"#ffffff"},
        path="/boot",
        format="boot {percentage_used:.0f}% ")

status.run()
