FILE='temaslounik'
TEMA_EXT='.tema'
DSL_EXT='.dsl'
DZ_EXT='.dz'
CONVERTER_BIN='./temaslounik'


all:
	@echo 'Пачатак.'
	@echo '--------'

	@echo 'Канвертаванне ў $(FILE)$(DSL_EXT)...'
	@$(CONVERTER_BIN)

	@echo 'Сцісканне ў $(FILE)$(DZ_EXT)...'
	@dictzip -k $(FILE)$(DSL_EXT)

	@echo 'Архіваванне...'
	@zip $(FILE).zip \
		$(FILE)$(TEMA_EXT) \
		$(FILE)$(DSL_EXT) \
		temaslounik \
		Makefile

	@echo 'Часопіс...'
	@echo `date +"%Y-%m-%d_%H-%M-%S" && $(CONVERTER_BIN) --version` >> log

	@echo '------'
	@echo 'Канец.'

logs:
	@echo `date +"%Y-%m-%d_%H-%M-%S" && $(CONVERTER_BIN) --version`

git-commit-update:
	git add . && git commit -m 'Update' 