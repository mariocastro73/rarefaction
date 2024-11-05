split_string <- function(input_string) {
  # Split the string based on the '/' character
  aux <- strsplit(input_string, "/")[[1]]
  
  # Extract the last element from the split string
  aux <- aux[length(aux)]
  
  return (strsplit(aux, "\\.")[[1]][1])
}
split_vector_of_strings <- function(input_vector) {
  return(as.vector(sapply(input_vector,split_string)))
}
