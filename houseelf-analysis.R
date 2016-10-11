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

print(gc_content(data$dnaseq))

# --Pushing and Pulling--

get_size_class <- function(ear_length){
  # Calculate the classification for multiple ear lengths
  ear_lengths <- ifelse(ear_length > 10, "large", "small")
  return(ear_lengths)
}


# ID, ear-class,and GC-content output as a Data frame
output_table <- data.frame(data$id, ear_size = NA, gc_content = NA)

for (i in 1:length(data$earlength)) {
  if (data$earlength[i] > 10) 
  {output_table$ear_size[i] <- "LARGE"
   } else {output_table$ear_size[i] <- "SMALL"}}


gc_content <- function(elf) {
  t <- str_length(elf)
  g <- str_count(elf, "g")
  c <- str_count(elf, "c")
  gc <- round((g + c) / t * 100, 2)}

for (i in 1:length(data$dnaseq)) {
  lower <- tolower(data$dnaseq)
  output_table$gc_content[i] <- gc_content(lower[i])}

print(output_table)

write.csv(output_table, file = "houseelf-analysis.csv")
