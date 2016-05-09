#!/usr/bin/env python3

# Inspiration from https://gist.github.com/projectgus/5f8e1fab789edd138a5b

# The intention of this script is to adapt already existing configurations
# of i3status to make it do what the hell you want him to. You can also add
# new fields that are missing.

import os
import sys
import json
import subprocess


def battery(field):
    with open(field["instance"]) as file:
        for line in file:
            prop, value = line.split("=", 1)
            if "STATUS" in prop:
                status = value.rstrip()
            elif "CHARGE_FULL" in prop:
                charge_full = int(value)
            elif "CHARGE_NOW" in prop:
                charge_now = int(value)
    if status == "Full":
        field["full_text"] = status + " battery"
    elif status == "Unknown":
        field["full_text"] = "Changing status"
    else:
        charge = int(charge_now / charge_full * 100)
        if charge < 10:
            field["background"] = "#FF0000"
            field["color"] = "#FFFFFF"
        field["full_text"] = status + ": " + str(charge) + "%"
    field["button"] = 1


def brightness():
    instance = "/sys/class/backlight/intel_backlight/"
    with open(instance + "actual_brightness") as file:
        actual_brightness = int(file.readline().rstrip())
    with open(instance + "max_brightness") as file:
        max_brightness = int(file.readline().rstrip())

    return [{"name": "brightness", "full_text": '\u2600' + ": "
            + str(int(actual_brightness / max_brightness * 100)) + "%"}]


def get_json(parsed):
    for el in parsed:
        try:
            F_DICT[el["name"]](el)
        except KeyError:
                continue
        except subprocess.CalledProcessError:
                continue
    res = []
    res += parsed
    res += brightness()
    return res


def main():
        with os.popen("/usr/bin/i3status", mode='r', buffering=1) as status:
                while True:
                        sys.stdout.flush()
                        line = status.readline()
                        if line == "":
                                break
                        if not line.startswith(","):
                                print(line.strip())
                                continue
                        parsed = json.loads(line[1:])
                        get_json(parsed)
                        print(",%s" % (json.dumps(get_json(parsed)),))


F_DICT = {"battery": battery}


if __name__ == "__main__":
    main()
