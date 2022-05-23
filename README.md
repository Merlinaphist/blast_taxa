# blast_pipeline
This pipeline generates a phylogenetic taxonomy from NCBI database through BLASTN algorithm.

To execute this pipeline:
  1. install Python, R, and BLAST+ plugin
  2. Add your FASTA file to the same folder with these scripts. Rename the file as "input.fasta".
  3. Open your terminal. Change directory to the folder. Enter `bash blast.bash`.

Mechanism:
  This pipeline first uploads 10 sequences per time to NCBI serve and receives BLASTN return values (which is taxonomic ID) by BLAST+.
  Then use a python script to change the return file's format.
  Finally use a R script to convert taxonomic ID to a phylogenetic taxonomy.
  
Note:
  By default, this pipeline will download taxonomic ID database from NCBI to your local device. Please make sure your environment have more than 70GB storage.
