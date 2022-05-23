export BLASTDB=$HOME/blastdb
name=input
total=$(wc -l ${name}.fasta)
total=(${total//${name}.fasta/})
for seqindex in $(seq 1 20 $total)
do
echo $seqindex/$total' in progress'
sed -n $seqindex,$(expr $seqindex + 19)'p' ${name}.fasta > tmp.fasta
blastn -db nr -query tmp.fasta -outfmt "6 qseqid pident evalue staxid" -max_target_seqs 50 -remote -out output.csv
cat output.csv >> blast_results.csv
echo $seqindex/$total' done' >> progress.txt
done

python divide_col.py

rm output.csv
rm tmp.fasta
rm progress.txt
# rm blast_results.csv

Rscript assign_taxonomy.R
# rm divided_blast_results.csv