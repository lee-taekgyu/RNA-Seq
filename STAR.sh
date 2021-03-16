sample=$1


fastqc -o 01.Fastqc/ \
00.RawData/GR-${sample}_R1_001.fastq.gz \
00.RawData/GR-${sample}_R2_001.fastq.gz

sickle pe \
 -f 00.RawData/GR-${sample}_R1_001.fastq.gz -r 00.RawData/GR-${sample}_R2_001.fastq.gz\
 -t sanger\
 -o 02-1.Cleandata/GR-${sample}_R1_001.trimmed.fastq.gz -p 02-1.Cleandata/GR-${sample}_R2_001.trimmed.fastq.gz\
 -s 02-2.Unpaired/Unpaired_GR-${sample}_001.fastq.gz -q 20 -l 20

if [ ! -f 03.MakeIndex/Genome ]; then
		STAR --runThreadN 20 --runMode genomeGenerate --genomeDir 03.MakeIndex/ \
		 --sjdbGTFfile /home/pickyu2/Bioinformatics/Reference/GTF/hg38.refGene.gtf \
		 --genomeFastaFiles /home/pickyu2/Bioinformatics/Reference/Fasta/hg38.fa
else
		echo "Files are exist"
fi

mkdir -p 04.Align/GR-${sample}

STAR --runMode alignReads --quantMode GeneCounts --runThreadN 20 \
 --genomeDir 03.MakeIndex/ \
 --readFilesIn 02-1.Cleandata/GR-${sample}_R1_001.trimmed.fastq.gz \
 02-1.Cleandata/GR-${sample}_R2_001.trimmed.fastq.gz --outSAMtype BAM SortedByCoordinate --outFileNamePrefix 04.Align/GR-${sample}/GR-${sample}_
