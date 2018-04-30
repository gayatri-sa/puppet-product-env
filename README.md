# puppet-product-env
Puppet sample production environment

NOTES:
+ The scripts folder should be copied into the /etc/puppetlabs/code/ folder
+ The scripts folder has the sample ENC script. If you want to use ENC, add these to the /etc/puppetlabs/puppet/puppet.conf file
```
node_terminus = exec
external_nodes = /etc/puppetlabs/code/scripts/enc.sh
```
+ Remember to restart the puppet service after you make any puppet.conf changes:
```
service puppetserver restart
```

