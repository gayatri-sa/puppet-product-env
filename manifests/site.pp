node 'puppetnode2', 'puppetnode1' {
 include motd

 #include sampleclass
 class { 'sampleclass': filecontent => 'I am an external line - PRODUCTION' }

 $siteppvariable = "SitePP value"
 include testtemplate::newclass
 include testtemplate
}

#node 'puppetnode1' {
 #include motd
 #class { 'sampleclass': filecontent => 'I am an external line' }
 #class { 'sampleclass': }
#}
node 'puppet' {
 include motd
}
