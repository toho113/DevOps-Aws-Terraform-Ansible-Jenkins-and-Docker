# Configure the AWS Provider
# Authentication and Configuration
# Configuration for the AWS Provider can be derived from several sources, which are applied in the following order:

# Parameters in the provider configuration
# Environment variables  (Being used in this project)
# Shared credentials files
# Shared configuration files
# Container credentials
# Instance profile credentials and region
# This order matches the precedence used by the AWS CLI and the AWS SDKs.


provider "aws" {
    region = "us-west-2"
}
