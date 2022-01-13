## Dependency versions

HELMVERSION:= v0.9.0 v0.9.1 
HELMREPO :=  https://github.com/carina-io/charts/releases/download
helmpackage:
	@for var in $(HELMVERSION); do \
		helm lint $$var/carina-csi-driver && helm package $$var/carina-csi-driver --debug --destination $$var/; \
	done
		helm repo index --url=$(HELMREPO)   . \

clear:		
	@for var in $(HELMVERSION); do \
		rm -rf  $$var/*.tgz ; \
	done		