VERSION := $(shell date '+%-y.%-m.%-d')
GITFLAGS := -c core.editor="gedit -s" -c core.quotepath="off"
GITFLAGS += -c user.name="Alexey Vaskovsky"
GITFLAGS += -c user.email="alexey@vaskovsky.net"
all:
	#OK make $@ $(notdir $(CURDIR))#$(VERSION)
dist: .git/refs/tags/v$(VERSION)
	#OK make $@ $(notdir $(CURDIR))#$(VERSION)
.git/refs/tags/v$(VERSION): all
	@sed -i -e 's/"version": "[^"]*"/"version": "$(VERSION)"/' package.json
	@git add -A
	@git $(GITFLAGS) commit -e -m "v$(VERSION)"
	@git $(GITFLAGS) tag "v$(VERSION)"
	@git push origin master --tags
	@npm publish
################################################################################

