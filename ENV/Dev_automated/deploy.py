import json # for loading the json data into python dictionary
import os # for running shell commands

# this function parses the json data 
# returns the content as string which needs to be written in
# terraform.tfvars file
def parse_data(server, data):
    vars = """
aws_region = "{region}"
availability_zone = ["{region}a", "{region}b"]
cluster_name = "{cluster_name}"
webserver = "{webserver}"
image_name = "{image_name}"
""".format(
        region = data[server]['region'],
        webserver = server,
        image_name = data[server]['image'],
        cluster_name = data[server]['cluster_name']
    ) 
    # there are generally minimum two availability zones and aws 
    # follows common format like ap-south-1a, ap-south-1b, etc. 
    # that's why I just hardcoded them and used the max of 
    # two AZs to deploy EC2 instances as worker nodes of EKS master 

    # formatting siblings list in terraform supported list syntax
    # in terraform we have to put the elements of list in double quotes i.e. ["jane"]
    siblings = "siblings = ["
    
    for sib in data[server]['siblings']:
        siblings += '"{}",'.format(sib) 
    
    siblings = siblings.rstrip(",") + "]" # Strip the last extra comma

    vars += siblings # The whole content of the file
    
    return vars

# This function creates a directory for storing the state file (terraform.tfstate)
# for each region and runs the terraform init and terraform apply as shell
def deploy_infra(server, data):
    os.system("mkdir -p " + data[server]['region'])
    os.system("terraform init")
    os.system("terraform apply -auto-approve -state=./{region}/terraform.tfstate".format(region=data[server]['region']))

# The main function reads the json file and converts into the python dictionary
# the parses the data and then run the script for each region.
def main():
    # Loading the json file to dictionary 'data'
    with open('webservers.json') as f:
      data = json.load(f)

    # iterating over all the servers and deploying the infra
    for server in data:
        vars = parse_data(server, data) # parsing the data 
    
        # writing in the terraform.tfvars file
        with open("terraform.tfvars", "w") as f:
            f.write(vars)

        # Deploy the infra
        deploy_infra(server, data)

if __name__ == "__main__":
    main()