#FROM rocker/rstudio:4.1.1
FROM r-base:4.5.2

# system libraries of general use + R pkgs
RUN apt-get update && apt-get install -y \
	libxml2 \
	libxml2-dev \
	&& apt-get clean \
	&& rm -rf /tmp/* /var/lib/apt/lists/* && R -e "install.packages(c('devtools', 'wordcloud', 'RColorBrewer', 'tm', 'NLP', 'RCurl', 'medrxivr', 'aRxiv', 'xml2', 'XML', 'rvest', 'rentrez', 'dplyr'), repos='https://CRAN.R-project.org')" \
        && R -e "devtools::install_github(repo='haozhu233/kableExtra', ref='a6af5c0')"


#other attached packages:
# [1] wordcloud_2.6      RColorBrewer_1.1-3 SnowballC_0.7.1    tm_0.7-16         
# [5] NLP_0.3-2          RCurl_1.98-1.17    medrxivr_0.1.2     aRxiv_0.12        
# [9] xml2_1.3.8         XML_3.99-0.18      rvest_1.0.4        rentrez_1.2.4     
#[13] dplyr_1.1.4    
# devtools::install_github(repo="haozhu233/kableExtra", ref="a6af5c0")

#RUN install2.r  --error \
#	aRxiv \
#	medrxivr \
#	dplyr \
#	wordcloud \
#	RCurl \
#	rentrez \
#	rmarkdown \
#	SnowballC \
#	svglite \
#	tidyr \
#	tm \
#	devtools
#RUN R -e "update.packages()"
#RUN R -e "devtools::install_github('haozhu233/kableExtra')"

#EXPOSE 8787	
