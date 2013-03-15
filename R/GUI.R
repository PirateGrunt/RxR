AddBtnImportFile = function(container, txtOutput){
  
  btnImportFile = gfilebrowse(text = "Select a file ", quote = FALSE, type = "open", cont = container, filter = "*.csv", anchor = c(-1,0))
  addHandlerChanged(btnImportFile, handler = function(h, ...){
    svalue(txtOutput) = svalue(h$obj)    
  })
  
  return(btnImportFile)
}

AddBtnDescribeColumns = function(container, txtOutput){
  require(gWidgets)
  btnDescribeColumns = gbutton(text = "Describe columns", cont = container)
  
   addHandlerChanged(btnDescribeColumns, handler = function(h, ...){
     filename = svalue(txtOutput)
     if( filename == ""){
       svalue(txtOutput) = "File not found"
      } else {
       df = read.csv(filename, header = TRUE)
       svalue(txtOutput) = names(df)
      }
 })
 
  return (btnDescribeColumns)
}

Main = function(WhichToolkit = "RGtk2"){
  require(gWidgets)
  options(guiToolkit = WhichToolkit)
  
  window = gwindow("File search", visible = FALSE)
  
  paned = gpanedgroup(cont = window)
  
  group = ggroup(cont = paned, horizontal = FALSE)
  frmOutput = gframe("Output: ", cont=paned, horizontal = FALSE)
  
  txtOutput = gtext("", cont = frmOutput, expand = TRUE)
  
  size(txtOutput) = c(350, 200)
  
  AddBtnImportFile(group, txtOutput)
  
  AddBtnDescribeColumns(group, txtOutput)
  
  visible(window) = TRUE
}