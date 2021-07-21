#!/bin/bash
#Creating and deploying the Virtual Machine
az vm create az vm create --resource-group Minecraft --name MinecraftAzure --image UbuntuLTS --admin-username minecraftUser --authentication-type ssh --generate-ssh-keys --public-ip-sku Standard --size Standard_B2ms --storage-sku Standard_LRS --os-disk-name MineOSHDD --os-disk-size-gb 30 --os-disk-caching ReadWrite --data-disk-sizes-gb 32 --data-disk-caching ReadWrite

#Creating the NSG rule to open the 25565
az network nsg rule create --resource-group Minecraft --nsg-name MinecraftAzureNSG --name Port_25565 --protocol * --source-address-prefixes Internet --priority 1010 --source-port-ranges * --destination-address-prefixes * --destination-port-ranges 25565 --access Allow
