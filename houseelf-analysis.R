# To fix the hard work that was lost
data <- data.frame(read.csv('houseelf_earlength_dna_data_1.csv'))

#Libraries
library(stringr)

# --Pushing Changes--

gc_content <- function(dnaseq) {
  l <- str_to_lower(dnaseq)
  t <- str_length(l)
  g <- str_count(l, "g")
  c <- str_count(l, "c")
  gc <- round((g + c) / t * 100, 2)
  return(gc)}

gc_content(data$dnaseq)