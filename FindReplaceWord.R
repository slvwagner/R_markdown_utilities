# Loading Libraries
library(officer)
library(ggplot2)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Graphs ~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Sample data for the table
table_data <- data.frame(
  Name = c("Sartre", "Camus", "Kierkegaard"),
  Birth_Year = c(1905, 1913, 1813),
  Main_Works = c("Being and Nothingness", "The Stranger", "Fear and Trembling")
)
# Sample data for the plot
data <- data.frame(
  Philosopher = c("Sartre", "Camus", "Kierkegaard"),
  Influence_Score = c(9, 7, 6)
)
# Create a bar chart using ggplot2
plot <- data.frame(Philosopher = c("Sartre", "Camus", "Kierkegaard"),
                   Influence_Score = c(9, 7, 6))|>
    ggplot(aes(x = Philosopher, y = Influence_Score, fill = Philosopher)) +
  geom_bar(stat = "identity") +
  labs(title = "Influence of Existentialist Philosophers", y = "Influence Score") +
  theme_minimal()

####################################################################
c_filename <- "Doc1" # word document file name with no file extension 

####################################################################
# test 1
document <- read_docx(paste0("input/",c_filename,".docx"))
docx_summary(document)
doc1 <- document|>
  cursor_reach("Graph1") |>
  body_replace_all_text(old_value = "Graph", new_value = "Abbildung")

docx_summary(doc1)

print(doc1, target = "output/ausgabe0.docx")

####################################################################
# test 2
document <- read_docx(paste0("input/",c_filename,".docx"))
docx_summary(document)

doc2 <- document|>
  cursor_reach("Graph1") |>
  body_replace_all_text(old_value = "Graph", new_value = "Abbildung")|>
  cursor_backward()|>
  officer::body_remove()|>
  cursor_backward()|>
  body_add_gg(value = plot, height = 4.06, width = 4.39)|>
  cursor_reach("Tabelle 1")|>
  cursor_forward()|>
  officer::body_remove()|>
  cursor_backward()|>
  officer::body_add_table(table_data)

docx_summary(document)

print(doc2, target = "output/ausgabe1.docx")




# ######################################################################
# # Loading Libraries
# library(officer)
# library(ggplot2)
# # File name
# names <- "FileName" # Replace with the desired file name
# # Input path
# word_document <- "path_word.docx" # Loading the Word document
# # Output path
# path_in <- "desired directory" # Replace with the desired directory
# #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# # Graphs ~
# #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# # Sample data for the table
# table_data <- data.frame(
#   Name = c("Sartre", "Camus", "Kierkegaard"),
#   Birth_Year = c(1905, 1913, 1813),
#   Main_Works = c("Being and Nothingness", "The Stranger", "Fear and Trembling")
# )
# # Sample data for the plot
# data <- data.frame(
#   Philosopher = c("Sartre", "Camus", "Kierkegaard"),
#   Influence_Score = c(9, 7, 6)
# )
# # Create a bar chart using ggplot2
# plot <- ggplot(data, aes(x = Philosopher, y = Influence_Score, fill = Philosopher)) +
#   geom_bar(stat = "identity") +
#   labs(title = "Influence of Existentialist Philosophers", y = "Influence Score") +
#   theme_minimal()
# # Save the plot as an image file (e.g., PNG)
# ggsave("my_plot.png", plot, width = 6, height = 4)
# # Use cursor_reach to find and position the cursor before adding the image
# word_document <- cursor_reach(word_document, "GRAF1") |>
#   # Move the cursor forward to the desired location
#   cursor_forward() |>
#   # Add the graphic to the document
#   body_add_gg(value = plot, height = 4.06, width = 4.39) |>
#   body_replace_all_text(word_document, old_value = "GRAF1", new_value = " ",
#                         only_at_cursor = FALSE, warn = TRUE, fixed = TRUE)
# # Saving the modified document
# output_docx <- paste0(path_in, "/", names, ".docx")
# print(word_document, target = output_docx)
# # Close the Word document
# system(sprintf('start winword "%s"', output_docx))