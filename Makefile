## Dependency versions

HELMVERSION:= v0.9.0 v0.9.1 latest
HELMREPO :=  https://raw.githubusercontent.com/carina-io/charts/main/charts
helmpackage:
	@for var in $(HELMVERSION); do \
		helm lint charts/$$var/carina-csi-driver && helm package charts/$$var/carina-csi-driver --debug --destination charts/$$var/; \
	done
		helm repo index --url=$(HELMREPO)   . 
		