

tool_name="pantax"
scripts_dir=/home/work/wenhai/metaprofiling/bacteria_refgenome_NCBIdata/scripts
data_type=1000
true_abund=/home/work/wenhai/simulate_genome_data/PanTax/prepare/1000strains/distribution.txt
database_genomes_info=/home/work/wenhai/metaprofiling/bacteria_refgenome_NCBIdata/alternative_methods/13404_strain_genomes_info.txt

python $scripts_dir/strain_evaluation.py strain_abundance.txt $tool_name $data_type $true_abund $database_genomes_info

pantax_db=/home/work/wenhai/PanTax/pantax_db
/home/work/wenhai/wh-github/PanTax/pantaxr/target/release/pantaxr profile -m short_gfa_mapped.gaf --filtered --db $pantax_db --species --strain --debug -t 64 --solver cbc
