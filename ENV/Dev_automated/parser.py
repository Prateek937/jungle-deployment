import subprocess as sb

def graph_parser():
    file1 = open('graph', 'r')
    Lines = file1.readlines()
    file1.close()
    refrences = []

    for line in Lines:
        if "->" in line and "module" in line and "provider" not in line and "meta" not in line:
            refrences.append(line.strip().replace("[root] ", "")
                                .replace("f(expand)", "")
                                .replace("(expand)", "")
                                .replace("(close)", "")
                                .replace('"', '')
                                .replace(" ", ""))

    for line in refrences:
        print(line)

    connections  = []
    for line in refrences:
        connections.append(list(line.split("->")))

    for line in connections:
        print(line)

    inter_module = []

    for line in connections:
        right = line[0].split(".")
        left = line[1].split(".")
        print(left)
        if left[0] == "var":
            continue
        if right[right.index('module')+1] != left[left.index('module')+1]:
            inter_module.append(line)

    resouces_to_spare = []

    for line in inter_module:
        target = line[1]
        for connection in connections:
            if target == connection[0]:
                target =  connection[1]
                resouces_to_spare.append(target)

    print(resouces_to_spare)
        # print(right, left)

graph_parser()
# sb.call("terraform state list", shell=True)
# resource_to_spare = graph_parser()
# print()
# print(resource_to_spare)
# state_list = sb.getoutput("terraform state list").split("\n")
# print()

# exclude = []
# for resource in state_list:
#     if "module.Network" not in resource or  resource in resource_to_spare:
#         exclude.append(resource)

# for resource in exclude:
#     state_list.remove(resource)

# print(state_list)

# l = ""
# for resource in state_list:
#     l += " -target=" + resource  
# cmd = "terraform destroy" + l
# sb.call(cmd, shell=True)



# sb.call("terraform state list", shell=True)
# print()
# for x in state_list: 
#     print(x)