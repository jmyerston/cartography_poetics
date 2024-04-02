## This is script to obtain the data for creating figures 1 and 2. 

# install the package
#remotes::install_gitlab("culturalcartography/text2map.pretrained")

library(tidyverse)
library(reshape2)
library(ggpubr)
library(text2vec)
library(text2map)
library(ggrepel)


# load the models
library(text2map.pretrained)

## download the fasttext embeddings. This embedding are used as a diacronic reference
## similar to our compass model than contain a long of data over time. 
## From these embedding the cultural dimensions are built.

download_pretrained("vecs_fasttext300_commoncrawl")

## download the histwords embeddings. These embeddings
## are similar to our historical embeddings. 
download_pretrained("vecs_sgns300_coha_histwords")

# Load them into the session
data("vecs_fasttext300_commoncrawl")
data("vecs_sgns300_coha_histwords")

# assign to new (shorter) object 
ft.wv <- vecs_fasttext300_commoncrawl
hi_wv <- vecs_sgns300_coha_histwords
# then remove the original
rm(vecs_fasttext300_commoncrawl)
rm(vecs_sgns300_coha_histwords)

df_anchors <- readRDS("data/anchor_lists.Rds")
#df_events <- read.csv("data/events.csv")

write_csv2(df_anchors,"anchors.csv")
