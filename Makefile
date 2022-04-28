## Dependency versions

HELMVERSION:= v0.10.0 
HELMREPO :=  https://mirror.ghproxy.com/https://github.com/carina-io/charts/releases/download
helmpackage:
	@for var in $(HELMVERSION); do \
		helm lint $$var/carina-csi-driver && helm package $$var/carina-csi-driver --debug --destination $$var/; \
	done
		helm repo index --url=$(HELMREPO)   . \

clear:		
	@for var in $(HELMVERSION); do \
		rm -rf  $$var/*.tgz ; \
	done		