# AWS CLI
-  Cheatsheet https://gist.github.com/apolloclark/b3f60c1f68aa972d324b
## Install Amazon AWS CLI
```
pip install awscli
```

## Configuration
- Setup basic
```
$ aws configure
AWS Access Key ID [None]: AKIAIOSFODNN7EXAMPLE
AWS Secret Access Key [None]: wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
Default region name [None]: us-west-2
Default output format [None]: json
```
 - In case you have multiple profile:
```
$ aws configure --profile produser
AWS Access Key ID [None]: AKIAI44QH8DHBEXAMPLE
AWS Secret Access Key [None]: je7MtGbClwBF/2Zp9Utk/h3yCo8nvbEXAMPLEKEY
Default region name [None]: us-east-1
Default output format [None]: json
```

## Check ec2 instances

```
$ aws ec2 describe-instances
```

## Create keypair

```
$ aws ec2 create-key-pair --key-name cli_keypair > cli_keypair.pem
$ chmod 400 cli_keypair.pem
```

- Edit ```cli_keypair.pem``` to get rid of the text (including the spaces, ```\n```)

## Create a security group

```
$ aws ec2 describe-security-groups
$ aws ec2 create-security-group --group-name ec2-classic --description "My security group"
{
    "GroupId": "sg-0b13321a9a93bxxxx"
}
$ aws ec2 authorize-security-group-ingress --group-id sg-0b13321a9a93xxxx --protocol tcp --port 80 --cidr 0.0.0.0/0
```

## Fire up an EC2 instance
- Get image id: http://cloud-images-archive.ubuntu.com/releases/trusty/release-20141125/
```
$ aws ec2 run-instances \
    --image-id ami-958dd9a5 \
    --count 1 \
    --instance-type t1.micro \
    --key-name cli_keypair \
    --security-group-ids sg-0b13321a
```
## SSH

```
ssh ubuntu@ec2-54-88-130-120.compute-1.amazonaws.com -i ~/.ssh/cli_keypair.pem
```

## Get cost

```
$ aws ce get-cost-and-usage --time-period "Start=2019-01-01,End=2019-12-30" --granularity MONTHLY --metrics UsageQuantity BlendedCost AmortizedCost NetAmortizedCost NetUnblendedCost NormalizedUsageAmount UnblendedCost
```
