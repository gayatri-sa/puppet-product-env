node 'puppetnode2', 'puppetnode1' {
 include motd
 include testmodule
}

#node 'puppetnode1' {
 #include motd
 #class { 'sampleclass': filecontent => 'I am an external line' }
 #class { 'sampleclass': }
#}
node 'puppet' {
 $siteppvariable = "SitePP value"
 include motd
 include sampleclass
 include testtemplate::newclass
 include testtemplate
}
