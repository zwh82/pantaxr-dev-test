
import sys, subprocess
from pathlib import Path
import tempfile

wd = sys.argv[1]
pan_species_file = sys.argv[2]
species = sys.argv[3]
threads = sys.argv[4]

with open(pan_species_file, "r") as f:
    genomes = [line.strip() for line in f]

Path(f"{wd}/{species}").mkdir(exist_ok=True)
cmd = []
cmd_tmp_list = []
new_genomes_path = []
for genome in genomes:
    genome_name = Path(genome).name
    genome_name = "_".join(genome_name.split("_")[:2])
    if genome.endswith("gz"):
        gunzip_genome_name = Path(genome).name.replace(".gz", "")
        cmd_tmp_list.append(f"gunzip -c {genome} > {wd}/{species}/{gunzip_genome_name}; fastix {wd}/{species}/{gunzip_genome_name} -p '{genome_name}#1#' > {wd}/{species}/{genome_name}.fa")
    else:
        cmd_tmp_list.append(f"fastix {genome} -p '{genome_name}#1#' > {wd}/{species}/{genome_name}.fa") 
    new_genomes_path.append(f"{wd}/{species}/{genome_name}.fa")
# cmd_tmp = "\n".join(cmd_tmp_list)
# cmd2 = f"echo '{cmd_tmp}' | xargs -I{{}} -P {threads} bash -c '{{}}'"
with tempfile.NamedTemporaryFile("w", suffix=".sh", delete=False) as script_file:
    for line in cmd_tmp_list:
        script_file.write(line + "\n")
    script_path = script_file.name
    cmd2 = f"cat {script_path} | xargs -I{{}} -P {threads} bash -c '{{}}'"
    cmd.append(cmd2)
all_new_genomes_path = " ".join(new_genomes_path)
cmd3 = f"cat {all_new_genomes_path} | bgzip -c -@ {threads} > {wd}/{species}/{species}_merged.fa.gz"
cmd.append(cmd3)
cmd4 = f"samtools faidx {wd}/{species}/{species}_merged.fa.gz"
cmd.append(cmd4)
subprocess.run("; ".join(cmd), shell=True, check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
