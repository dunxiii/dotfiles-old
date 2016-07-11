from i3pystatus import Status

"""
Python packet dependency:
colour
netifaces
basiciw
psutil
"""

status = Status(standalone=True)

status.register("clock", format=" %d %B %H:%M",hints={"color":"#ffffff"})

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

status.register("network",
        interface="eno1",
        format_up=" {v4cidr} ",
        format_down="")

status.register("disk",
        hints={"color":"#ffffff"},
        path="/",
        format=" root {percentage_used:.0f}% ")

status.run()
