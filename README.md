# blast_pipeline
This pipeline generates a phylogenetic taxonomy from NCBI database through BLASTN algorithm.

To execute this pipeline:
  1. install Python, R, and BLAST+ plugin
  2. Add your FASTA file to the same folder with these scripts. Rename the file as "input.fasta".
  3. Open your terminal. `cd` to the folder. Enter `bash blast.bash`.

Mechanism:
  1. Upload 10 sequences per time to NCBI serve and receive BLASTN return values (which is taxonomic ID) by BLAST+.
  2. Call a python script to change the return file's format.
  3. Call a R script to convert taxonomic ID to a phylogenetic taxonomy.
  
Note:
  1. By default, this pipeline will download taxonomic ID database from NCBI to your local device. Please make sure your environment have more than 70GB storage.
  2. If your input.fasta contains more than 5,000 sequences, you will receive resource penalty from NCBI serve (slower processing). In this case, I suggest change your IP address every 5,000 sequences to avoid penalty. 
