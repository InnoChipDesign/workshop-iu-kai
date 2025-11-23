.PHONY: help simulate sim-clean sim-build sim-run quartus synth upload

help: ## Show common targets of the Makefile
	@echo "Usage:"
	@awk 'BEGIN {FS=":.*## "; OFS="";} \
	     /^[a-zA-Z0-9_.-]+:.*## / {printf "  \033[36m%-18s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)


# ------------------------------------------------------------------------------
# Simulation
# ------------------------------------------------------------------------------

simulate: sim-clean sim-build sim-run ## Run simulation flow

# sim-clean:
# 	rm -rf ./sim/verilator/output_files/

# sim-build: rtl/common_top.sv
# 	verilator ${VFLAGS} -Irtl -Iinclude/basics-graphics-music/labs/common -cc $< --exe sim/verilator/simulate.cpp -o common_top.out \
# 		-CFLAGS "${SDL_CFLAGS}" -LDFLAGS "${SDL_LDFLAGS}" --Mdir sim/verilator/output_files \
# 		--timescale 1ns/1ps -Wno-fatal # -Wno-MULTIDRIVEN -Wno-LATCH
# 	make -C ./sim/verilator/output_files -f Vcommon_top.mk

# sim-run:
# 	./sim/verilator/output_files/common_top.out


# ------------------------------------------------------------------------------
# Synthesis
# ------------------------------------------------------------------------------

CABLE_NAME   ?= "USB-Blaster"
PROJECT_DIR  ?= ./fpga_project
PROJECT_NAME ?= "fpga_project"

QUARTUS     := cd $(PROJECT_DIR) && quartus
QUARTUS_SH  := cd $(PROJECT_DIR) && quartus_sh
QUARTUS_PGM := cd $(PROJECT_DIR) && quartus_pgm

# when we run quartus bins from WSL it can be installed on host W10
# it this case we have to add .exe to the executed binary name
ifdef WSL_DISTRO_NAME
 ifeq (, $(shell which $(QUARTUS)))
  QUARTUS     := $(QUARTUS).exe
  QUARTUS_SH  := $(QUARTUS_SH).exe
  QUARTUS_PGM := $(QUARTUS_PGM).exe
 endif
endif

# make open
#  cd project && quartus <projectname> &
#     cd project            - go to project folder 
#	  &&                    - if previous command was successfull
#     quartus <projectname> - open <projectname> in quartus 
#     &                     - run previous command in shell background
quartus: ## Open Quartus Prime with current project
	$(QUARTUS) $(PROJECT_NAME) &

# make build
#  cd project && quartus_sh --flow compile <projectname>
#     cd project                              - go to project folder 
#     &&                                      - if previous command was successfull
#     quartus_sh --flow compile <projectname> - run quartus shell & perform basic compilation 
#                                               of <projectname> project
synth: ## Run synthesis with Quartus
	$(QUARTUS_SH) --no_banner --flow compile $(PROJECT_NAME)
	cat "$(PROJECT_DIR)/output_files/$(PROJECT_NAME).fit.summary"
	make upload

# make load
#  cd project && quartus_pgm -c "USB-Blaster" -m JTAG -o "p;<projectname>.sof"
#     cd project               - go to project folder 
#	  &&                       - if previous command was successfull
#     quartus_pgm              - launch quartus programmer
#     -c "USB-Blaster"         - connect to "USB-Blaster" cable
#     -m JTAG                  - in JTAG programming mode
#     -o "p;<projectname>.sof" - program (configure) FPGA with <projectname>.sof file
upload: ## Upload output file to the FPGA (to program it)
	$(QUARTUS_PGM) --no_banner -c $(CABLE_NAME) -m JTAG -o "p;output_files/$(PROJECT_NAME).sof"


# ------------------------------------------------------------------------------
# Synthesis with Yosys
# ------------------------------------------------------------------------------

# synth-yosys: sky130_fd_sc_hd__tt_025C_1v80.lib
# 	yosys -s ./synth/yosys/synth.ys

# ------------------------------------------------------------------------------
# Synthesis with LibreLane
# ------------------------------------------------------------------------------

# libralane-install:
# 	uv add librelane

# librelane-get-pdk:
# 	download pdk

# synth-librelane: sky130_fd_sc_hd__tt_025C_1v80.lib
# 	uv run librelane --pdk-root $HOME/.ciel ./designs/spm/config.json
