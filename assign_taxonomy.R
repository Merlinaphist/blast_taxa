library("taxonomizr")
library(dplyr)
setwd("~/Desktop/Projects/Biogeochemistry/Nitrogen-fixing/Genomic_Analysis/Taxonomy_Database")
prepareDatabase('accessionTaxa.sql')
blast_stats = read.csv('/Users/miaojiazheng/Desktop/Projects/Biogeochemistry/blast_pipeline/divided_blast_results.csv')
taxid = blast_stats$taxid
taxa_ncbi = getTaxonomy(taxid,'accessionTaxa.sql')
taxa_ncbi = cbind(blast_stats[,1:3],data.frame(taxa_ncbi))
row.names(taxa_ncbi) = seq(1,nrow(taxa_ncbi))
taxa_ncbi = taxa_ncbi%>%
  filter(substring(species,1,10)!="uncultured"&substring(species,1,12)!="unidentified")
taxa_ncbi = Reduce(rbind,by(taxa_ncbi,taxa_ncbi["Feat.ID"],head,n = 3))
write.csv(taxa_ncbi,'/Users/miaojiazheng/Desktop/Projects/Biogeochemistry/blast_pipeline/blast_taxonomy.csv',row.names = F)