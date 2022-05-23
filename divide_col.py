blast_stats = open('blast_results.csv','r')
stats = []
for line in blast_stats:
    stats.append(line.split('\n')[0].split('\t'))
blast_stats.close()
file_handle = open('divided_blast_results.csv','w')
file_handle.write('Feat.ID'+','+'pident'+','+'evalue'+','+'taxid'+'\n')
for line in stats:
    file_handle.write(line[0]+','+line[1]+','+line[2]+','+line[3]+'\n')
file_handle.close()