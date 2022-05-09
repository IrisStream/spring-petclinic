#!/usr/bin/python3

import xml.etree.ElementTree as ET

mytree = ET.parse('maven-metadata.xml')

myroot = mytree.getroot()

versioning = myroot.find("versioning").find("snapshot")

timestamp = versioning.find('timestamp').text

buildNumber = versioning.find('buildNumber').text

snapshot_version = f"{timestamp}-{buildNumber}"

name = f'spring-petclinic-2.6.0-{snapshot_version}'

print(name)
