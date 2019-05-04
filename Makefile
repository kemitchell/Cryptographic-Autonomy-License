BUILD=build
FORMATS=html pdf
TARGETS=$(addprefix $(BUILD)/, $(foreach format,$(FORMATS), $(addsuffix .$(format),license)))

all: $(TARGETS)

$(BUILD)/%.html: %.md | $(BUILD)
	npx commonmark --smart < $< > $@

$(BUILD)/%.pdf: %.md | $(BUILD)
	pandoc -f commonmark -o $@ $<

$(BUILD):
	mkdir $(BUILD)

.PHONY: clean

clean:
	rm -rf $(BUIlD)
