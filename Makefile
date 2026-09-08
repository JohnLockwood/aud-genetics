# --------------------------------------------------------------
# Makefile
# Here is where we document where we got some or all of Our
# data from in ./data.
# --------------------------------------------------------------

output_dir := ./data/downloads

# Our first PGS file.  This could be broken out into a shell script perhaps.
PGSID := PGS005211
PGS_SCORING_DIR := "https://ftp.ebi.ac.uk/pub/databases/spot/pgs/scores/$(PGSID)/ScoringFiles/"
PGS_FILE := "$(PGS_SCORING_DIR)$(PGSID).txt.gz"
.PHONY: all showfilename

all:  $(output_dir)/$(PGSID).txt.gz

$(output_dir)/$(PGSID).txt.gz:
	@echo Making $@
	@mkdir -p $(output_dir)
	wget -O $@ $(PGS_FILE)

# Deprecated: was for debugging/showing the PGS file URL
showfilename:
	@echo $(PGS_SCORING_DIR)
	@echo $(PGS_FILE)

