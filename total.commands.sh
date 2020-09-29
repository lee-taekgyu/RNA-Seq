
mkdir -p BioResource/Reference/
cp ../BioResource/Reference/Arabidopsis_thaliana.TAIR10.dna.toplevel.fa BioResource/Reference/
bowtie2-build  BioResource/Reference/Arabidopsis_thaliana.TAIR10.dna.toplevel.fa BioResource/Reference/Arabidopsis_thaliana.TAIR10.dna.toplevel.fa
samtools faidx BioResource/Reference/Arabidopsis_thaliana.TAIR10.dna.toplevel.fa

mkdir -p BioResource/GeneModel/
cp ../BioResource/GeneModel/Arabidopsis_thaliana.TAIR10.44.gtf BioResource/GeneModel/
cat BioResource/GeneModel/Arabidopsis_thaliana.TAIR10.44.gtf | grep -v "protein_coding" > BioResource/GeneModel/Arabidopsis_thaliana.TAIR10.44.mask.gtf

mkdir -p 00.Rawdata/con
cp ../BioResource/RawData/Root-Control-6h_1.fastq.gz 00.Rawdata/con
cp ../BioResource/RawData/Root-Control-6h_2.fastq.gz 00.Rawdata/con
cp ../BioResource/RawData/Root-Control-12h_1.fastq.gz 00.Rawdata/con
cp ../BioResource/RawData/Root-Control-12h_2.fastq.gz 00.Rawdata/con
cp ../BioResource/RawData/Root-Control-24h_1.fastq.gz 00.Rawdata/con
cp ../BioResource/RawData/Root-Control-24h_2.fastq.gz 00.Rawdata/con
mkdir -p 00.Rawdata/exp
cp ../BioResource/RawData/Root-PA01-6h_1.fastq.gz 00.Rawdata/exp
cp ../BioResource/RawData/Root-PA01-6h_2.fastq.gz 00.Rawdata/exp
cp ../BioResource/RawData/Root-PA01-12h_1.fastq.gz 00.Rawdata/exp
cp ../BioResource/RawData/Root-PA01-12h_2.fastq.gz 00.Rawdata/exp
cp ../BioResource/RawData/Root-PA01-24h_1.fastq.gz 00.Rawdata/exp
cp ../BioResource/RawData/Root-PA01-24h_2.fastq.gz 00.Rawdata/exp

fastqc -f fastq --extract -t 8 00.Rawdata/con/Root-Control-6h_1.fastq.gz
fastqc -f fastq --extract -t 8 00.Rawdata/con/Root-Control-6h_2.fastq.gz
fastqc -f fastq --extract -t 8 00.Rawdata/con/Root-Control-12h_1.fastq.gz
fastqc -f fastq --extract -t 8 00.Rawdata/con/Root-Control-12h_2.fastq.gz
fastqc -f fastq --extract -t 8 00.Rawdata/con/Root-Control-24h_1.fastq.gz
fastqc -f fastq --extract -t 8 00.Rawdata/con/Root-Control-24h_2.fastq.gz
fastqc -f fastq --extract -t 8 00.Rawdata/exp/Root-PA01-6h_1.fastq.gz
fastqc -f fastq --extract -t 8 00.Rawdata/exp/Root-PA01-6h_2.fastq.gz
fastqc -f fastq --extract -t 8 00.Rawdata/exp/Root-PA01-12h_1.fastq.gz
fastqc -f fastq --extract -t 8 00.Rawdata/exp/Root-PA01-12h_2.fastq.gz
fastqc -f fastq --extract -t 8 00.Rawdata/exp/Root-PA01-24h_1.fastq.gz
fastqc -f fastq --extract -t 8 00.Rawdata/exp/Root-PA01-24h_2.fastq.gz

mkdir -p 01.Clean/con
cutadapt -a AGATCGGAAGAGC -A AGATCGGAAGAGC -o 01.Clean/con/Root-Control-6h_1.nonadapt.fq.gz -p 01.Clean/con/Root-Control-6h_2.nonadapt.fq.gz 00.Rawdata/con/Root-Control-6h_1.fastq.gz 00.Rawdata/con/Root-Control-6h_2.fastq.gz
trimmomatic PE -threads 8 -summary 01.Clean/con/Root-Control-6h.trimmomatic.log 01.Clean/con/Root-Control-6h_1.nonadapt.fq.gz 01.Clean/con/Root-Control-6h_2.nonadapt.fq.gz 01.Clean/con/Root-Control-6h_R1.qt.P.fastq.gz 01.Clean/con/Root-Control-6h_R1.qt.U.fastq.gz 01.Clean/con/Root-Control-6h_R2.qt.P.fastq.gz 01.Clean/con/Root-Control-6h_R2.qt.U.fastq.gz SLIDINGWINDOW:4:15 MINLEN:36
cutadapt -a AGATCGGAAGAGC -A AGATCGGAAGAGC -o 01.Clean/con/Root-Control-12h_1.nonadapt.fq.gz -p 01.Clean/con/Root-Control-12h_2.nonadapt.fq.gz 00.Rawdata/con/Root-Control-12h_1.fastq.gz 00.Rawdata/con/Root-Control-12h_2.fastq.gz
trimmomatic PE -threads 8 -summary 01.Clean/con/Root-Control-12h.trimmomatic.log 01.Clean/con/Root-Control-12h_1.nonadapt.fq.gz 01.Clean/con/Root-Control-12h_2.nonadapt.fq.gz 01.Clean/con/Root-Control-12h_R1.qt.P.fastq.gz 01.Clean/con/Root-Control-12h_R1.qt.U.fastq.gz 01.Clean/con/Root-Control-12h_R2.qt.P.fastq.gz 01.Clean/con/Root-Control-12h_R2.qt.U.fastq.gz SLIDINGWINDOW:4:15 MINLEN:36
cutadapt -a AGATCGGAAGAGC -A AGATCGGAAGAGC -o 01.Clean/con/Root-Control-24h_1.nonadapt.fq.gz -p 01.Clean/con/Root-Control-24h_2.nonadapt.fq.gz 00.Rawdata/con/Root-Control-24h_1.fastq.gz 00.Rawdata/con/Root-Control-24h_2.fastq.gz
trimmomatic PE -threads 8 -summary 01.Clean/con/Root-Control-24h.trimmomatic.log 01.Clean/con/Root-Control-24h_1.nonadapt.fq.gz 01.Clean/con/Root-Control-24h_2.nonadapt.fq.gz 01.Clean/con/Root-Control-24h_R1.qt.P.fastq.gz 01.Clean/con/Root-Control-24h_R1.qt.U.fastq.gz 01.Clean/con/Root-Control-24h_R2.qt.P.fastq.gz 01.Clean/con/Root-Control-24h_R2.qt.U.fastq.gz SLIDINGWINDOW:4:15 MINLEN:36

mkdir -p 01.Clean/exp
cutadapt -a AGATCGGAAGAGC -A AGATCGGAAGAGC -o 01.Clean/exp/Root-PA01-6h_1.nonadapt.fq.gz -p 01.Clean/exp/Root-PA01-6h_2.nonadapt.fq.gz 00.Rawdata/exp/Root-PA01-6h_1.fastq.gz 00.Rawdata/exp/Root-PA01-6h_2.fastq.gz
trimmomatic PE -threads 8 -summary 01.Clean/exp/Root-PA01-6h.trimmomatic.log 01.Clean/exp/Root-PA01-6h_1.nonadapt.fq.gz 01.Clean/exp/Root-PA01-6h_2.nonadapt.fq.gz 01.Clean/exp/Root-PA01-6h_R1.qt.P.fastq.gz 01.Clean/exp/Root-PA01-6h_R1.qt.U.fastq.gz 01.Clean/exp/Root-PA01-6h_R2.qt.P.fastq.gz 01.Clean/exp/Root-PA01-6h_R2.qt.U.fastq.gz SLIDINGWINDOW:4:15 MINLEN:36
cutadapt -a AGATCGGAAGAGC -A AGATCGGAAGAGC -o 01.Clean/exp/Root-PA01-12h_1.nonadapt.fq.gz -p 01.Clean/exp/Root-PA01-12h_2.nonadapt.fq.gz 00.Rawdata/exp/Root-PA01-12h_1.fastq.gz 00.Rawdata/exp/Root-PA01-12h_2.fastq.gz
trimmomatic PE -threads 8 -summary 01.Clean/exp/Root-PA01-12h.trimmomatic.log 01.Clean/exp/Root-PA01-12h_1.nonadapt.fq.gz 01.Clean/exp/Root-PA01-12h_2.nonadapt.fq.gz 01.Clean/exp/Root-PA01-12h_R1.qt.P.fastq.gz 01.Clean/exp/Root-PA01-12h_R1.qt.U.fastq.gz 01.Clean/exp/Root-PA01-12h_R2.qt.P.fastq.gz 01.Clean/exp/Root-PA01-12h_R2.qt.U.fastq.gz SLIDINGWINDOW:4:15 MINLEN:36
cutadapt -a AGATCGGAAGAGC -A AGATCGGAAGAGC -o 01.Clean/exp/Root-PA01-24h_1.nonadapt.fq.gz -p 01.Clean/exp/Root-PA01-24h_2.nonadapt.fq.gz 00.Rawdata/exp/Root-PA01-24h_1.fastq.gz 00.Rawdata/exp/Root-PA01-24h_2.fastq.gz
trimmomatic PE -threads 8 -summary 01.Clean/exp/Root-PA01-24h.trimmomatic.log 01.Clean/exp/Root-PA01-24h_1.nonadapt.fq.gz 01.Clean/exp/Root-PA01-24h_2.nonadapt.fq.gz 01.Clean/exp/Root-PA01-24h_R1.qt.P.fastq.gz 01.Clean/exp/Root-PA01-24h_R1.qt.U.fastq.gz 01.Clean/exp/Root-PA01-24h_R2.qt.P.fastq.gz 01.Clean/exp/Root-PA01-24h_R2.qt.U.fastq.gz SLIDINGWINDOW:4:15 MINLEN:36

mkdir -p 02.Align/con
tophat -o 02.Align/con/Root-Control-6h -p 8 -r 250 --mate-std-dev 50 --library-type fr-unstranded -G BioResource/GeneModel/Arabidopsis_thaliana.TAIR10.44.gtf --rg-id control --rg-sample Root-Control-6h BioResource/Reference/Arabidopsis_thaliana.TAIR10.dna.toplevel.fa 01.Clean/con/Root-Control-6h_R1.qt.P.fastq.gz 01.Clean/con/Root-Control-6h_R2.qt.P.fastq.gz
tophat -o 02.Align/con/Root-Control-12h -p 8 -r 250 --mate-std-dev 50 --library-type fr-unstranded -G BioResource/GeneModel/Arabidopsis_thaliana.TAIR10.44.gtf --rg-id control --rg-sample Root-Control-12h BioResource/Reference/Arabidopsis_thaliana.TAIR10.dna.toplevel.fa 01.Clean/con/Root-Control-12h_R1.qt.P.fastq.gz 01.Clean/con/Root-Control-12h_R2.qt.P.fastq.gz
tophat -o 02.Align/con/Root-Control-24h -p 8 -r 250 --mate-std-dev 50 --library-type fr-unstranded -G BioResource/GeneModel/Arabidopsis_thaliana.TAIR10.44.gtf --rg-id control --rg-sample Root-Control-24h BioResource/Reference/Arabidopsis_thaliana.TAIR10.dna.toplevel.fa 01.Clean/con/Root-Control-24h_R1.qt.P.fastq.gz 01.Clean/con/Root-Control-24h_R2.qt.P.fastq.gz

mkdir -p 02.Align/exp
tophat -o 02.Align/exp/Root-PA01-6h -p 8 -r 250 --mate-std-dev 50 --library-type fr-unstranded -G BioResource/GeneModel/Arabidopsis_thaliana.TAIR10.44.gtf --rg-id experiment --rg-sample Root-PA01-6h BioResource/Reference/Arabidopsis_thaliana.TAIR10.dna.toplevel.fa 01.Clean/exp/Root-PA01-6h_R1.qt.P.fastq.gz 01.Clean/exp/Root-PA01-6h_R2.qt.P.fastq.gz
tophat -o 02.Align/exp/Root-PA01-12h -p 8 -r 250 --mate-std-dev 50 --library-type fr-unstranded -G BioResource/GeneModel/Arabidopsis_thaliana.TAIR10.44.gtf --rg-id experiment --rg-sample Root-PA01-12h BioResource/Reference/Arabidopsis_thaliana.TAIR10.dna.toplevel.fa 01.Clean/exp/Root-PA01-12h_R1.qt.P.fastq.gz 01.Clean/exp/Root-PA01-12h_R2.qt.P.fastq.gz
tophat -o 02.Align/exp/Root-PA01-24h -p 8 -r 250 --mate-std-dev 50 --library-type fr-unstranded -G BioResource/GeneModel/Arabidopsis_thaliana.TAIR10.44.gtf --rg-id experiment --rg-sample Root-PA01-24h BioResource/Reference/Arabidopsis_thaliana.TAIR10.dna.toplevel.fa 01.Clean/exp/Root-PA01-24h_R1.qt.P.fastq.gz 01.Clean/exp/Root-PA01-24h_R2.qt.P.fastq.gz

mkdir -p 03.Cufflinks/con
cufflinks -o 03.Cufflinks/con/Root-Control-6h -p 8 --library-type fr-unstranded -g BioResource/GeneModel/Arabidopsis_thaliana.TAIR10.44.gtf --mask-file BioResource/GeneModel/Arabidopsis_thaliana.TAIR10.44.mask.gtf --multi-read-correct --frag-bias-correct BioResource/Reference/Arabidopsis_thaliana.TAIR10.dna.toplevel.fa 02.Align/con/Root-Control-6h/accepted_hits.bam
cufflinks -o 03.Cufflinks/con/Root-Control-12h -p 8 --library-type fr-unstranded -g BioResource/GeneModel/Arabidopsis_thaliana.TAIR10.44.gtf --mask-file BioResource/GeneModel/Arabidopsis_thaliana.TAIR10.44.mask.gtf --multi-read-correct --frag-bias-correct BioResource/Reference/Arabidopsis_thaliana.TAIR10.dna.toplevel.fa 02.Align/con/Root-Control-12h/accepted_hits.bam
cufflinks -o 03.Cufflinks/con/Root-Control-24h -p 8 --library-type fr-unstranded -g BioResource/GeneModel/Arabidopsis_thaliana.TAIR10.44.gtf --mask-file BioResource/GeneModel/Arabidopsis_thaliana.TAIR10.44.mask.gtf --multi-read-correct --frag-bias-correct BioResource/Reference/Arabidopsis_thaliana.TAIR10.dna.toplevel.fa 02.Align/con/Root-Control-24h/accepted_hits.bam

mkdir -p 03.Cufflinks/exp
cufflinks -o 03.Cufflinks/exp/Root-PA01-6h -p 8 --library-type fr-unstranded -g BioResource/GeneModel/Arabidopsis_thaliana.TAIR10.44.gtf --mask-file BioResource/GeneModel/Arabidopsis_thaliana.TAIR10.44.mask.gtf --multi-read-correct --frag-bias-correct BioResource/Reference/Arabidopsis_thaliana.TAIR10.dna.toplevel.fa 02.Align/exp/Root-PA01-6h/accepted_hits.bam
cufflinks -o 03.Cufflinks/exp/Root-PA01-12h -p 8 --library-type fr-unstranded -g BioResource/GeneModel/Arabidopsis_thaliana.TAIR10.44.gtf --mask-file BioResource/GeneModel/Arabidopsis_thaliana.TAIR10.44.mask.gtf --multi-read-correct --frag-bias-correct BioResource/Reference/Arabidopsis_thaliana.TAIR10.dna.toplevel.fa 02.Align/exp/Root-PA01-12h/accepted_hits.bam
cufflinks -o 03.Cufflinks/exp/Root-PA01-24h -p 8 --library-type fr-unstranded -g BioResource/GeneModel/Arabidopsis_thaliana.TAIR10.44.gtf --mask-file BioResource/GeneModel/Arabidopsis_thaliana.TAIR10.44.mask.gtf --multi-read-correct --frag-bias-correct BioResource/Reference/Arabidopsis_thaliana.TAIR10.dna.toplevel.fa 02.Align/exp/Root-PA01-24h/accepted_hits.bam

mkdir 04.Cuffmerge
find 03.Cufflinks/ -iname transcripts.gtf > 04.Cuffmerge/gtf_list.txt
cuffmerge -p 8 -g BioResource/GeneModel/Arabidopsis_thaliana.TAIR10.44.gtf -s BioResource/Reference/Arabidopsis_thaliana.TAIR10.dna.toplevel.fa -o 04.Cuffmerge 04.Cuffmerge/gtf_list.txt

mkdir -p 05.Cuffquant/con
cuffquant --output-dir 05.Cuffquant/con/Root-Control-6h --frag-bias-correct BioResource/Reference/Arabidopsis_thaliana.TAIR10.dna.toplevel.fa --multi-read-correct --num-threads 8 --library-type fr-unstranded 04.Cuffmerge/merged.gtf 02.Align/con/Root-Control-6h/accepted_hits.bam
cuffquant --output-dir 05.Cuffquant/con/Root-Control-12h --frag-bias-correct BioResource/Reference/Arabidopsis_thaliana.TAIR10.dna.toplevel.fa --multi-read-correct --num-threads 8 --library-type fr-unstranded 04.Cuffmerge/merged.gtf 02.Align/con/Root-Control-12h/accepted_hits.bam
cuffquant --output-dir 05.Cuffquant/con/Root-Control-24h --frag-bias-correct BioResource/Reference/Arabidopsis_thaliana.TAIR10.dna.toplevel.fa --multi-read-correct --num-threads 8 --library-type fr-unstranded 04.Cuffmerge/merged.gtf 02.Align/con/Root-Control-24h/accepted_hits.bam

mkdir -p 05.Cuffquant/exp
cuffquant --output-dir 05.Cuffquant/exp/Root-PA01-6h --frag-bias-correct BioResource/Reference/Arabidopsis_thaliana.TAIR10.dna.toplevel.fa --multi-read-correct --num-threads 8 --library-type fr-unstranded 04.Cuffmerge/merged.gtf 02.Align/exp/Root-PA01-6h/accepted_hits.bam
cuffquant --output-dir 05.Cuffquant/exp/Root-PA01-12h --frag-bias-correct BioResource/Reference/Arabidopsis_thaliana.TAIR10.dna.toplevel.fa --multi-read-correct --num-threads 8 --library-type fr-unstranded 04.Cuffmerge/merged.gtf 02.Align/exp/Root-PA01-12h/accepted_hits.bam
cuffquant --output-dir 05.Cuffquant/exp/Root-PA01-24h --frag-bias-correct BioResource/Reference/Arabidopsis_thaliana.TAIR10.dna.toplevel.fa --multi-read-correct --num-threads 8 --library-type fr-unstranded 04.Cuffmerge/merged.gtf 02.Align/exp/Root-PA01-24h/accepted_hits.bam

mkdir -p 06.Cuffnorm
cuffnorm --output-dir 06.Cuffnorm --labels Control,Experiment --num-threads 8 --library-type fr-unstranded --library-norm-method classic-fpkm --output-format simple-table 04.Cuffmerge/merged.gtf 05.Cuffquant/con/Root-Control-6h/abundances.cxb,05.Cuffquant/con/Root-Control-12h/abundances.cxb,05.Cuffquant/con/Root-Control-24h/abundances.cxb 05.Cuffquant/exp/Root-PA01-6h/abundances.cxb,05.Cuffquant/exp/Root-PA01-12h/abundances.cxb,05.Cuffquant/exp/Root-PA01-24h/abundances.cxb

mkdir -p 07.Cuffdiff
cuffdiff --output-dir 07.Cuffdiff --labels Control,Experiment --frag-bias-correct BioResource/Reference/Arabidopsis_thaliana.TAIR10.dna.toplevel.fa --multi-read-correct --num-threads 8 --library-type fr-unstranded --library-norm-method classic-fpkm --dispersion-method pooled 04.Cuffmerge/merged.gtf 05.Cuffquant/con/Root-Control-6h/abundances.cxb,05.Cuffquant/con/Root-Control-12h/abundances.cxb,05.Cuffquant/con/Root-Control-24h/abundances.cxb 05.Cuffquant/exp/Root-PA01-6h/abundances.cxb,05.Cuffquant/exp/Root-PA01-12h/abundances.cxb,05.Cuffquant/exp/Root-PA01-24h/abundances.cxb

mkdir 03.TCC
samtools sort -n 02.Align/con/Root-Control-12h/accepted_hits.bam -o 02.Align/con/Root-Control-12h/accepted_hits.nameSorted.bam
htseq-count -f bam -r name -s no -m union -o 02.Align/con/Root-Control-12h/accepted_hits.nameSorted.bam.SAMOUT 02.Align/con/Root-Control-12h/accepted_hits.nameSorted.bam BioResource/GeneModel/Arabidopsis_thaliana.TAIR10.44.gtf > 03.TCC/Root-Control-12h.count
samtools sort -n 02.Align/con/Root-Control-24h/accepted_hits.bam -o 02.Align/con/Root-Control-24h/accepted_hits.nameSorted.bam
htseq-count -f bam -r name -s no -m union -o 02.Align/con/Root-Control-24h/accepted_hits.nameSorted.bam.SAMOUT 02.Align/con/Root-Control-24h/accepted_hits.nameSorted.bam BioResource/GeneModel/Arabidopsis_thaliana.TAIR10.44.gtf > 03.TCC/Root-Control-24h.count
samtools sort -n 02.Align/con/Root-Control-6h/accepted_hits.bam -o 02.Align/con/Root-Control-6h/accepted_hits.nameSorted.bam
htseq-count -f bam -r name -s no -m union -o 02.Align/con/Root-Control-6h/accepted_hits.nameSorted.bam.SAMOUT 02.Align/con/Root-Control-6h/accepted_hits.nameSorted.bam BioResource/GeneModel/Arabidopsis_thaliana.TAIR10.44.gtf > 03.TCC/Root-Control-6h.count
samtools sort -n 02.Align/exp/Root-PA01-12h/accepted_hits.bam -o 02.Align/exp/Root-PA01-12h/accepted_hits.nameSorted.bam
htseq-count -f bam -r name -s no -m union -o 02.Align/exp/Root-PA01-12h/accepted_hits.nameSorted.bam.SAMOUT 02.Align/exp/Root-PA01-12h/accepted_hits.nameSorted.bam BioResource/GeneModel/Arabidopsis_thaliana.TAIR10.44.gtf > 03.TCC/Root-PA01-12h.count
samtools sort -n 02.Align/exp/Root-PA01-24h/accepted_hits.bam -o 02.Align/exp/Root-PA01-24h/accepted_hits.nameSorted.bam
htseq-count -f bam -r name -s no -m union -o 02.Align/exp/Root-PA01-24h/accepted_hits.nameSorted.bam.SAMOUT 02.Align/exp/Root-PA01-24h/accepted_hits.nameSorted.bam BioResource/GeneModel/Arabidopsis_thaliana.TAIR10.44.gtf > 03.TCC/Root-PA01-24h.count
samtools sort -n 02.Align/exp/Root-PA01-6h/accepted_hits.bam -o 02.Align/exp/Root-PA01-6h/accepted_hits.nameSorted.bam
htseq-count -f bam -r name -s no -m union -o 02.Align/exp/Root-PA01-6h/accepted_hits.nameSorted.bam.SAMOUT 02.Align/exp/Root-PA01-6h/accepted_hits.nameSorted.bam BioResource/GeneModel/Arabidopsis_thaliana.TAIR10.44.gtf > 03.TCC/Root-PA01-6h.count


