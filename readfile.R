#' @export

readfile <- function(filepath, sheet = 1, skip = 0){
  if (stringr::str_sub(filepath,(stringr::str_length(filepath)-2),-1) == "csv"){
    read.csv(filepath)
  } else if (stringr::str_sub(filepath,(stringr::str_length(filepath)-2),-1) == "xls" ||
             stringr::str_sub(filepath,(stringr::str_length(filepath)-3),-1) == "xlsx") {
      readxl::read_excel(filepath, sheet = sheet, trim_ws = TRUE, skip = skip)
  } else if (stringr::str_sub(filepath,(stringr::str_length(filepath)-2),-1) == "dta"){
    haven::read_dta(filepath)
  } else if (stringr::str_sub(filepath,(stringr::str_length(filepath)-7),-1) == "sas7bdat"){
    haven::read_sas(filepath)
  }
}

# Import file function by SAM
# Can be used to import any file, except SPSS files.
# Who the FUCK uses SPSS anyaway?!
# Dependencies: "stringr", "readxl", "haven", "readr"
# "haven" used for importing SAS & STATA files
