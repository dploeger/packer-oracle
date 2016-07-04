# Introduction

These are the templates for various publicly available Vagrant boxes 
providing an Oracle database.

The template oracle.json currently has these builders available:

* VirtualBox provider:
    * [oracle-XE-11.2-x86_64](https://atlas.hashicorp.com/dploeger/boxes/oracle-XE-11.2-x86_64): Oracle XE 11.2 on 64 bit Cent OS 7
  
The definitions are based on the works of https://github.com/stlhrt/vagrant-boxes and 
converted to Packer.

# Building

To build the boxes, install [packer](https://packer.io) and
 run from the base path:
  
    packer build oracle.json

This will build the boxes and generate Vagrant boxes in the current directory.

To build only a specific box, you can use the "-only"-flag:

    packer build -only=oracle-XE-11.2-x86_64 oracle.json 
