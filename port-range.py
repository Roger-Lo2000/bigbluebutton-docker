
start = 16384
ranges = 5000
line1 = "    - name: udp-"
line2 = "      port: "
line3 = "      protocol: UDP"
line4 = "      targetPort: "


with open("output","a") as f:
    for i in range(ranges):
        f.writelines(line1 + str(start + i))
        f.writelines("\n")
        f.writelines(line2 + str(start + i))
        f.writelines("\n")
        f.writelines(line3)
        f.writelines("\n")
        f.writelines(line4 + str(start + i))
        f.writelines("\n")