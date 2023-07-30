export BLUESPECDIR=$(dirname $(which bsc))/../lib
export PATH=/tools/mod_spike/bin:$PATH

echo "[Suresh] Update BLUESPECDIR ------"
wget https://github.com/B-Lang-org/bsc/archive/refs/tags/2023.01.tar.gz
tar -xvzf 2023.01.tar.gz
mkdir -p $BLUESPECDIR/bin
cp bsc-2023.01/util/scripts/basicinout.pl $BLUESPECDIR/bin/basicinout
rm -rf 2023.01.tar.gz
rm -rf bsc-2023.01

echo "[Suresh] Shakti E-class core design files and simulation setup files ------"
git clone https://gitlab.com/shaktiproject/cores/e-class.git
cd e-class/
git checkout 1.10.2
git am ../patches/0001-added-rv32i-template.patch
cd base-sim
./manager.sh update_deps
make CONFIG=templates/rv32i.inc generate_verilog
make CONFIG=templates/rv32i.inc link_verilator
make generate_boot_files CONFIG=templates/rv32i.inc
cp bin/boot.* ../../riscv/
cp bin/out ../../riscv/riscv_buggy
