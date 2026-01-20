# species and strain
/home/work/wenhai/wh-github/PanTax/pantaxr/target/release/pantaxr profile -m gfa_mapped.gaf -l species_genomes_stats.txt --filtered --db pantax_db --species --strain --debug

# specified species
/home/work/wenhai/wh-github/PanTax/pantaxr/target/release/pantaxr profile -m gfa_mapped.gaf -l species_genomes_stats.txt --filtered --db pantax_db --species --strain --debug --ds Myxococcus_xanthus

# only species
/home/work/wenhai/wh-github/PanTax/pantaxr/target/release/pantaxr profile -m gfa_mapped.gaf -l species_genomes_stats.txt --filtered --db pantax_db --species --debug

# species and then strain
/home/work/wenhai/wh-github/PanTax/pantaxr/target/release/pantaxr profile -m gfa_mapped.gaf -l species_genomes_stats.txt --filtered --db pantax_db --species --debug --binning_out reads_binning.tsv
/home/work/wenhai/wh-github/PanTax/pantaxr/target/release/pantaxr profile -m gfa_mapped.gaf --filtered --db pantax_db --strain --debug -b reads_binning.tsv

# sample_test
/home/work/wenhai/wh-github/PanTax/pantaxr/target/release/pantaxr profile -m gfa_mapped.gaf -l species_genomes_stats.txt --filtered --db pantax_db --species --strain --debug --sample_test


