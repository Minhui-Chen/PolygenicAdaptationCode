#!/usr/bin/env Rscript
#setwd("~/Documents/Academics/PolygenSel/CodeForRelease")
#source ( "~/Documents/Academics/PolygenSel/CodeForRelease/Scripts/CreateTraitFile.R")				
source ( "Scripts/functions.R")
#CreateTraitFile ( "Trait_Data/FilesForPaper/height.txt" , "Genome_Data/HapMapInHGDP_PositionsAndBValues")
#RemoveSNPs ( "Trait_Data/FilesForPaper/height.txt" , "Trait_Data/FilesForPaper/height.HapMapInHGDP_PositionsAndBValues.freqs" , "Trait_Data/FilesForPaper/newheight.txt" )	
#options ( error = recover)

Args <- commandArgs()
gwas.data.file <- Args[6]
freqs.file <- Args[7]
env.var.data.file <- Args[8]
match.pop.file <- Args[9]
full.dataset.file <- Args[10]
path <- Args[11]
frq_size <- as.numeric(Args[12])
rec_size <- as.numeric(Args[13])
bvalue_size <- as.numeric(Args[14])
PolygenicAdaptationFunction ( 
									gwas.data.file = gwas.data.file , 
									freqs.file = freqs.file , 
									env.var.data.files = list ( env.var.data.file
																) , # Note: you can supply as many env.var.data.files concurrently as you want. If only supplying one file it should still be included in a list, e.g. env.var.data.files = list ( "Example/EnvVar/HGDP_LATS_GLOBAL")
									match.pop.file = match.pop.file , 
									full.dataset.file = full.dataset.file , 
									path = path , 
									match.categories = c ( "MAF" , "Rec" , "bvalue" ) ,
									match.bins = list ( seq ( 0 , 0.5 , frq_size ), seq ( 0, 100 , rec_size ) , seq ( 0 , 1000 , bvalue_size ) ) , 
									cov.SNPs.per.cycle = 20000 , 
									cov.cycles = 1 , 
									null.phenos.per.cycle = 10000 , 
									null.cycles = 1 ,
									load.cov.mat = F ,
									sim.null = T ,
									check.allele.orientation = T
									)
