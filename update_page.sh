#!/usr/bin/zsh
# Knits PDF versions of all tutorials in the content/tutorial/ and content/notes/
# as long as an index.Rmarkdown file exits in the directory

Rscript -e 'rmarkdown::clean_site(preview = FALSE); blogdown::build_site(build_rmd = "newfile")'
prefix="content/tutorial/"

for d in content/tutorial/*/ ; do
    if [ -f $d"index.Rmarkdown" ] && [ -f $d"pubdir/index.Rmd" ]; then
    contentname=$d"pubdir/index.Rmd"
    htmlcontentname=$d"onlinecontent.html"
    echo "Created pdf for tutorial "${d#"$prefix"}
    rcallpdf='rmarkdown::render(input = "'$contentname'", "pdf_document", output_file="pdfcontent.pdf")'
    rcallhtml='rmarkdown::render(input = "'$contentname'", "html_document", output_file="onlinecontent.html")'
    Rscript -e $rcallpdf
    Rscript -e $rcallhtml
fi
done

for d in content/notes/*/ ; do
    if [ -f $d"index.Rmarkdown" ] && [ -f $d"pubdir/index.Rmd" ]; then
    contentname=$d"pubdir/index.Rmd"
    htmlcontentname=$d"onlinecontent.html"
    echo "Created pdf for note "${d#"$prefix"}
    rcallpdf='rmarkdown::render(input = "'$contentname'", "pdf_document", output_file="pdfcontent.pdf")'
    rcallhtml='rmarkdown::render(input = "'$contentname'", "html_document", output_file="onlinecontent.html")'
    Rscript -e $rcallpdf
    Rscript -e $rcallhtml
fi
done
