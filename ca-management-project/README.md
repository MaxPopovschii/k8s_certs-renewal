# CA Management Project

This project is designed to set up a 50-year-old root Certificate Authority (CA) and configure it for use across all environments. It includes the generation of specific user certificates with varying durations:

- **Admin Certificate**: Valid for **15 years**
- **QA Developer Certificate**: Valid for **15 years**
- **External Developer Certificate**: Valid for **2 years**

## Project Structure

The project is organized into the following directories:

- **ca/**: Contains the Certificate Authority configurations and scripts.
  - **root-ca/**: Contains files related to the root CA.
  - **intermediate-ca/**: Contains files related to the intermediate CA.
  - **user-certs/**: Contains scripts for generating user certificates.
  
- **scripts/**: Contains scripts for setting up the entire CA infrastructure.

- **config/**: Contains configuration files for different environments.

- **.gitignore**: Specifies files and directories to be ignored by version control.

## Setup Instructions

1. **Root CA Setup**: Follow the instructions in `ca/root-ca/README.md` to set up the root Certificate Authority.
2. **Intermediate CA Setup**: Follow the instructions in `ca/intermediate-ca/README.md` to set up the intermediate Certificate Authority.
3. **User Certificates**: Generate user certificates by following the instructions in the respective `README.md` files located in `ca/user-certs/admin/`, `ca/user-certs/qa-developer/`, and `ca/user-certs/external-developer/`.

## Usage Guidelines

- Ensure that all scripts are executed with the necessary permissions.
- Review the OpenSSL configuration files in the `ca/root-ca/` and `ca/intermediate-ca/` directories to customize settings as needed.
- Regularly back up your CA and user certificates to prevent data loss.

## Conclusion

This project provides a comprehensive framework for managing a Certificate Authority and generating user certificates with specified validity periods. Follow the documentation provided in each section for detailed instructions on setup and usage.