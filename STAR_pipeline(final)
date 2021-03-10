mkdir 01.Fastqc

fastqc -o 01.Fastqc/ \
00.Rawdata/20200925_RNA_MDS_HA/${sample}_R1_001.fastq.gz \
00.Rawdata/20200925_RNA_MDS_HA/${sample}_R2_001.fastq.gz 

mkdir 02-1.Cleandata
mkdir 02-2.Unpaired

sickle pe -f 00.Rawdata/20200925_RNA_MDS_HA/${sample}_R1_001.fastq.gz -r 00.Rawdata/20200925_RNA_MDS_HA/${sample}_R2_001.fastq.gz \
-t sanger \
-o 02-1.Cleandata/${sample}_R1_001.trimmed.fastq.gz -p 02-1.Cleandata/${sample}_R2_001.trimmed.fastq.gz \
-s 02-2.Unpaired/Unpaired_${sample}_001.fastq.gz -q 20 -l 20

mkdir 03.MakeIndex

STAR --runThreadN 20 --runMode genomeGenerate --genomeDir 03.MakeIndex/ \
 --genomeChrBinNbits 18 --sjdbGTFfile Bioresource/gencode.v36.annotation.gtf\
 --genomeFastaFiles Bioresource/hg38.fa

mkdir -p 04.Align/${sample}

#Check function of options 
STAR --runMode alignReads --runThreadN 20 --outFilterMultimapNmax 10 \
 --alignIntronMin 21 --alignIntronMax 0 --genomeDir 03.MakeIndex/ \
 --readFilesIn 02-1.Cleandata/${sample}_R1_001.trimmed.fastq.gz \
 --readFilesCommand zcat \
02-1.Cleandata/${sample}_R2_001.trimmed.fastq.gz --outSAMtype \
BAM SortedByCoordinate --outFileNamePrefix 04.Align/${sample}/${sample}_

mkdir 05.htseq_count

htseq-count -r pos -s yes -m union -f bam 04.Align/${sample}/${sample}_Aligned.sortedByCoord.out.bam \
Bioresource/gencode.v36.annotation.gtf > 05.htseq_count/${sample}_htseq_count.txt

python htseq_annotation.py ${sample}
