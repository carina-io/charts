## Dependency versions

HELMVERSION:= v0.9.0 v0.9.1 latest
HELMREPO :=  https://raw.githubusercontent.com/carina-io/charts/main
helmpackage:
	@for var in $(HELMVERSION); do \
		helm lint $$var/carina-csi-driver && helm package $$var/carina-csi-driver --debug --destination $$var/; \
	done
		helm repo index --url=$(HELMREPO)   . 
		