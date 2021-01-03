#  Configuracion espacio de trabajo
setwd("C:/Users/Alumno/Desktop/Trabajo_BigData")

#instalarndo Rvest
# install.packages("rvest")
# install.packages("gdata")

library(rvest)
library(gdata)


# DESCARGANDO PAGINA ZMART (JUEGOS PS4)
zmartPs4 <- read_html("https://www.zmart.cl/JuegosPS4")

# LISTADO DE PRODUCTOS PS4
listadoPs4 <- html_nodes(zmartPs4, css = "#ProdDisplayType5_32641_Products")

# TITULOS DE LOS PRODUCTOS PS4
titulosPs4 <- html_nodes(listadoPs4, ".BoxProductoS2_Descripcion")
textoTitulosPs4 <- html_text(titulosPs4)

for (n in 1:length(textoTitulosPs4)) {
  print(textoTitulosPs4[n])
}


# PRECIOS DE LOS PRODUCTOS PS4
preciosPs4 <- html_nodes(listadoPs4, ".BoxProductoS2_Precio")
textoPreciosPs4 <- html_text(preciosPs4)

for (k in 1:length(textoPreciosPs4)) {
  print(textoPreciosPs4[k])
}

# [ALMACENANDO INFORMACION 1] CREACION DE UN DATAFRAME DE PS4

todosLosDatosPs4 <- data.frame()


for (i in 1:length(textoTitulosPs4)) {
  print("========== ITEM ==========")
  
  # nombre del juego:
  print(textoTitulosPs4[i])
  
  # precio:
  textoPreciosPs4 <- gsub("[.]","",textoPreciosPs4)
  textoPreciosPs4 <- as.numeric(textoPreciosPs4)
  print(textoPreciosPs4[i])
  
  # [ALMACENANDO INFORMACION 2] CREANDO DATAFRAME CON LOS DETALLES
  # DE CADA ITEM
  
  itemPs4 <- data.frame(titulosPs4 = textoTitulosPs4,
                        preciosPs4 = textoPreciosPs4,
                        plataforma = "PlayStation 4")
  
  # [ALMACENANDO INFORMACION 3] ALMACENANDO LA INFO DEL PRODUCTO CON 
  # LOS DATOS TOTALES
  
  todosLosDatosPs4 <- rbind(todosLosDatosPs4,itemPs4)
  break = 32
}




############################################################################



# DESCARGANDO PAGINA ZMART (JUEGOS XBOX ONE)
zmartXbox <- read_html("https://www.zmart.cl/JuegosXBONE")

# LISTADO DE PRODUCTOS XBOX ONE
listadoXbox <- html_nodes(zmartXbox, css = "#ProdDisplayType5_32654_Products")

# TITULOS DE LOS PRODUCTOS XBOX ONE
tituloDelJuego <- html_nodes(listadoXbox, ".BoxProductoS2_Descripcion")
textoTitulosXbox <- html_text(tituloDelJuego)

for (x in 1:length(textoTitulosXbox)) {
  print(textoTitulosXbox[x])
}



# PRECIOS DE LOS PRODUCTOS XBOX ONE
precioDelJuego <- html_nodes(listadoXbox, ".BoxProductoS2_Precio")
textoPreciosXbox <- html_text(precioDelJuego)

for (o in 1:length(textoPreciosXbox)) {
  print(textoPreciosXbox[o])
}



# [ALMACENANDO INFORMACION 1] CREACION DE UN DATAFRAME DE XBOX ONE

todosLosDatosXbox <- data.frame()


for (u in 1:length(textoTitulosXbox)) {
  print("========== ITEM ==========")
  
  # nombre del juego:
  print(textoTitulosXbox[u])
  
  # precio:
  textoPreciosXbox <- gsub("[.]","",textoPreciosXbox)
  textoPreciosXbox <- as.numeric(textoPreciosXbox)
  print(textoPreciosXbox[o])
  

  # [ALMACENANDO INFORMACION 2] CREANDO DATAFRAME CON LOS DETALLES
  # DE CADA ITEM
  
  itemXbox <- data.frame(tituloDelJuego = textoTitulosXbox, 
                         precioDelJuego = textoPreciosXbox,
                         plataforma = "XBOX ONE")
  
  # [ALMACENANDO INFORMACION 3] ALMACENANDO LA INFO DEL PRODUCTO CON 
  # LOS DATOS TOTALES
  
  todosLosDatosXbox <- rbind(todosLosDatosXbox,itemXbox)
  break = 32
  
}



#install.packages("xlsx")
library(xlsx)

# PASAR DATOS DE "R" A "EXCEL"
write.xlsx(todosLosDatosPs4, "todosLosDatosPs4 en xls_1.xlsx")
write.xlsx(todosLosDatosXbox, "todosLosDatosXbox en xls_1.xlsx")

############################################################################

# Trabajo_BigData_TiendaParis

# Configuracion espacio de trabajo#
setwd("C:/Users/samon/Desktop/universidad/2020/Segundo semestre/Big data/trabajofinal_bigdata")


#instalarndo Rvest
install.packages("rvest")
install.packages("gdata")

# importar las librerias
library(rvest)
library(gdata)

# DESCARGANDO PAGINA TIENDA PARIS (JUEGOS PS4)
paris <- read_html("https://www.paris.cl/tecnologia/consolas-videojuegos/juegos/juegos-ps4/playstation/")

# LISTADO DE PRODUCTOS PS4
listadoJuegosParis <- html_node(paris, css = "#primary")

# TITULOS DE LOS PRODUCTOS PS4
titulosParis <- html_nodes(listadoJuegosParis, ".ellipsis_text")
textoTitulosParis <- html_text(titulosParis)

for (n in 1:length(textoTitulosParis)) {
  print(textoTitulosParis[n])
}

# PRECIOS DE LOS PRODUCTOS PS4
preciosParis <- html_nodes(listadoJuegosParis, ".price-tc")
textoPreciosParis <- html_text(preciosParis)

for (k in 1:length(textoPreciosParis)) {
  print(textoPreciosParis[k])
}


# [ALMACENANDO INFORMACION 1] CREACION DE UN DATAFRAME DE PS4
todosLosDatosParis <- data.frame()

for (i in 1:length(textoTitulosParis)) {
  print("========== ITEM ==========")
  
  # nombre del juego:
  print(textoTitulosParis[i])
  
  # precio:
  textoPreciosParis <- gsub("[.]","",textoPreciosParis)
  textoPreciosParis <- as.character(textoPreciosParis)
  print(textoPreciosParis[i])
  
  # [ALMACENANDO INFORMACION 2] CREANDO DATAFRAME CON LOS DETALLES
  # DE CADA ITEM
  
  itemParis <- data.frame(titulosParis = textoTitulosParis,
                        preciosParis = textoPreciosParis,
                        plataforma = "PlayStation 4")
  
  # [ALMACENANDO INFORMACION 3] ALMACENANDO LA INFO DEL PRODUCTO CON 
  # LOS DATOS TOTALES
  
  todosLosDatosParis <- rbind(todosLosDatosParis,itemParis)
  break = 40
}


# DESCARGANDO PAGINA TIENDA PARIS (JUEGOS XBOX ONE)
parisxbox <- read_html("https://www.paris.cl/tecnologia/consolas-videojuegos/juegos/xbox/")

# LISTADO DE PRODUCTOS XBOX ONE
listadoJuegosParisxbox <- html_node(parisxbox, css = "#search-result-items")

# TITULOS DE LOS PRODUCTOS XBOX ONE
titulosParisxbox <- html_nodes(listadoJuegosParisxbox, ".name-product-plp")
textoTitulosParisxbox <- html_text(titulosParisxbox)

for (n in 1:length(textoTitulosParisxbox)) {
  print(textoTitulosParisxbox[n])
}

# PRECIOS DE LOS PRODUCTOS XBOX ONE
preciosParisxbox <- html_nodes(listadoJuegosParisxbox, ".default-price")
textoPreciosParisxbox <- html_text(preciosParisxbox)

for (k in 1:length(textoPreciosParisxbox)) {
  print(textoPreciosParisxbox[k])
}

# [ALMACENANDO INFORMACION 1] CREACION DE UN DATAFRAME DE XBOX ONE
todosLosDatosParisxbox <- data.frame()

for (u in 1:length(textoTitulosParisxbox)) {
  print("========== ITEM ==========")
  
  # nombre del juego:
  print(textoTitulosParisxbox[u])
  
  # precio:
  textoPreciosParisxbox <- gsub("[.]","",textoPreciosParisxbox)
  textoPreciosParisxbox <- as.character(textoPreciosParisxbox)
  print(textoPreciosParisxbox[u])
  
  # [ALMACENANDO INFORMACION 2] CREANDO DATAFRAME CON LOS DETALLES
  # DE CADA ITEM
  
  itemParisxbox <- data.frame(titulosParisxbox = textoTitulosParisxbox, 
                         precioParisxbox= textoPreciosParisxbox,
                         plataforma = "XBOX ONE")
  
  # [ALMACENANDO INFORMACION 3] ALMACENANDO LA INFO DEL PRODUCTO CON 
  # LOS DATOS TOTALES
  
  todosLosDatosParisxbox <- rbind(todosLosDatosParisxbox,itemParisxbox)
  break = 15
  
}
