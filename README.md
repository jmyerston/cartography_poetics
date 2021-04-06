# Reproduction Repository for "Cultural Cartography with Word Embeddings"

[Marshall A. Taylor](https://www.marshalltaylor.net) and [Dustin S. Stoltz](https://www.dustinstoltz.com)

This repository contains all R code and data necessary to reproduce the plots "[Cultural Cartography with Word Embeddings]()" forthcoming in *Poetics*.

# Data 

To reproduce the figures, you will need to two sets of pre-trained word embeddings: [English fastText embeddings](https://fasttext.cc/docs/en/crawl-vectors.html) and the [Historical Word2Vec](https://nlp.stanford.edu/projects/histwords/) embeddings trained on the Corpus of Historical American English. They are too large for Github, so we've hosted them on Google Drive:

- [ft.cc.en.300D.2M.Rds](https://drive.google.com/file/d/17H4GOGedeGo0urQdDC-4e5qWQMeWLpGG/view?usp=sharing)
- [w2v_coha_en_1810_2000.Rds](https://drive.google.com/file/d/1WYnZHZDQ3Vxi0gSKmXM0JF_bggKtcX98/view?usp=sharing)

```r
  # load fastText English word embeddings:
  ft.wv  <- readRDS("ft.cc.en.300D.2M.Rds")
  # load a list of word embeddings per decade from 1810 to 2000:
  hi.wv  <- readRDS("w2v_coha_en_1810_2000.Rds")
```

Next, we use roughly 200,000 news articles from the [All The News dataset](https://components.one/datasets/all-the-news-articles-dataset/) covering 2013-2018. We also convert the texts of the article into a Document-Term Matrix (for our preprocessing procedure see the paper).

```r
  news.data   <- readRDS("data/news_metadata.Rds")
  news.dtm.99 <- readRDS("data/dtm_99_news.Rds")
```

Finally, below are a few extra pieces of data: our anchor lists for building semantic directions and some event data for figure 5.

```r
  df.anchors <- readRDS("data/anchor_lists.Rds")
  df.events <- read.csv("data/events.csv")
```
# Packages 


We use the following packages:

```r
  library(tidyverse)
  library(reshape2)
  library(ggpubr)
  library(text2vec)
```
For some of the procedures, and for the ggplot aesthetics, we use packages we've been developing (i.e. not on CRAN yet). They will need to be installed from repositories:
```r
  devtools::install_github("dustinstoltz/CMDist")    
  devtools::install_gitlab("culturalcartography/text2map")

  library(CMDist)
  library(text2map)
  # loading text2map will change the colorscheme in ggplot
  # this will change the rest of the ggplot2 aesthetics
  text2map::set_theme()
```

# Figures 

Provided the above dataframes, matrices, and packages are loaded, the R scripts in the Scripts folder will reproduce figures 1-6 in the paper.




