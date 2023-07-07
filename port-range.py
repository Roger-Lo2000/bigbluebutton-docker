
start = 16384
ranges = 10
line1 = "- name: udp-"
line2 = "  port: "
line3 = "  protocol: udp-"
line4 = "  targetPort: "

for i in range(ranges):
    with open("output","a") as f:
        f.writelines(line1 + str(start + i))
        f.writelines("\n")
        f.writelines(line2 + str(start + i))
        f.writelines("\n")
        f.writelines(line3 + str(start + i))
        f.writelines("\n")
        f.writelines(line4 + str(start + i))
        f.writelines("\n")