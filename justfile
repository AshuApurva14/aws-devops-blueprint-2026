
default:
    @just --list

python:
    #!/usr/bin/env python3
    print('Hello from python!')


terraform-up:
   chmod +x dev/tools/terraform_up.sh &&  dev/tools/terraform_up.sh

