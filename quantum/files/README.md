# Add SSH public/private keypair in this directory

The Dockerfile will include ```id_rsa``` and ```id_rsa.pub``` during the build if they are located in this directory. If not, it will generate them and print the public key during the build.
