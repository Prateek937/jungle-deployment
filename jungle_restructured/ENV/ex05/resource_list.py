import subprocess as sb
import json

def vpc_peering(region):
    cmd = "aws ec2 describe-vpc-peering-connections --region=" + region
    peering_conns= json.loads(sb.getoutput(cmd))
    connections = []
    for item in peering_conns["VpcPeeringConnections"]:
        connection = {}
        connection["PeeringConnectionId"] = item["VpcPeeringConnectionId"]
        connection["RequesterVpc"] = item["RequesterVpcInfo"]["VpcId"]
        connection["RequesterRegion"] = item["RequesterVpcInfo"]["Region"]
        connection["AccepterVpc"] = item["AccepterVpcInfo"]["VpcId"]
        connection["AccepterRegion"] = item["AccepterVpcInfo"]["Region"]

        connections.append(connection)

    count = 1
    
    # for con in connections:
    #     print("Connection-{}: ".format(str(count)), end="\n")
    #     count += 1
    #     for x in con:
    #         print("\t" + x + " "*(len("VpcPeeringConnectionId")-len(x))+ ": " + con[x])
    #     print()

    #print("PeeringConnectionId     |", "     RequesterVpc/Region         |", "     AccepterVpc/Region")
    
    print("\t\t\t\tVPC PEERING CONNECTIONS (", region, ")")
    print("-"*101)
    print("  |    {:<10}   |     {:<29}  |     {:<28}|".format(
                                        "PeeringConnectionId",
                                        "RequesterVpc/Region",
                                        "AccepterVpc/Region",

                                    )
        )

    print("-"*101)

    for connection in connections:
        print("{:<2}|  {:<10}   |  {:<10}/{:<10}  | {}/{:<10}|".format(
                                        count, 
                                        connection["PeeringConnectionId"],
                                        connection["RequesterVpc"],
                                        connection["RequesterRegion"],
                                        connection["AccepterVpc"],
                                        connection["AccepterRegion"]

                                    )
        )
        count += 1
    print("-"*101)


def iam_roles():
    cmd = "aws iam list-roles --query Roles[*].RoleName"
    roles = json.loads(sb.getoutput(cmd))

    print("\t\t\t\tIAM ROLES")
    count = 1
    for role in roles:
        print(str(count) + ". " + role)
        count += 1

def eks_clusters(region):
    cmd = "aws eks list-clusters --query clusters --region="+region
    clusters = json.loads(sb.getoutput(cmd))
    print("\t\t\t\tEKS CLUSTERS (", region, ")")
    if clusters == []:
        print("No Clusters Found...!")
        return
    
    count = 1
    for cluster in clusters:
        print(str(count) + ". " + cluster)
        count += 1


regions = ["us-east-1","eu-west-2","ap-south-1"]

for region in regions:
    vpc_peering(region)
    print()

print()

iam_roles()
print()

for region in regions:
    eks_clusters(region)
    print()

    