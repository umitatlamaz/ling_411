function_definition <- function(name, description, arguments=NULL) {
  template <- '<div class="function">
`%s`

%s
%s
</div>
'
  if (length(arguments) == 0)
    arguments <- ""
  else
    arguments <- paste0("\n- `", names(arguments), "` ", arguments, collapse = "")
  sprintf(template, name, description, arguments)
  #cat(sprintf(template, name, description, arguments))
  #invisible(NULL)
}

function_definition_cat <- function(name, description, arguments=NULL) {
  cat(function_definition(name, description, arguments))
  invisible(NULL)
}

